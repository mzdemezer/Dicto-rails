@DictoRails.module "SettingsApp.SearchTabs.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Settings

    initialize: ->
      searchTabs = App.request "search:tabs:entities"

      searchTabsView = @getSearchTabsView(searchTabs)

      @listenTo searchTabsView, "new:search:tab:clicked", =>
        App.request "new:search:tab:entity"

      @listenTo searchTabsView, "childview:show", (wrapper) =>
        { model, region } = wrapper

        if searchTabs.get(model)?
          if model.isNew()
            @newSearchTab(model, region)
          else
            @showSearchTab(model, region)

      @listenTo searchTabsView, "childview:search:tab:edit:clicked", (wrapper) =>
        App.vent.trigger "edit:search:tab", wrapper.model, wrapper.region

      @listenTo searchTabsView, "childview:search:tab:delete:clicked", (view, args) =>
        @destroy(args.model)

      @listenTo App.vent, "search:tab:cancelled search:tab:updated search:tab:created", (searchTab, region) =>
        @showSearchTab searchTab, region

      @listenTo App.vent, "new:search:tab:cancelled", (searchTab) =>
        console.log "new cancelled"
        searchTab.destroy()

      @show searchTabsView


    newSearchTab: (model, region) ->
      App.vent.trigger "new:search:tab", model, region

    showSearchTab: (searchTab, region) ->
      if region?
        searchTab = @getSearchTabView(searchTab)
        region.show searchTab

    destroy: (searchTab) ->
      if confirm "Are you sure you want to delete '#{searchTab.get("host")}' tab?"
        searchTab.destroy
          error: ->
            alert("You can't do that!")


    getSearchTabsView: (searchTabs) ->
      new List.SearchTabs
        collection: searchTabs

    getSearchTabView: (searchTab) ->
      new List.SearchTab
        model: searchTab
