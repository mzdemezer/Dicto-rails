@DictoRails.module "WordSetsApp.Show.CategoriesApp", (CategoriesApp, App, Backbone, Marionette, $, _) ->

  class CategoriesApp.Category extends App.Views.ItemView
    template: "word_sets/show/categories/category"


  class CategoriesApp.CategoryWrapper extends App.Views.Layout
    template: "word_sets/show/categories/category_wrapper"

    regions:
      categoryRegion: ".category-region"
      childrenRegion: ".category-children-region"

    triggers:
      "click .category-edit"   : "category:edit:clicked"
      "click .category-delete" : "category:delete:clicked"


  class CategoriesApp.Categories extends App.Views.CompositeView
    template: "word_sets/show/categories/categories"
    itemView: CategoriesApp.CategoryWrapper
    itemViewContainer: ".categories-container"

    triggers: ->
      "click .category-add" : "category:add:clicked"
