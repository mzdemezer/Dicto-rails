@DictoRails.module "WordSetsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "word_sets/show/layout"

    regions:
      wordSetRegion: "#word_set-show-region"
