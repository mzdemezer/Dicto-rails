@DictoRails.module "WordsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { scheme } = options

      App.vent.trigger "words:scheme:changed", scheme

      words = App.request "words:entities", options
      wordsView = @getWordsView words

      @show wordsView,
        loading: true

    getWordsView: (words) ->
      new List.Words
        collection: words
