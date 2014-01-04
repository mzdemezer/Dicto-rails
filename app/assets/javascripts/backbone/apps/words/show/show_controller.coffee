@DictoRails.module "WordsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { word, word_set_id, id } = options
      word ||= App.request "word:entity", { word_set_id, id }

      App.execute "when:fetched", word, =>
        @layout = @getLayoutView word

        @show @layout


    getLayoutView: (word) ->
      new Show.Layout
        model: word

