@DictoRails.module "WordSetsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: "word_sets/edit/edit_layout"

    regions:
      wordSetRegion:       "#word_sets-edit-word-region"