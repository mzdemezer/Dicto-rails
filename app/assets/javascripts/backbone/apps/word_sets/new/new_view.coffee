@DictoRails.module "WordSetsApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.View extends App.Views.ItemView
    template: "word_sets/new/word_set"
