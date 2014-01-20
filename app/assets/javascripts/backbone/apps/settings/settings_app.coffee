@DictoRails.module "SettingsApp", (SettingsApp, App, Backbone, Marionette, $, _) ->

  class SettingsApp.Router extends Marionette.AppRouter
    appRoutes:
      "settings" : "redirect"


  class SettingsApp.Controller extends App.Controllers.Base

    initialize: (options = {}) ->
      _.defaults options,
        defaultApp: "search_tabs"


    redirect: ->
      App.navigate "settings/" + @options.defaultApp, trigger: true


  App.addInitializer =>
    @controller = new SettingsApp.Controller
    new SettingsApp.Router { @controller }
