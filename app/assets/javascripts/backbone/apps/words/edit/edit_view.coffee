@DictoRails.module "WordsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: "words/edit/edit_layout"

    regions:
      wordRegion:       "#words-edit-word-region"
      meaningsRegion:   "#words-edit-meanings-region"

  class Edit.Word extends App.Views.ItemView
    template: "words/edit/word"
