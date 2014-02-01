@DictoRails.module "SettingsApp.SearchTabs.List", (List, App, Backbone, Marionette, $, _) ->

  class List.SearchTabWrapper extends App.Views.Layout
    template: "settings/search_tabs/list/search_tab_wrapper"
    tagName: "li"
    className: "list-group-item"

    regions:
      region: ".search-tab-region"


  class List.SearchTabs extends App.Views.CompositeView
    template: "settings/search_tabs/list/search_tabs"
    itemView: List.SearchTabWrapper
    itemViewContainer: ".settings-search-tabs"

    triggers:
      "click #new-search-tab-button" : "new:search:tab:clicked"
