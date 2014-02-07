@DictoRails.module "WordSetsApp.Show.CategoriesApp", (CategoriesApp, App, Backbone, Marionette, $, _) ->

  class CategoriesApp.Controller extends App.Controllers.Base

    initialize: (options) ->
      { wordSet } = options
      word_set_id = wordSet.id
      categories = App.request "categories:entities", word_set_id

      categoriesView = @getCategoriesView(categories)

      @listenTo categoriesView, "category:node:show", (wrapper) =>
        { model, categoryRegion } = wrapper
        if model?.isNew()
          controller = @newFormController(model, categoryRegion)
        else
          @showCategory(model, categoryRegion)

      @listenTo App.vent, "category:cancelled category:updated category:created", (model, region) =>
        @showCategory(model, region)

      @listenTo App.vent, "new:category:cancelled", (model) =>
        model.destroy()

      @listenTo categoriesView, "category:add:clicked", (args) =>
        { collection } = args
        parent_id = collection.parents?[0].id
        newCategory = App.request "new:category:entity", { word_set_id, parent_id }
        collection.add(newCategory)

      @listenTo categoriesView, "category:delete:clicked", (args) =>
        { model } = args
        if confirm "Are you sure you want to delete '#{model.get("name")}'?"
          model.destroy
            error: -> alert("You can't do that!")

      @listenTo categoriesView, "category:edit:clicked", (args) =>
        { view, model } = args
        controller = @newFormController(model, view.categoryRegion)

      @show categoriesView,
        loading: true


    showCategory: (model, region) ->
      categoryView = @getCategoryView(model)
      region.show(categoryView)


    getCategoriesView: (collection) ->
      new CategoriesApp.Categories { collection }

    getCategoryView: (model) ->
      new CategoriesApp.Category { model }

    newFormController: (model, region) ->
      new CategoriesApp.Form.Controller { model, region }

