@DictoRails.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: ->
      collection = App.request "users:entities"

      view = @getListView(collection)

      @show view,
        loading: true


    getListView: (collection) ->
      new List.Users { collection }
