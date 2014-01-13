@DictoRails.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->

      word_sets = App.request "word:sets:entities"

      App.execute "when:fetched", word_sets, =>
        @listView = @getListView word_sets

        @listenTo @listView, "search:field:register", (searchField) ->
          App.vent.trigger "default:active:element:register", searchField

        @listenTo @listView, "search:form:submit", =>
          data = Backbone.Syphon.serialize @listView
          data.scheme = data.scheme.trim()
          App.vent.trigger "search:form:submit", data

        @show @listView


    setCurrentWordSet: (id) ->

    getListView: (word_sets) ->
      new List.Header
        collection: word_sets
