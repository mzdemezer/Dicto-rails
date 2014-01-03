@DictoRails.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    list: ->
      new HeaderApp.List.Controller
        region: App.headerRegion

  App.vent.on "search:form:submit", (data) ->
    App.navigate "words/#{data.scheme}", trigger: true

  HeaderApp.on "start", ->
    API.list()
