@DictoRails.module "Entities.WordSets", (WordSets, App, Backbone, Marionette, $, _) ->

  class WordSets.Model extends App.Entities.Model
    urlRoot: -> Routes.word_sets_path()

    setCurrent: ->
      @collection?.setCurrent(@id)

  class WordSets.Collection extends App.Entities.Collection
    model: WordSets.Model
    url: -> Routes.word_sets_path()

    setCurrent: (id) ->
      @currentWordSet = @get(id) if id?
      @currentWordSet ||= @first()
      @trigger "change"
      @currentWordSet

    getCurrent: ->
      @currentWordSet

    initialize: ->
      @setCurrent()


  class WordSets.Controller extends App.Controllers.Base
    getWordSets: ->
      unless @wordSets?
        @wordSets = new WordSets.Collection
        @wordSets.fetch
          reset: true
      @wordSets

    insert: (wordSet) ->
      collection = @getWordSets()
      collection.add(wordSet)

    newWordSet: ->
      new WordSets.Model


  App.vent.on "word:set:created", (wordSet) =>
    @controller.insert(wordSet)

  App.reqres.setHandler "word:sets:entities", =>
    @controller.getWordSets()

  App.reqres.setHandler "new:word:set:entity", =>
    @controller.newWordSet()

  WordSets.on "start", =>
    @controller = new WordSets.Controller
