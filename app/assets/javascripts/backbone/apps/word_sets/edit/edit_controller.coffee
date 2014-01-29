@DictoRails.module "WordSetsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      wordSets = App.request "word:sets:entities"

      @layout = @getLayoutView wordSets

      App.execute "when:fetched", wordSets, =>
        wordSet = wordSets.get(options.id)

        if wordSet?
          @listenTo wordSet, "updated", ->
            App.vent.trigger "word:set:updated", wordSet

          @listenTo @layout, "show", =>
            @wordSetRegion wordSet
        else
          @layout = null
          @show new App.Views.Shared.NotFound

      @show @layout,
        loading: true


    wordSetRegion: (wordSet) ->
      editView = @getEditView wordSet
      formView = App.request "form:wrapper", editView

      @listenTo editView, "form:cancel", ->
        App.vent.trigger "word:set:cancelled", wordSet

      @layout.wordSetRegion.show formView


    getLayoutView: (wordSets) ->
      new Edit.Layout
        collection: wordSets

    getEditView: (wordSet) ->
      new Edit.WordSet
        model: wordSet
