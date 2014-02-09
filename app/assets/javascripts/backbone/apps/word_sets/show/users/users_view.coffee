@DictoRails.module "WordSetsApp.Show.UsersApp", (UsersApp, App, Backbone, Marionette, $, _) ->

  class UsersApp.User extends App.Views.ItemView
    template: "word_sets/show/users/user"
    tagName: "tr"
