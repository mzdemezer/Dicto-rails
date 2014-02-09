@DictoRails.module "Entities.Invitations", (Invitations, App, Backbone, Marionette, $, _) ->

  class Invitations.Model extends App.Entities.Model
    urlRoot: -> Routes.invitations_path()

    relations: [
      type:             Backbone.Many
      key:              "user_word_sets"
      collectionType:   "DictoRails.Entities.UserWordSets.Collection"
    ]

    defaults:
      user_word_sets: []


  class Invitations.Controller extends App.Controllers.Base

    getInvitations: (user) ->
      invitations = new Invitations.Model(user)
      invitations.fetch()
      invitations


  Invitations.on "start", ->
    controller = new Invitations.Controller
    App.reqres.setHandler "invitations:entity", (user) -> controller.getInvitations(user)
