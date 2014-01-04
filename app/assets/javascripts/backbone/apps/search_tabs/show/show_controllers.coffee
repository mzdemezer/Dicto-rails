@DictoRails.module "SearchTabsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { model, scheme } = options
      model.search scheme
