@DictoRails.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @word_set_id } = options

      @word_sets = App.request "word:sets:entities"
      @links = @getLinks()

      App.execute "when:fetched", @word_sets, =>
        @setCurrentWordSet @word_set_id

        @listenTo App.vent, "current:word:set:changed", (id) =>
          @setCurrentWordSet id

        @layout = @getLayoutView()

        @listenTo @layout, "show", =>
          @wordSetsRegion @word_sets
          @linksRegion()

        @listenTo @layout, "search:field:register", (searchField) ->
          App.vent.trigger "default:active:element:register", searchField

        @listenTo @layout, "search:form:submit", =>
          data = Backbone.Syphon.serialize @layout
          data.scheme = data.scheme.trim()
          App.vent.trigger "search:form:submit", data

        @show @layout


    onClose: ->
      @word_sets = null
      @links = null


    wordSetsRegion: (word_sets) ->
      @wordSetsView = @getWordSetsView word_sets
      @layout.wordSetsRegion.show @wordSetsView

    linksRegion: ->
      linksView = @getLinksView @links
      window.view = linksView
      @layout.linksRegion.show linksView


    getLinks: ->
      App.request "link:entities", [
          { text: "Sets",         href: Routes.word_sets_path() }
          { text: "Learn",        href: "learn" }
          { text: "Settings",     href: "settings" }
        ],
        className:       "nav navbar-nav"
        tagName:         "ul"
        item:
          wrapperTag:    "li"
          className:     null


    setCurrentWordSet: (id) ->
      @word_set_id = id
      @word_sets.setCurrent id
      @wordSetsView.render(collection: @word_sets) if @wordSetsView?

    getWordSetsView: (word_sets) ->
      new List.WordSets
        collection: word_sets

    getLayoutView: ->
      new List.Layout

    getLinksView: (links) ->
      new App.Views.Shared.Links
        collection: links
