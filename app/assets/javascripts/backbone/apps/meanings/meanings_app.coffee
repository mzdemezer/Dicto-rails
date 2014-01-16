@DictoRails.module "MeaningsApp", (MeaningsApp, App, Backbone, Marionette, $, _) ->

  API =
    list: (meanings, region) ->
      region ?= App.request "frame:region:left"
      new MeaningsApp.List.Controller { meanings, region }


  App.vent.on "list:meanings", (meanings, region) ->
    API.list meanings, region
