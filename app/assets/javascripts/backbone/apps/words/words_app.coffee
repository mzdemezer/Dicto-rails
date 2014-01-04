@DictoRails.module "WordsApp", (WordsApp, App, Backbone, Marionette, $, _) ->

  class WordsApp.Router extends Marionette.AppRouter
    appRoutes:
      "word_set/:id/words/*scheme" : "list"
      "word_set/:id/words"         : "list"

  API =
    list: (word_set_id, scheme) ->
      new WordsApp.List.Controller
        word_set_id: word_set_id
        scheme: scheme

  App.addInitializer ->
    new WordsApp.Router
      controller: API
