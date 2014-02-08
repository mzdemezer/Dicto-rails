@DictoRails.module "LearnApp", (LearnApp, App, Backbone, Marionette, $, _) ->

  class LearnApp.Router extends Marionette.AppRouter
    appRoutes:
      "learn"                              : "list"


  class LearnApp.Controller extends App.Controllers.Base

    list: ->


  App.addInitializer ->
    controller = new LearnApp.Controller
    new LearnApp.Router { controller }
