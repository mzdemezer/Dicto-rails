@DictoRails.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.WordSet extends App.Views.ItemView
    template: "header/list/word_set"
    tagName: "option"

    onBeforeRender: ->
      @$el.val @model.get("id")


  class List.WordSets extends App.Views.CompositeView
    template: "header/list/word_sets"
    itemViewContainer: "#word_set-select"
    itemView: List.WordSet

    initialize: ->
      @listenTo @collection, "change", @render

    onRender: ->
      @$wordSetSelect = @$el.find("#word_set-select")

      currentWordSet = @collection.getCurrent()
      @$wordSetSelect.val(currentWordSet.id) if currentWordSet?


  class List.Layout extends App.Views.Layout
    template: "header/list/list_layout"

    bindings:
      "#search-field" :
        observe: "text"
        onGet: (val) ->
          @triggerMethod "search:phrase:typed", val
          val

        onSet: (val) ->
          @triggerMethod "search:phrase:typed", val
          val

    regions:
      wordSetsRegion: "#word_sets-select-region"
      linksRegion:    "#header-links"

    onRender: ->
      @stickit()
      @$searchField = @$el.find("#search-field")
      @$searchButton = @$el.find("#search-button")
      @triggerMethod "search:field:register", @$searchField

    onSearchPhraseTyped: (val) ->
      if @$searchButton?
        if val
          @$searchButton.val "Search"
        else
          @$searchButton.val "Show all"

    triggers:
      "submit #search-form"      : "search:form:submit"
      "change #word_set-select"  : "search:form:submit"
