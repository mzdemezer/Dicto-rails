@DictoRails.module "FrameApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "frame/show/show_layout"
