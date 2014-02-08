@DictoRails.module "Base.CategoriesApp", (CategoriesApp, App, Backbone, Marionette, $, _) ->

  class CategoriesApp.Category extends App.Views.Layout
    template: "_base/categories/category"
