@DictoRails.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    list: =>
      @controller = new HeaderApp.List.Controller
        region: App.headerRegion

    setCurrentWordSet: (id) =>
      @controller.setCurrentWordSet(id) if @controller


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

  App.vent.on "current:word:set:changed", (id) ->
    API.setCurrentWordSet id


  HeaderApp.on "start", ->
    API.list()
