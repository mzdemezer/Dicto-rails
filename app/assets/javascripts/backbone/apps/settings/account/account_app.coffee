@DictoRails.module "SettingsApp.Account", (Account, App, Backbone, Marionette, $, _) ->

  class Account.Router extends Marionette.AppRouter
    appRoutes:
      "settings/account"      : "show"


  class Account.Controller extends App.Controllers.Base

    show: ->
      new Account.Show.Controller


  App.addInitializer ->
    controller = new Account.Controller
    new Account.Router { controller }
