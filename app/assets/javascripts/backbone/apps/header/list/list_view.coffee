@DictoRails.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.WordSet extends App.Views.ItemView
    template: "header/list/word_set"
    tagName: "option"

    onBeforeRender: ->
      @$el.val @model.get("id")


  class List.Header extends App.Views.CompositeView
    template: "header/list/header"
    itemView: List.WordSet
    itemViewContainer: "#word_set-select"

    onRender: ->
      @$searchField = @$el.find("#search-field")
      @$searchButton = @$el.find("#search-button")
      @$wordSetSelect = @$el.find("#word_set-select")
      @triggerMethod "search:field:register", @$searchField

      currentWordSet = @collection.getCurrent()
      @$wordSetSelect.val(currentWordSet.id) if currentWordSet?

      unless @first_render
        @triggerMethod "search:phrase:typed"
        @first_render = true


    onSearchPhraseTyped: ->
      if @$searchField.val()
        @$searchButton.val "Search"
      else
        @$searchButton.val "Show all"

    triggers:
      "submit #search-form"      : "search:form:submit"
      "keyup #search-field"      : "search:phrase:typed"
      "change #word_set-select"  : "search:form:submit"
