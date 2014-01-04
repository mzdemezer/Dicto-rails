@DictoRails.module "WordsApp", (WordsApp, App, Backbone, Marionette, $, _) ->

  class WordsApp.Router extends Marionette.AppRouter
    appRoutes:
      "word_set/:word_set_id/words/*scheme" : "list"
      "word_set/:word_set_id/words"         : "list"
      "word_set/:word_set_id/word/:id"      : "show"

  API =
    list: (word_set_id, scheme) ->
      new WordsApp.List.Controller
        word_set_id: word_set_id
        scheme: scheme

    show: (word_set_id, id, region) ->
      new WordsApp.Show.Controller { word_set_id, id, region }

  App.addInitializer ->
    new WordsApp.Router
      controller: API
