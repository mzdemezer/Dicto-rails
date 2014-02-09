@DictoRails.module "WordSetsApp.Show.UsersApp", (UsersApp, App, Backbone, Marionette, $, _) ->

  class UsersApp.User extends App.Views.ItemView
    template: "word_sets/show/users/user"
    tagName: "tr"


  class UsersApp.Users extends App.Views.CompositeView
    template: "word_sets/show/users/users"
    itemView: UsersApp.User
    itemViewContainer: "tbody"
    tagName: "table"
    className: "table table-striped"
