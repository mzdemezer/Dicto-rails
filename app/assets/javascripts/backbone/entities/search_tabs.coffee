@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.SearchTab extends App.Entities.Model
    urlRoot: -> Routes.search_tabs_path()

  class Entities.SearchTabs extends App.Entities.Collection
    model: Entities.SearchTab
    url: -> Routes.search_tabs_path()

  API =
    getSearchTabs: () ->
      search_tabs = new Entities.SearchTabs
      search_tabs.fetch
        reset: true
      search_tabs

  App.reqres.setHandler "search_tabs:entities", () ->
    API.getSearchTabs()
