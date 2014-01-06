@DictoRails.module "WordsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { scheme } = options

      App.vent.trigger "words:scheme:changed", scheme

      words = App.request "words:entities", options

      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @wordsRegion words

      @show @layout

    wordsRegion: (words) ->
      wordsView = @getWordsView words

      @layout.wordsRegion.show wordsView,
        loading: true


    getWordsView: (words) ->
      new List.Words
        collection: words

    getLayoutView: ->
      new List.Layout
