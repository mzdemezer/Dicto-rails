@DictoRails.module "WordsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "words/list/list_layout"

    regions:
      panelRegion: "#words-list-panel-region"
      wordsRegion: "#words-list-words-region"
      newWordRegion: "#words-new-region"

  class List.Panel extends App.Views.ItemView
    template: "words/list/panel"

    initialize: (options) ->
      { @word_set_id, @renderShowAllButton } = options

    serializeData: ->
      return { @word_set_id, @renderShowAllButton }

    triggers:
      "click .new-word-button" : "new:word:button:clicked"

  class List.Word extends App.Views.ItemView
    template: "words/list/word"
    tagName: "li"
    className: "list-group-item"

  class List.Words extends App.Views.CompositeView
    template: "words/list/words"
    itemView: List.Word
    itemViewContainer: "ul"
