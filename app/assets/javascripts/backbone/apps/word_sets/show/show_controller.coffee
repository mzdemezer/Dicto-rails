@DictoRails.module "WordSetsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      wordSets = App.request "word:sets:entities"

      @layout = @getLayoutView wordSets

      App.execute "when:fetched", wordSets, =>
        wordSet = wordSets.get(options.id)

        if wordSet?
          @listenTo @layout, "show", =>
            @wordSetRegion wordSet
            @categoriesRegion(wordSet)
        else
          @layout = null
          @show new App.Views.Shared.NotFound

      @show @layout,
        loading: true


    wordSetRegion: (wordSet) ->
      wordSetView = @getWordSetView wordSet

      @listenTo wordSetView, "word:delete:clicked", (args) ->
        if App.request "delete:word:set", args.model
          App.vent.trigger "word:deleted", args.model
        else
          alert("You can't do that!")

      @layout.wordSetRegion.show wordSetView

    categoriesRegion: (wordSet) ->
      @categoriesController = new Show.Categories.List.Controller {
        region: @layout.categoriesRegion
        wordSet
      }


    getLayoutView: (wordSets) ->
      new Show.Layout
        collection: wordSets

    getWordSetView: (wordSet) ->
      new Show.WordSet
        model: wordSet
