@DictoRails.module "Entities.Categories", (Categories, App, Backbone, Marionette, $, _) ->

  class Categories.Model extends App.Entities.Model
    urlRoot: -> Routes.word_set_categories_path(@get("word_set_id"))

    relations: [
      type:           Backbone.Many
      key:            "subcategories"
      relatedModel:   Backbone.Self
    ]

    defaults:
      name:           ""
      subcategories:  []


  _reset = App.Entities.Collection::reset

  class Categories.Collection extends App.Entities.Collection
    model:   Categories.Model
    url: -> Routes.word_set_categories_path(@word_set_id)

    initialize: (collection, options) ->
      { @word_set_id } = options

    reset: (collection, options) ->
      # TODO: pack this auto hash-join somehow
      # function list_children(parent_id, c) { if(c.models.length != 0) { _(c.models).each(function(model) { console.log(parent_id, model.id); if(model.get("subcategories")) { list_children(model.id, model.get("subcategories")); } }); } }
      hash = _.object(_(collection).pluck("id"), collection)
      _(collection).each (model) ->
        parent_id = model["parent_id"]
        return unless parent_id?
        parent = hash[parent_id]
        if parent?
          parent.subcategories ?= []
          parent.subcategories.push(model)
      collection = _(collection).where { parent_id: null }

      _reset.apply @, [collection, options]


  class Categories.Controller extends App.Controllers.Base

    getCategories: (options) ->
      categories = new Categories.Collection([], options)
      categories.fetch
        reset: true
      categories

    newCategory: (options) ->
      new Categories.Model(options)


  Categories.on "start", ->
    controller = new Categories.Controller

    App.reqres.setHandler "categories:entities", (word_set_id) ->
      controller.getCategories { word_set_id }

    App.reqres.setHandler "new:category:entity", ->
      controller.newCategory()
