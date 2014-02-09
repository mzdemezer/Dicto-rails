@DictoRails.module "SettingsApp", (SettingsApp, App, Backbone, Marionette, $, _) ->

  class SettingsApp.Router extends Marionette.AppRouter
    appRoutes:
      "settings" : "redirect"


  class SettingsApp.Controller extends App.Controllers.Base

    initialize: (options = {}) ->
      _.defaults options,
        defaultRoute: Routes.settings_account_path()


    redirect: ->
      App.navigate @options.defaultRoute, trigger: true


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
