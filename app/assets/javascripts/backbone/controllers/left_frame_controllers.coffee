@DictoRails.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

  class Controllers.LeftFrame extends Controllers.Base

    constructor: (options = {}) ->
      options.region ||= App.request "frame:region:left"
      super options
