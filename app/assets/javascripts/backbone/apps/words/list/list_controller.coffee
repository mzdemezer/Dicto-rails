@DictoRails.module "WordsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.LeftFrame

    initialize: (options) ->
      { @word_set_id } = options
      schemeText = options.scheme

      @scheme = App.request "scheme:entity"
      @scheme.set("text", schemeText)
      App.vent.trigger "words:search"

      words = App.request "words:entities", options

      @layout = @getLayoutView words

      @listenTo @layout, "show", =>
        @listenTo App.vent, "new:word:cancelled", =>
          @panelRegion()

        @panelRegion()
        @wordsRegion words

      @show @layout,
        loading: true


    panelRegion: ->
      panelView = @getPanelView()

      @listenTo panelView, "new:word:button:clicked", =>
        @layout.panelRegion.close()
        @newRegion()

      @layout.panelRegion.show panelView

    wordsRegion: (words) ->
      wordsView = @getWordsView words

      @listenTo wordsView, "childview:word:delete:clicked", (child, args) ->
        unless App.request "delete:word", args.model
          alert("You can't do that!")

      @layout.wordsRegion.show wordsView

    newRegion: ->
      App.execute "new:word", @word_set_id, @scheme.get("text"), @layout.newWordRegion


    getWordsView: (words) ->
      new List.Words
        collection: words

    getLayoutView: (words) ->
      new List.Layout
        collection: words

    getPanelView: (words) ->
      new List.Panel { @word_set_id, renderShowAllButton: @renderShowAllButton() }

    renderShowAllButton: ->
      !!@scheme.get("text")
