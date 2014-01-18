@DictoRails.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @word_set_id } = options

      @word_sets = App.request "word:sets:entities"

      App.execute "when:fetched", @word_sets, =>
        @setCurrentWordSet @word_set_id

        @listenTo App.vent, "current:word:set:changed", (id) =>
          @setCurrentWordSet id

        @layout = @getLayoutView()

        @listenTo @layout, "show", =>
          @wordSetsRegion @word_sets

        @listenTo @layout, "search:field:register", (searchField) ->
          App.vent.trigger "default:active:element:register", searchField

        @listenTo @layout, "search:form:submit", =>
          data = Backbone.Syphon.serialize @layout
          data.scheme = data.scheme.trim()
          App.vent.trigger "search:form:submit", data

        @show @layout


    wordSetsRegion: (word_sets) ->
      @wordSetsView = @getWordSetsView word_sets
      @layout.wordSetsRegion.show @wordSetsView


    onClose: ->
      @word_sets = null


    setCurrentWordSet: (id) ->
      @word_set_id = id
      @word_sets.setCurrent id
      @wordSetsView.render(collection: @word_sets) if @wordSetsView?

    getWordSetsView: (word_sets) ->
      new List.WordSets
        collection: word_sets

    getLayoutView: ->
      new List.Layout
