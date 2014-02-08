@DictoRails.module "Base.CategoriesApp", (CategoriesApp, App, Backbone, Marionette, $, _) ->

  class CategoriesApp.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @model } = options
      @categories = @getCategories()

      @view = @getView(@model, @categories)
      @formView = App.request "form:wrapper", @view

      @initializeForm()

      @show @formView


    getView: (model, collection) ->
      new CategoriesApp.Categories { model, collection }
