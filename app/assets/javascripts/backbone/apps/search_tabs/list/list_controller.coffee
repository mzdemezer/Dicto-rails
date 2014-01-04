@DictoRails.module "SearchTabsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @scheme } = options

      search_tabs = App.request "search_tabs:entities"

      App.execute "when:fetched", search_tabs, =>
        @layout = @getLayoutView()

        @listenTo @layout, "show", =>
          @activateTab search_tabs.first()

          @panelRegion search_tabs

        @show @layout


    activateTab: (model) ->
      if model.collection.setActive(model)
        App.vent.trigger "search:tab:activate",
          model: model
          region: @layout.activeRegion
          scheme: @scheme


    panelRegion: (search_tabs) ->
      searchTabsView = @getSearchTabsView(search_tabs)

      @listenTo searchTabsView, "childview:search:tab:clicked", (view, args) =>
        @activateTab args.model

      @layout.panelRegion.show searchTabsView


    getLayoutView: () ->
      new List.Layout

    getSearchTabsView: (search_tabs) ->
      new List.SearchTabs
        collection: search_tabs
