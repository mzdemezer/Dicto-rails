@DictoRails.module "LearnApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      collection = App.request "word:sets:entities"

      view = @getView(collection)

      @show view


    getView: (collection) ->
      new List.WordSets { collection }
