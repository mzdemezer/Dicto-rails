@DictoRails.module "WordsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Word extends App.Views.ItemView
    template: "words/list/word"
    tagName: "li"
    className: "list-group-item"

  class List.Words extends App.Views.CompositeView
    template: "words/list/words"
    itemView: List.Word
    itemViewContainer: "ul"
