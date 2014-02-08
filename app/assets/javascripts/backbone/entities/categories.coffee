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
      roots = _(collection).where { parent_id: null }

      _reset.apply @, [roots, options]

  __reset = Categories.Collection::reset
  class Categories.WordCategoriesCollection extends Categories.Collection
    model: Categories.Model
    initialize: (collection, options) ->
      { checked } = options
      @checked = _.object(checked.pluck("id"), checked.models)
      super

    reset: (collection, options) ->
      _(collection).each (category) =>
        category.checked = true if @checked[category.id]?
      __reset.apply @, [collection, options]



  class Categories.Controller extends App.Controllers.Base

    getCategories: (options) ->
      categories = new Categories.Collection([], options)
      categories.fetch
        reset: true
      categories

    getWordCategories: (options) ->
      categories = new Categories.WordCategoriesCollection([], options)
      categories.fetch
        reset: true
      categories

    newCategory: (options) ->
      new Categories.Model(options)


  Categories.on "start", ->
    controller = new Categories.Controller

    App.reqres.setHandler "categories:entities", (word_set_id) ->
      controller.getCategories { word_set_id }

    App.reqres.setHandler "word:categories:entities", (word_set_id, checked) ->
      controller.getWordCategories { word_set_id, checked }

    App.reqres.setHandler "new:category:entity", (options) ->
      controller.newCategory(options)
