@DictoRails.module "LearnApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "learn/show/layout"

    regions:
      formRegion: ".form-region"


  class Show.WordSet extends App.Views.ItemView
    template: "learn/show/word_set"
