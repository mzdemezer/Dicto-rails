@DictoRails.module "WordsApp.Show.CategoriesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Category extends App.Views.ItemView
    template: "words/show/categories/list/category"
    tagName: "li"

  class List.Categories extends App.Views.CompositeView
    template: "words/show/categories/list/categories"
    itemView: List.Category
    itemViewContainer: "ul"

    triggers:
      "click .word-categories-edit" : "edit:word:categories:clicked"
