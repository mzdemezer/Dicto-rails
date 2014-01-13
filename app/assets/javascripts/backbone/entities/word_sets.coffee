@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.WordSet extends App.Entities.Model
    urlRoot: -> Routes.word_sets_path()

  class Entities.WordSets extends App.Entities.Collection
    model: Entities.WordSet
    url: -> Routes.word_sets_path()

    setCurrent: (id) ->
      @currentWordSet = @get(id) if id?
      @currentWordSet ||= @first()

    getCurrent: ->
      @currentWordSet

    initialize: ->
      @setCurrent()

  API =
    getWordSets: ->
      wordSets = new Entities.WordSets
      wordSets.fetch
        reset: true
      wordSets

    getWordSet: (id) ->
      wordSet = new Entities.WordSet { id }
      wordSet.fetch()
      wordSet

  App.reqres.setHandler "word:sets:entities", ->
    API.getWordSets()

  App.reqres.setHandler "word:set:entity", (id) ->
    API.getWordSet(id)
