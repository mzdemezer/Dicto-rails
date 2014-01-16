@DictoRails.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    list: ->
      new HeaderApp.List.Controller
        region: App.headerRegion

  App.vent.on "search:form:submit", (data) ->
    if data.scheme
      route = "word_sets/#{data.word_set_id}/search/#{data.scheme}"
    else
      route = Routes.word_set_words_path(data.word_set_id)
    App.navigate route, trigger: true


  App.vent.on "default:active:element:register", (searchField) =>
    @searchField = searchField

  App.reqres.setHandler "default:active:element", =>
    @searchField


  HeaderApp.on "start", ->
    API.list()
