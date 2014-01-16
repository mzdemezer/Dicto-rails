@DictoRails.module "MeaningsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Meaning extends App.Views.ItemView
    template: "meanings/list/meaning"
    tagName: "li"


  class List.EmptyMeanings extends App.Views.ItemView
    template: "meanings/list/empty_meanings"


  class List.Meanings extends App.Views.CompositeView
    template: "meanings/list/meanings"
    itemView: List.Meaning
    emptyView: List.EmptyMeanings
    itemViewContainer: "ul"
