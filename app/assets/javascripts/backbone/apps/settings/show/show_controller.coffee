@DictoRails.module "SettingsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayoutView()
      @show @layout


    onClose: ->
      App.vent.trigger "settings:layout:closed"


    getLayoutView: ->
      new Show.Layout
