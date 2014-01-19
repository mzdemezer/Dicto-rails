@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Meaning extends App.Entities.Model
    defaults:
      text: ""

    initialize: ->
      @urlRoot = => Routes.word_meanings_path(@collection?.parents?[0].id)


  class Entities.Meanings extends App.Entities.Collection
    model: Entities.Meaning

    initialize: ->
      @url = => Routes.word_meanings_path(@parents?[0].id)


  API =
    newMeaning: ->
      new Entities.Meaning

    newMeanings: (collection) ->
      new Entities.Meanings(collection)


  App.reqres.setHandler "new:meaning:entity", ->
    API.newMeaning()

  App.reqres.setHandler "new:meanings:entities", (collection) ->
    API.newMeanings(collection)
