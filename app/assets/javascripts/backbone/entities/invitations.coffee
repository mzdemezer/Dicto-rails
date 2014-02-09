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
