@DictoRails.module "FrameApp", (FrameApp, App, Backbone, Marionette, $, _) ->

  API =
    show: =>
      @controller ||= new FrameApp.Show.Controller

    close: =>
      @controller = null

    layout: ->
      @show().layout

