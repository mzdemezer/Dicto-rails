@DictoRails.module "SettingsApp.SearchTabs.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Settings

    initialize: ->
      @show @getView()


    getView: ->
      new App.Views.Shared.NotFound
