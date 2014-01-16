@DictoRails.module "WordsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { word, word_set_id, id } = options
      word ||= App.request "word:entity", { word_set_id, id }

      @layout = @getLayoutView word

      @listenTo @layout, "edit:word:button:clicked", ->
        App.vent.trigger "edit:word", word

      @listenTo @layout, "show", =>
        @wordRegion word
        @meaningsRegion word

      App.execute "when:fetched", word, =>
        App.vent.trigger "words:scheme:changed", word.get("text")

      @show @layout,
        loading: true


    wordRegion: (word) ->
      wordView = @getWordView word
      @layout.wordRegion.show wordView

    meaningsRegion: (word) ->
      if word?
        meanings = word.get("meanings")
        word_id  = word.id
      else
        meanings = []

      meanings = App.request "new:meanings:entities", meanings, word_id

      meaningsView = @getMeaningsView meanings
      @layout.meaningsRegion.show meaningsView


    getLayoutView: (word) ->
      new Show.Layout
        model: word

    getWordView: (word) ->
      new Show.Word
        model: word

    getMeaningsView: (meanings) ->
      new Show.Meanings
        collection: meanings
