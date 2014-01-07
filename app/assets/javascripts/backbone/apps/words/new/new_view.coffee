@DictoRails.module "WordsApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.View extends App.Views.ItemView
    template: "words/new/word"

    form:
      buttons:
        placement: "left"
