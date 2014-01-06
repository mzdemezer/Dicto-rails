@DictoRails.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.WordSet extends App.Views.ItemView
    template: "header/list/word_set"
    tagName: "option"

    onBeforeRender: ->
      @$el.val @.model.get("id")


  class List.Header extends App.Views.CompositeView
    template: "header/list/header"
    itemView: List.WordSet
    itemViewContainer: "#word_set-select"

    triggers:
      "submit #search-form"      : "search:form:submit"
      "change #word_set-select"  : "search:form:submit"
