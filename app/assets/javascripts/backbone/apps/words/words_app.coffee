@DictoRails.module "WordsApp", (WordsApp, App, Backbone, Marionette, $, _) ->

  class WordsApp.Router extends Marionette.AppRouter
    appRoutes:
      "word_set/:word_set_id/words/*scheme" : "list"
      "word_set/:word_set_id/words"         : "list"
      "word_set/:word_set_id/word/:id"      : "show"

  API =
    list: (word_set_id, scheme, region) ->
      region ?= App.request "frame:region:left"
      new WordsApp.List.Controller { word_set_id, scheme, region }

    show: (word_set_id, id, region) ->
      region ?= App.request "frame:region:left"
      new WordsApp.Show.Controller { word_set_id, id, region }

    newWord: (word_set_id, text, region) ->
      new WordsApp.New.Controller { word_set_id, text, region }


  App.commands.setHandler "new:word", (word_set_id, scheme, region) ->
    API.newWord word_set_id, scheme, region

  App.vent.on "words:scheme:changed", (scheme) =>
    if scheme && @scheme != scheme
      @scheme = scheme
      App.vent.trigger "words:search", @scheme


  App.addInitializer ->
    new WordsApp.Router
      controller: API
