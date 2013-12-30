@DictoRails.module "SearchApp", (SearchApp, App, Backbone, Marionette, $, _) ->

  class SearchApp.Router extends Marionette.AppRouter
    appRoutes:
      "search/:scheme" : "list"

  API =
    list: ->
      new SearchApp.List.Controller

  App.addInitializer ->
    new SearchApp.Router
      controller: API
