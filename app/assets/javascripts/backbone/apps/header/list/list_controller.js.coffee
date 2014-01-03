@DictoRails.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      @listView = @getListView()
      @listenTo @listView, 'search:form:submit', =>
        data = Backbone.Syphon.serialize @listView
        App.vent.trigger 'search:form:submit', data
      @show @listView

    getListView: ->
      new List.Header
