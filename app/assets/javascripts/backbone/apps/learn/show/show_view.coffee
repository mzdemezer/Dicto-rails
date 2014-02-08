@DictoRails.module "LearnApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "learn/show/layout"

    regions:
      formRegion: ".form-region"
