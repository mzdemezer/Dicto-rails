@DictoRails.module "LearnApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.WordSet extends App.Views.ItemView
    template: "learn/list/word_set"
