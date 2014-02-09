@DictoRails.module "UsersApp.Show.InvitationsApp", (InvitationsApp, App, Backbone, Marionette, $, _) ->

  class InvitationsApp.UserWordSet extends App.Views.ItemView
    template: "users/show/invitations/user_word_set"
    tagName: "option"

    onBeforeRender: ->
      @$el.val @model.get("word_set_id")


  class InvitationsApp.UserWordSets extends App.Views.CompositeView
    template: "users/show/invitations/user_word_sets"
    itemView: InvitationsApp.UserWordSet
    itemViewContainer: "select"
