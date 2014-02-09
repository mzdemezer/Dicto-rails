@DictoRails.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.User extends App.Views.ItemView
    template: "users/list/user"
    tagName: "li"
    className: "list-group-item"
