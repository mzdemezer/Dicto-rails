@DictoRails.module "UsersApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "users/show/layout"

    regions:
      userRegion:          "#user-show-user-region"
      userWordSetsRegion:  "#user-show-user-word-sets-region"


  class Show.User extends App.Views.ItemView
    template: "users/show/user"
