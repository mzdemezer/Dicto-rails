@DictoRails.module "SettingsApp.Account.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.View extends App.Views.ItemView
    template: "settings/account/show/account"
    className: "panel panel-default"
