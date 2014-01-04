@DictoRails.module "FrameApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: () ->
      @layout = @getLayoutView()

      @show @layout

    getLayoutView: () ->
      new Show.Layout

    onClose: () ->
      App.vent.trigger "frame:close"
