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

    newWord: (scheme, region) ->


  App.commands.setHandler "new:word", (scheme, region) ->
    API.newWord scheme, region

  App.vent.on "words:scheme:changed", (scheme) =>
    if scheme && @scheme != scheme
      @scheme = scheme
      App.vent.trigger "words:search", @scheme


  App.addInitializer ->
    new WordsApp.Router
      controller: API
