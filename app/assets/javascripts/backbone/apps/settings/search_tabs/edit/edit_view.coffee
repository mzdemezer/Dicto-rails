@DictoRails.module "SettingsApp.SearchTabs.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.View extends App.Views.ItemView
    template: "settings/search_tabs/edit/search_tab"
