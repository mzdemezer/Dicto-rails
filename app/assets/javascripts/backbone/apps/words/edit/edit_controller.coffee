@DictoRails.module "WordsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { word, word_set_id, id } = options
      word ||= App.request "word:entity", { word_set_id, id }

      @listenTo word, "updated", ->
        App.vent.trigger "word:updated", word

      @layout = @getLayoutView word

      @listenTo @layout, "show", =>
        @wordRegion word

      @show @layout,
        loading: true


    wordRegion: (word) ->
      editView = @getEditView word
      formView = App.request "form:wrapper", editView

      @listenTo editView, "form:cancel", ->
        App.vent.trigger "word:cancelled", word

      @layout.wordRegion.show formView


    getLayoutView: (word) ->
      new Edit.Layout
        model: word

    getEditView: (word) ->
      new Edit.Word
        model: word
