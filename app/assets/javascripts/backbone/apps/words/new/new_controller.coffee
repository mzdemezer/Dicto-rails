@DictoRails.module "WordsApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Base

    initialize: (options) ->
      { word_set_id, text } = options

      word = App.request "new:word:entity", { word_set_id, text }

      @listenTo word, "created", ->
        App.vent.trigger "word:created", word

      newView = @getNewView word
      console.log word
      formView = App.request "form:wrapper", newView

      @listenTo newView, "form:cancel", =>
        @region.close()

      @show formView


    getNewView: (word) ->
      new New.View
        model: word
