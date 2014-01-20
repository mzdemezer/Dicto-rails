@DictoRails.module "Views.Shared", (Shared, App, Backbone, Marionette, $, _) ->

  class Shared.NotFound extends Marionette.ItemView
    template: "shared/not_found"
