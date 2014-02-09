@DictoRails.module "UsersApp.Show.InvitationsApp", (InvitationsApp, App, Backbone, Marionette, $, _) ->

  class InvitationsApp.UserWordSet extends App.Views.ItemView
    template: "users/show/invitations/user_word_set"
    tagName: "option"

    onBeforeRender: ->
      @$el.val @model.get("word_set_id")


  class InvitationsApp.Empty extends App.Views.ItemView
    template: "users/show/invitations/empty"


  class InvitationsApp.UserWordSets extends App.Views.CompositeView
    template: "users/show/invitations/user_word_sets"
    itemView: InvitationsApp.UserWordSet
    itemViewContainer: "select"


  class InvitationsApp.Layout extends App.Views.Layout
    template: "users/show/invitations/layout"

    regions:
      formRegion: ".user-show-invitations-form-region"

    triggers:
      "submit" : "form:submit"

    modelEvents:
      "empty:collection" : "render"

    onRender: ->
      collection = @model.get("user_word_sets")
      if collection.length > 0
        view = new InvitationsApp.UserWordSets { collection }
      else
        view = new InvitationsApp.Empty
      @formRegion.show view
