@DictoRails.module "WordsApp.Show.CategoriesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { model } = options
      categories = model.get("categories")

      listView = @getListView(categories)

      @show listView


    getListView: (collection) ->
      new List.Categories { collection }
