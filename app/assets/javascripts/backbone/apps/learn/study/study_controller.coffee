@DictoRails.module "LearnApp.Study", (Study, App, Backbone, Marionette, $, _) ->

  class Study.Controller extends App.Controllers.Base

    initialize: (options) ->
      { word_set_id, category_ids } = options
      category_ids = _(category_ids.split(",")).chain().compact().map((c) -> parseInt(c.trim())).value()
      @collection = App.request "words:entities", { word_set_id, category_ids }
