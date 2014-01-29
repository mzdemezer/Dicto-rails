@DictoRails.module "SearchTabsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.RightFrame

    initialize: (options) ->
      searchTabs = App.request "search:tabs:entities"

      App.execute "when:fetched", searchTabs, =>
        @layout = @getLayoutView()

        activeSearchTab = searchTabs.getActive()

        @listenTo @layout, "show", =>
          @activateTab activeSearchTab

          @panelRegion searchTabs

        @show @layout


    activateTab: (model) ->
      if model.activate()
        App.vent.trigger "search:tab:activate",
          model: model
          region: @layout.activeRegion


    panelRegion: (searchTabs) ->
      searchTabsView = @getSearchTabsView(searchTabs)

      @listenTo searchTabsView, "childview:search:tab:clicked", (view, args) =>
        @activateTab args.model

      @layout.panelRegion.show searchTabsView


    getLayoutView: () ->
      new List.Layout

    getSearchTabsView: (searchTabs) ->
      new List.SearchTabs
        collection:searchTabs
