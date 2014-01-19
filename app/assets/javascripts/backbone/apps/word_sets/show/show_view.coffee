@DictoRails.module "WordSetsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "word_sets/show/layout"

    regions:
      wordSetRegion: "#word_set-show-region"


  class Show.WordSet extends App.Views.ItemView
    template: "word_sets/show/word_set"

    triggers:
      "click .word_set-delete" : "word:set:delete:clicked"
