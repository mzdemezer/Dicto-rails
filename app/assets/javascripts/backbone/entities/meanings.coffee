@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Meaning extends App.Entities.Model
    initialize: (options) ->
      { word_id } = options
      @urlRoot = -> Routes.word_meanings_path(word_id)

  class Entities.Meanings extends App.Entities.Collection
    model: Entities.Meaning

    initialize: (collection, word_id) ->
      if word_id?
        meaning.word_id ||= word_id for meaning in collection
        @url = -> Routes.word_meanings_path(word_id)

  API =
    newMeanings: (collection, word_id) ->
      new Entities.Meanings(collection, word_id)

  App.reqres.setHandler "new:meanings:entities", (collection, word_id) ->
    API.newMeanings(collection, word_id)
