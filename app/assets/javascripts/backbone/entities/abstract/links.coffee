@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Link extends Entities.Model
    initialize: (link = {}, options = {}) ->
      @config = options.item || {}
      _.defaults @config,
        wrapperTag: null
        external: false

      @set("href", "#" + @get("href")) unless @config.external

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

      if @activated isnt model
        @activated.deactivate() if @activated?
        @activated = model
        @activated.activate() if @activated


  API =
    getLinks: (links, options) ->
      new Entities.Links links, options


  App.reqres.setHandler "link:entities", (links, options) ->
    API.getLinks links, options
