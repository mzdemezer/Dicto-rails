DictoRails.module "SettingsApp.Account.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Settings

    initialize: ->
      currentUser = App.request "current:user:entity"

      @listenTo currentUser, "updated", ->
        App.vent.trigger "current:user:updated"

      editView = @getEditView(currentUser)
      formView = App.request "form:wrapper", editView

      @listenTo editView, "form:cancel", ->
        App.vent.trigger "edit:account:cancel"

      @show formView


    getEditView: (model) ->
      new Edit.View { model }
