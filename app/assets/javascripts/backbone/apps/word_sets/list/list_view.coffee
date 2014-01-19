@DictoRails.module "WordSetsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "word_sets/list/list_layout"

    regions:
      panelRegion:      "#word_set-list-panel-region"
      newWordSetRegion: "#word_set-list-new-region"
      wordSetsRegion:   "#word_set-list-word_sets-region"


  class List.Panel extends App.Views.ItemView
    template: "word_sets/list/panel"

    triggers:
      "click #new-word_set-button" : "new:word:set:button:clicked"


  class List.WordSet extends App.Views.ItemView
    template: "word_sets/list/word_set"

    triggers:
      "click .word_set-delete span" : "word:set:delete:clicked"


  class List.WordSets extends App.Views.CompositeView
    template: "word_sets/list/word_sets"
    itemView: List.WordSet
    itemViewContainer: "#word_sets-list"
