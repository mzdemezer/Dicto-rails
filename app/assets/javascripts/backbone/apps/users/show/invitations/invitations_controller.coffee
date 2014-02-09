@DictoRails.module "UsersApp.Show.InvitationsApp", (InvitationsApp, App, Backbone, Marionette, $, _) ->

  class InvitationsApp.Controller extends App.Controllers.Base

    initialize: (options) ->
      { user } = options

      @model = App.request "invitations:entity", user

      layout = @getLayout()

      @show layout,
        loading: true


    getLayout: ->
      new InvitationsApp.Layout { @model }
