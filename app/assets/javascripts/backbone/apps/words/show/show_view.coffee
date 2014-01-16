@DictoRails.module "WordsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "words/show/show_layout"

    regions:
      wordRegion:       ".words-show-word-region"
      meaningsRegion:   ".words-show-meanings-region"

    triggers:
      "click .edit-button" : "edit:word:button:clicked"


  class Show.Word extends App.Views.ItemView
    template: "words/show/word"


  class Show.Meaning extends App.Views.ItemView
    template: "words/show/meaning"
    tagName: "li"


  class Show.EmptyMeanings extends App.Views.ItemView
    template: "words/show/empty_meanings"


  class Show.Meanings extends App.Views.CompositeView
    template: "words/show/meanings"
    itemView: Show.Meaning
    emptyView: Show.EmptyMeanings
    itemViewContainer: "ul"
