@DictoRails.module "MeaningsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.View extends App.Views.ItemView
    template: "meanings/edit/meaning"
