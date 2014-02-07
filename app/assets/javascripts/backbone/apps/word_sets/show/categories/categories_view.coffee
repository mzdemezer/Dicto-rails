@DictoRails.module "WordSetsApp.Show.CategoriesApp", (CategoriesApp, App, Backbone, Marionette, $, _) ->

  class CategoriesApp.CategoryWrapper extends App.Views.Layout
    template: "word_sets/show/categories/category_wrapper"

    regions:
      categoryRegion: ".category-region"
      childrenRegion: ".category-children-region"
