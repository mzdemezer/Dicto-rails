@DictoRails.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @word_set_id } = options

      @word_sets = App.request "word:sets:entities"

      App.execute "when:fetched", @word_sets, =>
        @setCurrentWordSet @word_set_id
        @listView = @getListView @word_sets

        @listenTo @listView, "search:field:register", (searchField) ->
          App.vent.trigger "default:active:element:register", searchField

        @listenTo @listView, "search:form:submit", =>
          data = Backbone.Syphon.serialize @listView
          data.scheme = data.scheme.trim()
          App.vent.trigger "search:form:submit", data

        @show @listView


    onClose: ->
      @word_sets = null


    setCurrentWordSet: (id) ->
      @word_set_id = id
      @word_sets.setCurrent id
      @listView.render(collection: @word_sets) if @listView?


    getListView: (word_sets) ->
      new List.Header
        collection: word_sets
