@DictoRails.module "MeaningsApp", (MeaningsApp, App, Backbone, Marionette, $, _) ->

  API =
    list: (word, region) ->
      region ?= App.request "frame:region:left"
      new MeaningsApp.List.Controller { word, region }

    edit: (meaning, region) ->
      new MeaningsApp.Edit.Controller { meaning, region }

    newMeaning: (meaning, region) ->
      new MeaningsApp.New.Controller { meaning, region }


  App.vent.on "list:meanings", (meanings, region) ->
    API.list meanings, region

  App.vent.on "edit:meaning", (meaning, region) ->
    API.edit meaning, region

  App.vent.on "new:meaning", (meaning, region) ->
    API.newMeaning meaning, region
