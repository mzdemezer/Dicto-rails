@DictoRails.module "SearchTabsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "search_tabs/list/list_layout"

    regions:
      panelRegion:    "#search-tab-panel-region"
      activeRegion:   "#search-tab-active-region"

  class List.SearchTab extends App.Views.ItemView
    template: "search_tabs/list/search_tab"
    tagName: "li"

  class List.SearchTabs extends App.Views.CompositeView
    template: "search_tabs/list/search_tabs"
    itemView: List.SearchTab
    itemViewContainer: "ul"
