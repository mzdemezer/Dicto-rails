@DictoRails.module "Entities.UserWordSets", (UserWordSets, App, Backbone, Marionette, $, _) ->

  class UserWordSets.Model extends App.Entities.Model
    urlRoot: -> Routes.word_set_user_word_sets_path(@get("word_set_id"))

    defaults:
      permissions: "r"
