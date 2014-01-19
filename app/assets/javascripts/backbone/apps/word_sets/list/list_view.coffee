@DictoRails.module "WordSetsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "word_sets/list/list_layout"

    regions:
      panelRegion:      "#word_set-list-panel-region"
      newWordSetRegion: "#word_set-list-new-region"
      wordSetsRegion:   "#word_set-list-word_sets-region"
