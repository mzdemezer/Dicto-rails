@DictoRails.module "MeaningsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { word } = options
      if word?
        @meanings = word.get("meanings")
      else
        @meanings = App.request "new:meanings:entities", []

      listView = @getListView meanings
      @show listView


    getListView: (meanings) ->
      new List.Meanings
        collection: meanings
