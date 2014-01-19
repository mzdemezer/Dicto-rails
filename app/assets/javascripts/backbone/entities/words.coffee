@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Word extends App.Entities.Model

    relations: [
      type:             Backbone.Many
      key:              'meanings'
      collectionType:   Entities.Meanings
      relatedModel:     Entities.Meaning
    ]

    defaults:
      text:           ""
      pronounciation: ""
      meanings:       []

    initialize: (options) ->
      query = {}
      query.scheme = options.scheme if options.scheme
      @urlRoot = -> Routes.word_set_words_path(options.word_set_id, query)

  class Entities.Words extends App.Entities.Collection
    model: Entities.Word

    initialize: (options) ->
      query = {}
      query.scheme = options.scheme if options.scheme
      @url = -> Routes.word_set_words_path(options.word_set_id, query)


  API =
    getWords: (options) ->
      words = new Entities.Words(options)
      words.fetch
        reset: true
      words

    getWord: (options) ->
      word = new Entities.Word(options)
      word.fetch()
      word

    newWord: (options) ->
      new Entities.Word(options)


  App.reqres.setHandler "words:entities", (options) ->
    API.getWords(options)

  App.reqres.setHandler "word:entity", (options) ->
    API.getWord(options)

  App.reqres.setHandler "new:word:entity", (options) ->
    API.newWord(options)
