@DictoRails.module "WordSetsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      word_set = App.request "word:set:entity", options.id

      @layout = @getLayoutView word_set

      @listenTo @layout, "show", =>
        @wordSetRegion word_set

      @show @layout,
        loading:
          error: =>
            @layout = null
            @show new App.Views.Shared.NotFound


    wordSetRegion: (word_set) ->
      wordSetView = @getWordSetView word_set

      @listenTo wordSetView, "word:delete:clicked", (args) ->
        if App.request "delete:word:set", args.model
          App.vent.trigger "word:deleted", args.model
        else
          alert("You can't do that!")

      @layout.wordSetRegion.show wordSetView


    getLayoutView: (word_set) ->
      new Show.Layout
        model: word_set

    getWordSetView: (word_set) ->
      new Show.WordSet
        model: word_set
