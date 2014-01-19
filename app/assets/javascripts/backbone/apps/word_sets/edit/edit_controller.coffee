@DictoRails.module "WordSetsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { id, word_set } = options

      word_set ||= App.request "word:set:entity", id

      @listenTo word_set, "updated", ->
        App.vent.trigger "word:set:updated", word_set

      @layout = @getLayoutView word_set

      @listenTo @layout, "show", =>
        @wordSetRegion word_set

      @show @layout,
        loading: true


    wordSetRegion: (word_set) ->
      editView = @getEditView word_set
      formView = App.request "form:wrapper", editView

      @listenTo editView, "form:cancel", ->
        App.vent.trigger "word:set:cancelled", word_set

      @layout.wordSetRegion.show formView


    getLayoutView: (word_set) ->
      new Edit.Layout
        model: word_set

    getEditView: (word_set) ->
      new Edit.WordSet
        model: word_set
