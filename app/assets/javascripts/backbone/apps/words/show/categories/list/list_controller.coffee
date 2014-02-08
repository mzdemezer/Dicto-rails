@DictoRails.module "WordsApp.Show.CategoriesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { model } = options
      categories = model.get("categories")

      listView = @getListView(categories)
      @listenTo listView, "edit:word:categories:clicked", =>
        App.vent.trigger "edit:word:categories", { model, @region }

      @show listView


    getListView: (collection) ->
      new List.Categories { collection }
