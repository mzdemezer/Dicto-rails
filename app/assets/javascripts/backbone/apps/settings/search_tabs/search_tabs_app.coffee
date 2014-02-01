@DictoRails.module "SettingsApp.SearchTabs", (SearchTabs, App, Backbone, Marionette, $, _) ->

  class SearchTabs.Router extends Marionette.AppRouter
    appRoutes:
      "settings/search_tabs" : "list"


  class SearchTabs.Controller extends App.Controllers.Base

    list: ->
      new SearchTabs.List.Controller


  App.addInitializer ->
    controller = new SearchTabs.Controller

    new SearchTabs.Router { controller }

