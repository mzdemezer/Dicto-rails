@DictoRails.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

  class Controllers.RightFrame extends Controllers.Base

    constructor: (options = {}) ->
      options.region ||= App.request "frame:region:right"
      super options
