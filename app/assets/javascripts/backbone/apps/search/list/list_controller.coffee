@DictoRails.module "SearchApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      console.log("list controller initialized")
