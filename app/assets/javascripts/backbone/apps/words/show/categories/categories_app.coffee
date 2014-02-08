@DictoRails.module "WordsApp.Show.CategoriesApp", (CategoriesApp, App, Backbone, Marionette, $, _) ->

  class CategoriesApp.Controller extends App.Controllers.Base

    list: (options) ->
      new CategoriesApp.List.Controller(options)

    edit: (options) ->
      new CategoriesApp.Edit.Controller(options)

  CategoriesApp.on "start", ->
    controller = new CategoriesApp.Controller

    App.vent.on "edit:word:categories", controller.edit
    App.vent.on "list:word:categories", controller.list
