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

    edit: (id, word_set) ->
      new WordSetsApp.Edit.Controller { id, word_set }

    deleteWordSet: (word_set) ->
      if confirm "Are you sure you want to delete '#{word_set.get("name")}'?"
        word_set.destroy()
        word_set.isDestroyed()
      else
        false


  App.commands.setHandler "new:word:set", (region) ->
    API.newWordSet region

  App.vent.on "edit:word:set", (word_set) ->
    App.navigate Routes.edit_word_set_path(word_set.id)
    API.edit(word_set.id)

  App.vent.on "word:set:cancelled word:set:updated word:set:created", (word_set) ->
    App.navigate Routes.word_set_path(word_set.id)
    API.show(word_set.id)

  App.reqres.setHandler "delete:word:set", (word_set) ->
    API.deleteWordSet(word_set)

  App.vent.on "word:set:deleted", (word_set) ->
    App.navigate Routes.word_sets_path()
    API.list()


  App.addInitializer ->
    new WordSetsApp.Router
      controller: API
