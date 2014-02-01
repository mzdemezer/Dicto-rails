@DictoRails.module "SettingsApp.SearchTabs", (SearchTabs, App, Backbone, Marionette, $, _) ->

  class SearchTabs.Router extends Marionette.AppRouter
    appRoutes:
      "settings/search_tabs" : "list"


  class SearchTabs.Controller extends App.Controllers.Base

    list: ->
      new SearchTabs.List.Controller

    edit: (searchTab, region, action = "edit") ->
      new SearchTabs.Edit.Controller { searchTab, region, action }


  App.addInitializer ->
    controller = new SearchTabs.Controller

    App.vent.on "edit:search:tab", (searchTab, region) ->
      controller.edit searchTab, region

    App.vent.on "new:search:tab", (searchTab, region) ->
      controller.edit searchTab, region, "new"

    new SearchTabs.Router { controller }

