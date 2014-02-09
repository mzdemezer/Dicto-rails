@DictoRails.module "SettingsApp.Account", (Account, App, Backbone, Marionette, $, _) ->

  class Account.Router extends Marionette.AppRouter
    appRoutes:
      "settings/account"      : "show"
      "settings/account/edit" : "edit"


  class Account.Controller extends App.Controllers.Base

    show: ->
      new Account.Show.Controller

    edit: ->
      new Account.Edit.Controller


  App.addInitializer ->
    controller = new Account.Controller
    new Account.Router { controller }

    App.vent.on "edit:account:cancel current:user:updated", ->
      App.navigate Routes.settings_account_path(), trigger: true
