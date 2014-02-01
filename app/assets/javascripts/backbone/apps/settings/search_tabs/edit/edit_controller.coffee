@DictoRails.module "SettingsApp.SearchTabs.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base
    initialize: (options) ->
      { searchTab, action } = options

      editView = @getEditView(searchTab)
      formView = App.request "form:wrapper", editView

      @listenTo searchTab, "created", ->
        App.vent.trigger "search:tab:created", searchTab, @region

      @listenTo searchTab, "updated", ->
        App.vent.trigger "search:tab:updated", searchTab, @region

      @listenTo editView, "form:cancel", ->
        ev = "search:tab:cancelled"
        ev = "new:" + ev if action is "new"
        App.vent.trigger ev, searchTab, @region

      @show formView


    getEditView: (searchTab) ->
      new Edit.View
        model: searchTab
