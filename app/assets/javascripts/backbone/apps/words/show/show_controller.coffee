@DictoRails.module "WordsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { word, word_set_id, id } = options
      word ||= App.request "word:entity", { word_set_id, id }

      @layout = @getLayoutView word

      @listenTo @layout, "show", =>
        @wordRegion word

      App.execute "when:fetched", word, =>
        App.vent.trigger "words:search", word.get("text")

      @show @layout,
        loading: true


    wordRegion: (word) ->
      wordView = @getWordView word
      @layout.wordRegion.show wordView


    getLayoutView: (word) ->
      new Show.Layout
        model: word

    getWordView: (word) ->
      new Show.Word
        model: word

