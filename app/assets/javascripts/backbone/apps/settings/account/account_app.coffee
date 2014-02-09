@DictoRails.module "SettingsApp.Account", (Account, App, Backbone, Marionette, $, _) ->

  class Account.Router extends Marionette.AppRouter


  class Account.Controller extends App.Controllers.Base


  App.addInitializer ->
    controller = new Account.Controller
    new Account.Router { controller }
