@DictoRails.module "WordsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { word, word_set_id, id } = options
      word ||= App.request "word:entity", { word_set_id, id }

      App.execute "when:fetched", word, =>
        @layout = @getLayoutView word

        @listenTo @layout, "show", =>
          @wordRegion word

        @show @layout


    wordRegion: (word) ->
      wordView = @getWordView word
      @layout.wordRegion.show wordView


    getLayoutView: (word) ->
      new Show.Layout
        model: word

    getWordView: (word) ->
      new Show.Word
        model: word

