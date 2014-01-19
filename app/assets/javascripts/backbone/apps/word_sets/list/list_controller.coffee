@DictoRails.module "WordSetsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      word_sets = App.request "word:sets:entities"

      @layout = @getLayoutView word_sets

      @listenTo @layout, "show", =>
        @panelRegion()
        @wordSetsRegion word_sets

      @show @layout,
        loading: true


    panelRegion: ->
      panelView = @getPanelView()

      @layout.panelRegion.show panelView

    wordSetsRegion: (word_sets) ->
      wordSetsView = @getWordSetsView word_sets
      @layout.wordSetsRegion.show wordSetsView


    getLayoutView: (word_sets) ->
      new List.Layout
        collection: word_sets

    getPanelView: ->
      new List.Panel

    getWordSetsView: (word_sets) ->
      new List.WordSets
        collection: word_sets
