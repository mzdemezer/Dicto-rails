@DictoRails.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    list: ->
      new HeaderApp.List.Controller
        region: App.headerRegion

  App.vent.on "search:form:submit", (data) ->
    App.navigate "word_set/#{data.word_set_id}/words/#{data.scheme}", trigger: true


  App.vent.on "default:active:element:register", (searchField) =>
    @searchField = searchField

  App.reqres.setHandler "default:active:element", =>
    @searchField


  HeaderApp.on "start", ->
    API.list()
