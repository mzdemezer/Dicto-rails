@DictoRails.module "LearnApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.WordSet extends App.Views.ItemView
    template: "learn/list/word_set"
    className: "list-group-item"

  class List.WordSets extends App.Views.CompositeView
    template: "learn/list/word_sets"
    itemView: List.WordSet
    itemViewContainer: ".learn-word-sets"
