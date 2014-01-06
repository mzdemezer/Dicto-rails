@DictoRails.module "SearchTabsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.SearchTab extends App.Views.ItemView
    template: "search_tabs/show/search_tab"

    onRender: ->
      window.view = @

      @triggerMethod "track:active:element"

      @$el.find(".foreign-site").on "load", (e) =>
        @triggerMethod "search:tab:loaded"

    onClose: ->
      @$el.find(".foreign-site").off "load"
