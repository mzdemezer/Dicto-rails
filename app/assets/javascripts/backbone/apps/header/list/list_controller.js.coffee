@DictoRails.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->

      word_sets = App.request "word:sets:entities"

      App.execute "when:fetched", word_sets, =>
        @listView = @getListView(word_sets)

        @listenTo @listView, "search:form:submit", =>
          data = Backbone.Syphon.serialize @listView
          App.vent.trigger "search:form:submit", data

        @show @listView


    getListView: (word_sets) ->
      new List.Header
        collection: word_sets
