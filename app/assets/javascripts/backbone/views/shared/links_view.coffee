@DictoRails.module "Views.Shared", (Shared, App, Backbone, Marionette, $, _) ->

  class Shared.Link extends App.Views.ItemView
    template: "shared/link"

    constructor: (options = {}) ->
      { model } = options
      { @config } = model
      _.extend @, @config

      if @config.wrapperTag?
        @tagName = @config.wrapperTag
        @config = _.omit(@config, "className")
      else
        @tagName = "a"

      @attributes =
        href: -> model.get("href")
      super options

    serializeData: ->
      _.extend @model.attributes, @config

    onBeforeRender: ->
      @$el.toggleClass "active", @model.get("active")

    modelEvents:
      "change" : "render"


  class Shared.Links extends App.Views.CollectionView
    itemView: Shared.Link

    constructor: (options = {}) ->
      { collection } = options
      { config } = collection
      _.extend @, _.omit(config, "item")

      super options
