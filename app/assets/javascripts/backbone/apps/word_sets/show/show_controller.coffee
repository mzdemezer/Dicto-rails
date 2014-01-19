@DictoRails.module "WordSetsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      word_set = App.request "word:set:entity", options.id

      @layout = @getLayoutView word_set

      @listenTo @layout, "show", =>
        @wordSetRegion word_set

      @show @layout,
        loading: true


    wordSetRegion: (word_set) ->
      wordSetView = @getWordSetView word_set

      @layout.wordSetRegion.show wordSetView


    getLayoutView: (word_set) ->
      new Show.Layout
        model: word_set

    getWordSetView: (word_set) ->
      new Show.WordSet
        model: word_set
