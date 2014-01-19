@DictoRails.module "WordSetsApp", (WordSetsApp, App, Backbone, Marionette, $, _) ->

  class WordSetsApp.Router extends Marionette.AppRouter
    appRoutes:
      "word_sets"            : "list"


  API =
    list: ->
      new WordSetsApp.List.Controller

    newWordSet: (region) ->

    deleteWordSet: (word_set) ->
      if confirm "Are you sure you want to delete '#{word_set.get("name")}'?"
        word_set.destroy()
        word_set.isDestroyed()
      else
        false


  App.commands.setHandler "new:word:set", (region) ->
    API.newWordSet region

  App.reqres.setHandler "delete:word:set", (word_set) ->
    API.deleteWordSet(word_set)

  App.vent.on "word:set:deleted", (word_set) ->
    App.navigate Routes.word_sets_path()
    API.list()


  App.addInitializer ->
    new WordSetsApp.Router
      controller: API
