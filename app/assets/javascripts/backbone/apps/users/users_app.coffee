@DictoRails.module "UsersApp", (UsersApp, App, Backbone, Marionette, $, _) ->

  class UsersApp.Router extends Marionette.AppRouter


  class UsersApp.Controller extends App.Controllers.Base


  UsersApp.on "start", ->
    controller = new UsersApp.Controller
    new UsersApp.Router { controller }
