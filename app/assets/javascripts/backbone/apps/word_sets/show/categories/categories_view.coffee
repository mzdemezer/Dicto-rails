@DictoRails.module "WordSetsApp.Show.CategoriesApp", (CategoriesApp, App, Backbone, Marionette, $, _) ->

  class CategoriesApp.Category extends App.Views.ItemView
    template: "word_sets/show/categories/category"


  class CategoriesApp.CategoryWrapper extends App.Views.Layout
    template: "word_sets/show/categories/category_wrapper"

    regions:
      categoryRegion: ".category-region"
      childrenRegion: ".category-children-region"

    onShow: ->
      childrenView = new CategoriesApp.Categories
        collection: @model.get("subcategories")

      @triggerMethod("category:node:show")
      #TODO: new view method/loop/am I doing it wrong?
      @listenTo childrenView, "category:node:show", (args...) =>
        @triggerMethod "category:node:show", _(args).last()

      @listenTo childrenView, "category:add:clicked", (args...) =>
        @triggerMethod "category:add:clicked", _(args).last()

      @listenTo childrenView, "category:delete:clicked", (args...) =>
        @triggerMethod "category:delete:clicked", _(args).last()

      @listenTo childrenView, "category:edit:clicked", (args...) =>
        @triggerMethod "category:edit:clicked", _(args).last()

      @childrenRegion.show childrenView

    triggers:
      "click .category-edit"   : "category:edit:clicked"
      "click .category-delete" : "category:delete:clicked"


  class CategoriesApp.Categories extends App.Views.CompositeView
    template: "word_sets/show/categories/categories"
    itemView: CategoriesApp.CategoryWrapper
    itemViewContainer: ".categories-container"

    initialize: ->
      #TODO: new view method/loop/am I doing it wrong?
      @on "childview:category:node:show", (args...) =>
        @triggerMethod "category:node:show", _(args).last()

      @on "childview:category:add:clicked", (args...) =>
        @triggerMethod "category:add:clicked", _(args).last()

      @on "childview:category:edit:clicked", (args...) =>
        @triggerMethod "category:edit:clicked", _(args).last()

      @on "childview:category:delete:clicked", (args...) =>
        @triggerMethod "category:delete:clicked", _(args).last()

    triggers: ->
      "click .category-add" : "category:add:clicked"
