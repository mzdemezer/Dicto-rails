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


    getLayoutMainRegion: ->
      @showController ||= new SettingsApp.Show.Controller
      @showController.layout.mainRegion

    layoutClosed: ->
      @showController = null


  App.vent.on "settings:layout:closed", =>
    @controller.layoutClosed()

  App.reqres.setHandler "settings:layout:main:region", =>
    @controller.getLayoutMainRegion()


  App.addInitializer =>
    @controller = new SettingsApp.Controller
    new SettingsApp.Router { @controller }
