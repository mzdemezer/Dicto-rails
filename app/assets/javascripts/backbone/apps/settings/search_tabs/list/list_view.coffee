@DictoRails.module "SettingsApp.SearchTabs.List", (List, App, Backbone, Marionette, $, _) ->

  class List.SearchTabs extends App.Views.CompositeView
    template: "settings/search_tabs/list/search_tabs"
    itemViewContainer: ".settings-search-tabs"

    triggers:
      "click #new-search-tab-button" : "new:search:tab:clicked"
