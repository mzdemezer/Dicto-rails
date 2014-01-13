@DictoRails.module "WordsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "words/show/show_layout"

    regions:
      wordRegion:       ".words-show-word-region"
      meaningsRegion:   ".words-show-meanings-region"

    triggers:

  class Show.Word extends App.Views.ItemView
    template: "words/show/word"
