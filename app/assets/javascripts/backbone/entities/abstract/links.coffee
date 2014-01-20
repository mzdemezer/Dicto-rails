@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Link extends Entities.Model
    initialize: (link = {}, options = {}) ->
      @config = options.item || {}
      _.defaults @config,
        wrapperTag: null

      @deactivate()

    activate: ->
      @set "active", true

    deactivate: ->
      @set "active", false


  class Entities.Links extends Entities.Collection
    model: Entities.Link

    initialize: (links = [], options = {}) ->
      @config = options

    setActive: (model) ->
      model = @at(model) if _.isNumber(model)

      if @activated != model
        @activated.deactivate() if @activated?
        @activated = model
        @activated.activate()


  API =
    getLinks: (links, options) ->
      new Entities.Links links, options


  App.reqres.setHandler "link:entities", (links, options) ->
    API.getLinks links, options
