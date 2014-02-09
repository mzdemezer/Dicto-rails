@DictoRails.module "WordSetsApp.Show.UsersApp", (UsersApp, App, Backbone, Marionette, $, _) ->

  class UsersApp.Controller extends App.Controllers.Base

    initialize: (options) ->
      { wordSet } = options

      @collection = App.request "user:word:set:entities", wordSet.id

      usersView = @getUsersView()

      @show usersView,
        loading: true


    getUsersView: ->
      new UsersApp.Users { @collection }
