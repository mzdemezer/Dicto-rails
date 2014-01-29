@DictoRails.module "Entities.Scheme", (Scheme, App, Backbone, Marionette, $, _) ->

  class Scheme.Model extends App.Entities.Model


  class Scheme.Controller extends App.Controllers.Base
    getScheme: ->
      @scheme ?= new Scheme.Model


  App.reqres.setHandler "scheme:entity", =>
    @controller.getScheme()

  Scheme.on "start", =>
    @controller = new Scheme.Controller
