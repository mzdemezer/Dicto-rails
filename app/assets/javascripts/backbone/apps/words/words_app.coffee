@DictoRails.module "WordsApp", (WordsApp, App, Backbone, Marionette, $, _) ->

  class WordsApp.Router extends Marionette.AppRouter
    appRoutes:
      "word_sets/:word_set_id/search/*scheme"       : "list"
      "word_sets/:word_set_id/words"                : "list"
      "word_sets/:word_set_id/search"               : "list"
      "word_sets/:word_set_id/words/:id"            : "show"
      "word_sets/:word_set_id/words/:id/edit"       : "edit"

  API =
    list: (word_set_id, scheme, region) ->
      API.notifyWordSet word_set_id
      region ?= App.request "frame:region:left"
      new WordsApp.List.Controller { word_set_id, scheme, region }

    show: (word_set_id, id, region) ->
      API.notifyWordSet word_set_id
      region ?= App.request "frame:region:left"
      new WordsApp.Show.Controller { word_set_id, id, region }

    edit: (word_set_id, id, word, region) ->
      API.notifyWordSet word_set_id
      region ?= App.request "frame:region:left"
      new WordsApp.Edit.Controller { word_set_id, id, word, region }

    newWord: (word_set_id, text, region) ->
      API.notifyWordSet word_set_id
      new WordsApp.New.Controller { word_set_id, text, region }

    notifyWordSet: (word_set_id) ->
      App.vent.trigger "current:word:set:changed", word_set_id


  App.commands.setHandler "new:word", (word_set_id, scheme, region) ->
    API.newWord word_set_id, scheme, region

  App.vent.on "word:created", (word) ->
    { id } = word
    word_set_id = word.get("word_set_id")
    App.navigate Routes.word_set_word_path(word_set_id, id)
    API.show word_set_id, id

  App.vent.on "edit:word", (word) ->
    word_set_id = word.get("word_set_id")
    id = word.id
    App.navigate Routes.edit_word_set_word_path(word_set_id, id)
    API.edit(word_set_id, id, word)

  App.vent.on "word:cancelled word:updated", (word) ->
    word_set_id = word.get("word_set_id")
    id = word.id
    App.navigate Routes.word_set_word_path(word_set_id, id)
    API.show(word_set_id, id)

  App.vent.on "words:scheme:changed", (scheme) =>
    if scheme && @scheme != scheme
      @scheme = scheme
      App.vent.trigger "words:search", @scheme


  App.addInitializer ->
    new WordsApp.Router
      controller: API
