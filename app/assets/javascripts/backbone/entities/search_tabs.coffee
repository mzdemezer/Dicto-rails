@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.SearchTab extends App.Entities.Model
    initialize: ->
      @_deactivate()
      @search()
      @getHost()

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

    getHost: ->
      @set "host", $("<a>").attr("href", @get("scheme_prefix"))[0].host


  class Entities.SearchTabs extends App.Entities.Collection
    model: Entities.SearchTab

    url: -> Routes.search_tabs_path()

    setActive: (model) ->
      if @activated != model
        @activated._deactivate() if @activated?
        @activated = model
        @activated._activate()
      @activated

    getActive: ->
      @activated ||= @first()?._activate()

  API =
    getSearchTabs: () ->
      search_tabs = new Entities.SearchTabs
      search_tabs.fetch
        reset: true
      search_tabs

  App.reqres.setHandler "search_tabs:entities", () ->
    API.getSearchTabs()
