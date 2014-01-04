@DictoRails.module "FrameApp", (FrameApp, App, Backbone, Marionette, $, _) ->

  API =
    show: =>
      @controller ||= new FrameApp.Show.Controller

    close: =>
      @controller = null

    layout: ->
      @show().layout

  App.vent.on "frame:close", ->
    API.close()

  App.reqres.setHandler "frame:layout", ->
    API.layout()

  App.reqres.setHandler "frame:region:left", ->
    API.layout().leftRegion

  App.reqres.setHandler "frame:region:right", ->
    API.layout().rightRegion
