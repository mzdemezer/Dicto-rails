@DictoRails.module "SearchTabsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { scheme } = options

      search_tabs = App.request "search_tabs:entities"

      App.execute "when:fetched", search_tabs, =>
        @layout = @getLayoutView()

        @listenTo @layout, "show", =>
          @panelRegion search_tabs

        @show @layout


    panelRegion: (search_tabs) ->
      searchTabsView = @getSearchTabsView(search_tabs)
      @layout.panelRegion.show searchTabsView


    getLayoutView: () ->
      new List.Layout

    getSearchTabsView: (search_tabs) ->
      new List.SearchTabs
        collection: search_tabs
