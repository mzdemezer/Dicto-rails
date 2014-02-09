@DictoRails.module "SettingsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: ->
      @layout = @getLayoutView()

      @links = @getLinks()

      @listenTo @layout, "show", =>
        @linksRegion()

      @show @layout


    onClose: ->
      @links = null
      App.vent.trigger "settings:layout:closed"


    linksRegion: ->
      linksView = @getLinksView @links
      @layout.navigationRegion.show linksView


    getLinks: ->
      App.request "link:entities", [
          { text: "Account",       href: Routes.settings_account_path() }
          { text: "Search tabs",   href: Routes.settings_search_tabs_path() }
        ],
        className: "list-group"
        item:
          className: "list-group-item"


    getLayoutView: ->
      new Show.Layout

    getLinksView: (links) ->
      new App.Views.Shared.Links
        collection: links

