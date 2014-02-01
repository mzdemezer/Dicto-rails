@DictoRails.module "Entities.SearchTabs", (SearchTabs, App, Backbone, Marionette, $, _) ->

  class SearchTabs.Model extends App.Entities.Model
    initialize: ->
      @_deactivate()
      @search()
      @setHost()
      @on "change", @setHost

    urlRoot: -> Routes.search_tabs_path()

    activate: ->
      res = @collection?.setActive(@)
      if res then res else @_activate()


    _activate: ->
      @set "activated", true

    _deactivate: ->
      @set "activated", false

    search: (scheme) ->
      scheme ?= ""
      @set "search_url", @get("scheme_prefix") + scheme + @get("scheme_suffix")

    setHost: ->
      @set "host", $("<a>").attr("href", @get("scheme_prefix"))[0].host


  class SearchTabs.Collection extends App.Entities.Collection
    model: SearchTabs.Model

    url: -> Routes.search_tabs_path()

    setActive: (model) ->
      if @activated != model
        @activated._deactivate() if @activated?
        @activated = model
        @activated._activate()
      @activated

    getActive: ->
      @activated ||= @first()?._activate()


  class SearchTabs.Controller extends App.Controllers.Base
    getSearchTabs: ->
      unless @searchTabs?
        @searchTabs = new SearchTabs.Collection
        @searchTabs.fetch
          reset: true
      @searchTabs

  App.reqres.setHandler "search:tabs:entities", () =>
    @controller.getSearchTabs()

  SearchTabs.on "start", =>
    @controller = new SearchTabs.Controller
