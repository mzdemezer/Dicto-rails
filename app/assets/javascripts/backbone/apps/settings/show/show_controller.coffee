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
          { text: "Search tabs",   href: "#settings/search_tabs" }
        ],
        className: "list-group"
        item:
          className: "list-group-item"


    getLayoutView: ->
      new Show.Layout

    getLinksView: (links) ->
      new App.Views.Shared.Links
        collection: links

