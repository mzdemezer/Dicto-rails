@DictoRails.module "SearchTabsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "search_tabs/list/list_layout"

    regions:
      panelRegion:    "#search-tab-panel-region"
      activeRegion:   "#search-tab-active-region"

