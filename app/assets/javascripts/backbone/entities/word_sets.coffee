@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.WordSet extends App.Entities.Model
    urlRoot: -> Routes.word_sets_path()

  class Entities.WordSets extends App.Entities.Collection
    model: Entities.WordSet
    url: -> Routes.word_sets_path()

  API =
    getWordSets: ->
      words = new Entities.WordSets
      words.fetch
        reset: true
      words

    getWordSet: (id) ->
      word = new Entities.WordSet { id }
      word.fetch()
      word

  App.reqres.setHandler "word:sets:entities", ->
    API.getWordSets()

  App.reqres.setHandler "word:set:entity", (id) ->
    API.getWordSet(id)
