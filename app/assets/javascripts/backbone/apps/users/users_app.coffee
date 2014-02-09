@DictoRails.module "UsersApp", (UsersApp, App, Backbone, Marionette, $, _) ->

  class UsersApp.Router extends Marionette.AppRouter
    appRoutes:
      "users"      : "list"


  class UsersApp.Controller extends App.Controllers.Base

    list: ->
      new UsersApp.List.Controller


  UsersApp.on "start", ->
    controller = new UsersApp.Controller
    new UsersApp.Router { controller }
