@DictoRails.module "WordSetsApp", (WordSetsApp, App, Backbone, Marionette, $, _) ->

  class WordSetsApp.Router extends Marionette.AppRouter
    appRoutes:
      "word_sets"            : "list"
      "word_sets/:id"        : "show"
      "word_sets/:id/edit"   : "edit"


  API =
    list: ->
      new WordSetsApp.List.Controller

    show: (id) ->
      new WordSetsApp.Show.Controller { id }

    newWordSet: (region) ->
      new WordSetsApp.New.Controller { region }

    edit: (id) ->
      new WordSetsApp.Edit.Controller { id }

    deleteWordSet: (wordSet) ->
      if confirm "Are you sure you want to delete '#{wordSet.get("name")}'?"
        wordSet.destroy()
        wordSet.isDestroyed()
      else
        false


  App.commands.setHandler "new:word:set", (region) ->
    API.newWordSet region

  App.vent.on "word:set:cancelled word:set:updated word:set:created", (wordSet) ->
    App.navigate Routes.word_set_path(wordSet.id)
    API.show(wordSet.id)

  App.reqres.setHandler "delete:word:set", (wordSet) ->
    API.deleteWordSet(wordSet)

  App.vent.on "word:set:deleted", (wordSet) ->
    App.navigate Routes.word_sets_path()
    API.list()


  App.addInitializer ->
    new WordSetsApp.Router
      controller: API
