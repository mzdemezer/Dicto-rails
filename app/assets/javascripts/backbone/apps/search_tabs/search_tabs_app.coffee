@DictoRails.module "SearchTabsApp", (SearchTabsApp, App, Backbone, Marionette, $, _) ->

  API =
    list: (options) ->
      options.region ?= App.request "frame:region:right"
      new SearchTabsApp.List.Controller options

  App.vent.on "words:search", (scheme) ->
    API.list({ scheme })

