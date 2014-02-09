@DictoRails.module "Entities.Users", (Users, App, Backbone, Marionette, $, _) ->

  class Users.Model extends App.Entities.Model
    urlRoot: -> Routes.users_path()

    initialize: ->
      @setFullName()
      @on "change", @setFullName

    setFullName: ->
      fullName = _([ @get("first_name"), @get("last_name") ]).compact().join(" ")
      fullName ||= "no name"
      @set { fullName }


  class Users.Collection extends App.Entities.Collection
    model: Users.Model
    url: -> Routes.users_path()


  class Users.Controller extends App.Controllers.Base
    getUsers: ->
      users = new Users.Collection
      users.fetch
        reset: true
      users

    getUser: (id) ->
      if @isUserCurrent(id)
        user = @currentUser
      else
        user = new Users.Model { id, isCurrent: false }
        user.fetch()
      user
