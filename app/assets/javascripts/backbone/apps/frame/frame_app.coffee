@DictoRails.module "FrameApp", (FrameApp, App, Backbone, Marionette, $, _) ->

  API =
    show: ->
      new FrameApp.Show.Controller
