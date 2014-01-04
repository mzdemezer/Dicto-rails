@DictoRails.module "SearchTabsApp", (SearchTabsApp, App, Backbone, Marionette, $, _) ->

  API =
    list: (options) ->
      options.region ?= App.request "frame:region:right"
      new SearchTabsApp.List.Controller options

    show: (options) ->
      new SearchTabsApp.Show.Controller options

  App.vent.on "words:search", (scheme) ->
    API.list({ scheme })

  App.vent.on "search:tab:activate", (options) ->
    API.show(options)
