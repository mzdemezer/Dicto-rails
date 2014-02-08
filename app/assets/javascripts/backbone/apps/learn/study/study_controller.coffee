@DictoRails.module "LearnApp.Study", (Study, App, Backbone, Marionette, $, _) ->

  class Study.Controller extends App.Controllers.Base

    initialize: (options) ->
      @collection = App.request "words:entities", @getParams(options)

      @layout = @getLayout()

      App.execute "when:fetched", @collection, =>
        @listenTo @layout, "show", =>
          if @collection.length == 0
            @showEmpty()
          else
            @initializeHandlers()
            @beginSession()

      @show @layout,
        loading: true


    showEmpty: ->
      @layout.wrapperRegion.show(new App.Views.Shared.NotFound)


    initializeHandlers: ->
      @listenTo @layout, "i:was:right:clicked", ->
        @wordFinished("right")

      @listenTo @layout, "i:was:wrong:clicked", ->
        @wordFinished("wrong")

      @listenTo @layout, "i:didnt:know:clicked", ->
        @wordFinished("didnt_know")

      @listenTo @layout, "repeat:session:clicked", ->
        @beginSession()

    wordFinished: (status) ->
      route = Routes["#{status}_word_set_word_path"]
      $.post route(@currentWord.get("word_set_id"), @currentWord.id), @updateWord(@currentWord)
      @currentWord.set { status }
      @nextWord()

    updateWord: (word) ->
      (data) ->
        word.set("learnt", data.value)


    beginSession: ->
      @initializeStudying()
      @showWord()

    initializeStudying: ->
      @collection.models = @collection.shuffle()
      @index = 0
      @getCurrentWord()

    getCurrentWord: ->
      @currentWord = @collection.at(@index)

    showWord: ->
      @wordLayout = @getWordLayout(@currentWord)
      @layout.wrapperRegion.show(@wordLayout)

    nextWord: ->
      @index += 1
      if @index >= @collection.length
        @finishSession()
      else
        @getCurrentWord()
        @showWord()

    finishSession: ->
      finishView = @getFinishView()
      @layout.wrapperRegion.show(finishView)


    getParams: (options) ->
      { word_set_id, category_ids } = options
      category_ids = _(category_ids.split(",")).chain().compact().map((c) -> parseInt(c.trim())).value()
      { word_set_id, category_ids }


    getLayout: ->
      new Study.Layout { @collection }

    getWordLayout: (model) ->
      new Study.WordLayout { model }

    getFinishView: ->
      window.collection = @collection
      new Study.Finish { @collection }
