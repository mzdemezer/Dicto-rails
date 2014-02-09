@DictoRails.module "UsersApp.Show.InvitationsApp", (InvitationsApp, App, Backbone, Marionette, $, _) ->

  class InvitationsApp.Controller extends App.Controllers.Base

    initialize: (options) ->
      { user } = options

      @model = App.request "invitations:entity", user

      layout = @getLayout()
      @listenTo layout, "form:submit", @onFormSubmit

      @show layout,
        loading: true


    onFormSubmit: (args) ->
      data = Backbone.Syphon.serialize args.view
      _.extend data,
        id: @model.id
      $.post Routes.invitations_path(), data, (res) =>
        @model.set(res)
        if @model.get("user_word_sets").length == 0
          @model.trigger "empty:collection"


    getLayout: ->
      new InvitationsApp.Layout { @model }
