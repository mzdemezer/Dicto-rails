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


  class List.Meanings extends App.Views.CompositeView
    template: "words/list/meanings"
    itemViewContainer: ".word-list-meanings"


  class List.WordWrapper extends App.Views.Layout
    template: "words/list/word_wrapper"
    tagName: "li"
    className: "word-list-item list-group-item"

    regions:
      wordRegion:     ".word-list-word-region"
      meaningsRegion: ".word-list-meanings-region"

    onShow: ->
      @wordRegion.show @getWordView()
      @meaningsRegion.show @getMeaningsView()

    getWordView: ->
      new List.Word { @model }

    getMeaningsView: ->
      new List.Meanings
        collection: @model.get("meanings")


  class List.EmptyWords extends App.Views.ItemView
    template: "words/list/empty_words"


  class List.Words extends App.Views.CompositeView
    template: "words/list/words"
    itemView: List.WordWrapper
    emptyView: List.EmptyWords
    itemViewContainer: "ul"
