@DictoRails.module "LearnApp.Show.CategoriesApp", (CategoriesApp, App, Backbone, Marionette, $, _) ->

  class CategoriesApp.Controller extends App.Base.CategoriesApp.Controller

    initializeView: ->
      @show @view,
        loading: true


    getCategories: ->
      App.request "categories:entities", @model.id
