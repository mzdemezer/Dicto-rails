@DictoRails.module "WordsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { scheme } = options

      App.vent.trigger "words:scheme:changed", scheme

      words = App.request "words:entities", options

      @layout = @getLayoutView(words)

      @listenTo @layout, "show", =>
        @panelRegion()
        @wordsRegion words

      @show @layout,
        loading: true

    panelRegion: ->
      panelView = @getPanelView()
      @layout.panelRegion.show panelView

    wordsRegion: (words) ->
      wordsView = @getWordsView words
      @layout.wordsRegion.show wordsView


    getWordsView: (words) ->
      new List.Words
        collection: words

    getLayoutView: (words) ->
      new List.Layout
        collection: words

    getPanelView: ->
      new List.Panel
