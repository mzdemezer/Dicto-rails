@DictoRails.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

  class Controllers.Settings extends Controllers.Base

    constructor: (options = {}) ->
      options.region ||= App.request "settings:layout:main:region"
      super options
