@DictoRails.module "WordsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      words = App.request "words:entities", options
      # searchTabs = App.request "search_tabs:entities", options

      App.execute "when:fetched", words, =>
        @layout = @getLayoutView words

        @listenTo @layout, "show", =>
          @nativeRegion words
          @foreignRegion()

        @show @layout

    nativeRegion: (words) ->
      wordsView = @getWordsView words

      @layout.nativeRegion.show wordsView

    foreignRegion: () ->
      searchTabsView = @getSearchTabsView()

      @layout.foreignRegion.show searchTabsView

    getWordsView: (words) ->
      new List.Words
        collection: words

    getSearchTabsView: () ->
      new List.SearchTabs

    getLayoutView: (words) ->
      new List.Layout
        collection: words
