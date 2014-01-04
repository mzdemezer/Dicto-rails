@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Word extends App.Entities.Model
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

  App.reqres.setHandler "words:entities", (options) ->
    API.getWords(options)
