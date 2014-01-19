@DictoRails.module "MeaningsApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Base

    initialize: (options) ->
      { meaning } = options

      newView = @getNewView meaning
      formView = App.request "form:wrapper", newView

      @listenTo meaning, "created", ->
        App.vent.trigger "meaning:created", meaning, @region

      @listenTo newView, "form:cancel", ->
        App.vent.trigger "new:meaning:cancelled", meaning

      @show formView


    getNewView: (meaning) ->
      new New.View
        model: meaning

