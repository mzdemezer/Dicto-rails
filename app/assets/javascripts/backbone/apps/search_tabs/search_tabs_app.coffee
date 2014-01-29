@DictoRails.module "SearchTabsApp", (SearchTabsApp, App, Backbone, Marionette, $, _) ->

  API =
    list: (options) ->
      new SearchTabsApp.List.Controller options

    show: (options) ->
      new SearchTabsApp.Show.Controller options

    getActiveElement: => @activeElement
    setActiveElement: => @activeElement = document.activeElement

    regainFocus: ->
      activeElement = App.request("active:element")
      isBlurred = not activeElement? || activeElement is document.body

      activeElement = App.request("default:active:element") if isBlurred

      activeElement.focus()
      activeElement.blur() if isBlurred


  App.vent.on "words:search", =>
    API.list()


  App.vent.on "search:tab:activate", (options) =>
    API.show options


  App.vent.on "track:active:element", ->
    API.setActiveElement()

  App.reqres.setHandler "active:element", ->
    API.getActiveElement()

  App.vent.on "focus:stolen", ->
    API.regainFocus()
