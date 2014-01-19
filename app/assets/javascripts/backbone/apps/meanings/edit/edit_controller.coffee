@DictoRails.module "MeaningsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { meaning } = options

      editView = @getEditView meaning
      formView = App.request "form:wrapper", editView

      @listenTo meaning, "updated", ->
        App.vent.trigger "meaning:updated", meaning, @region

      @listenTo editView, "form:cancel", ->
        App.vent.trigger "meaning:cancelled", meaning, @region

      @show formView


    getEditView: (meaning) ->
      new Edit.View
        model: meaning
