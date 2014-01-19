@DictoRails.module "WordsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { word, word_set_id, id } = options
      word ||= App.request "word:entity", { word_set_id, id }

      @layout = @getLayoutView word

      @listenTo @layout, "edit:word:clicked", ->
        App.vent.trigger "edit:word", word

      @listenTo @layout, "delete:word:clicked", (args) ->
        if App.request "delete:word", args.model
          App.vent.trigger "word:deleted", args.model
        else
          alert("You can't do that!")

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
      App.vent.trigger "list:meanings", meanings, @layout.meaningsRegion


    getLayoutView: (word) ->
      new Show.Layout
        model: word

    getWordView: (word) ->
      new Show.Word
        model: word
