@DictoRails.module "WordsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      @layout = @getLayoutView()

      @show @layout


    getLayoutView: ->
      new Edit.Layout
