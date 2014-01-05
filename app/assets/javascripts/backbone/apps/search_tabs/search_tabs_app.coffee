@DictoRails.module "SearchTabsApp", (SearchTabsApp, App, Backbone, Marionette, $, _) ->

  API =
    list: (options) ->
      options.region ?= App.request "frame:region:right"
      new SearchTabsApp.List.Controller options

    show: (options) ->
      new SearchTabsApp.Show.Controller options

  App.vent.on "words:search", (scheme) =>
    API.list { scheme, @last_id }

  App.vent.on "search:tab:activate", (options) =>
    @last_id = options.model.id
    API.show options
