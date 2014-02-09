@DictoRails.module "Entities.UserWordSets", (UserWordSets, App, Backbone, Marionette, $, _) ->

  class UserWordSets.Model extends App.Entities.Model
    urlRoot: -> Routes.word_set_user_word_sets_path(@get("word_set_id"))

    defaults:
      permissions: "r"


  class UserWordSets.Collection extends App.Entities.Collection
    model: UserWordSets.Model
    url: -> Routes.word_set_user_word_sets_path(@word_set_id)

    initialize: (collection, options = {}) ->
      { @word_set_id } = options
