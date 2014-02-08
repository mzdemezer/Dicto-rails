@DictoRails.module "WordsApp.Show.CategoriesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Category extends App.Views.ItemView
    template: "words/show/categories/list/category"
    tagName: "li"
