@DictoRails.module "WordSetsApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Base

    initialize: (options) ->
      word_set = App.request "new:word:set:entity"

      @listenTo word_set, "created", ->
        App.vent.trigger "word:set:created", word_set

      newView = @getNewView word_set
      formView = App.request "form:wrapper", newView

      @listenTo newView, "form:cancel", =>
        @region.close()
        App.vent.trigger "new:word:set:cancelled"

      @show formView


    getNewView: (word_set) ->
      new New.View
        model: word_set
