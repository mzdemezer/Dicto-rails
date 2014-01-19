@DictoRails.module "WordSetsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      word_sets = App.request "word:sets:entities"

      @layout = @getLayoutView word_sets

      @listenTo @layout, "show", =>
        @listenTo App.vent, "new:word:set:cancelled", =>
          @panelRegion()

        @panelRegion()
        @wordSetsRegion word_sets

      @show @layout,
        loading: true


    panelRegion: ->
      panelView = @getPanelView()

      @listenTo panelView, "new:word:set:button:clicked", =>
        @layout.panelRegion.close()
        @newRegion()

      @layout.panelRegion.show panelView

    newRegion: ->
      App.execute "new:word:set", @layout.newWordSetRegion

    wordSetsRegion: (word_sets) ->
      wordSetsView = @getWordSetsView word_sets

      @listenTo wordSetsView, "childview:word:set:delete:clicked", (child, args) ->
        unless App.request "delete:word:set", args.model
          alert("You can't do that!")

      @layout.wordSetsRegion.show wordSetsView


    getLayoutView: (word_sets) ->
      new List.Layout
        collection: word_sets

    getPanelView: ->
      new List.Panel

    getWordSetsView: (word_sets) ->
      new List.WordSets
        collection: word_sets
