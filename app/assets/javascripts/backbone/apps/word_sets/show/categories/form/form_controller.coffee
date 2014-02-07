@DictoRails.module "WordSetsApp.Show.CategoriesApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.Controller extends App.Controllers.Base

    initialize: (options) ->
      { model } = options

      view = @getView(model)
      formView = App.request "form:wrapper", view

      @listenTo model, "created", =>
        App.vent.trigger "category:created", model, @region

      @listenTo model, "updated", =>
        App.vent.trigger "category:updated", model, @region

      @listenTo view, "form:cancel", =>
        ev = "category:cancelled"
        ev = "new:" + ev if model.isNew()
        App.vent.trigger ev, model, @region

      @show formView


    getView: (model) ->
      new Form.View { model }
