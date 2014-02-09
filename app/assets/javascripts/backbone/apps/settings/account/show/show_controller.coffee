@DictoRails.module "SettingsApp.Account.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Settings

    initialize: ->
      currentUser = App.request "current:user:entity"

      view = @getView(currentUser)

      @show view


    getView: (model) ->
      new Show.View { model }
