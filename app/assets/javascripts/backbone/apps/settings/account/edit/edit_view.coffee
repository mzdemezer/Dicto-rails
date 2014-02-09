DictoRails.module "SettingsApp.Account.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.View extends App.Views.ItemView
    template: "settings/account/edit/account"

    form:
      className: "form-page form-horizontal"
