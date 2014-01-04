@DictoRails.module "SearchTabsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { scheme } = options

      search_tabs = App.request "search_tabs:entities"

      App.execute "when:fetched", search_tabs, =>
        @layout = @getLayoutView()

        @show @layout
    getLayoutView: () ->
      new List.Layout
