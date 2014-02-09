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

    setCurrentUser: (user) ->
      user.isCurrent = true
      @currentUser = new Users.Model(user)

    getCurrentUser: ->
      @currentUser

    isUserCurrent: (id) ->
      id == @currentUser?.id


  Users.on "start", =>
    controller = new Users.Controller
    controller.setCurrentUser(App.currentUser)
    App.currentUser = null

    App.reqres.setHandler "users:entities", -> controller.getUsers()
    App.reqres.setHandler "user:entity", (id) -> controller.getUser(id)
    App.reqres.setHandler "current:user:entity", -> controller.getCurrentUser()
    App.reqres.setHandler "is:user:current", (id) -> controller.isUserCurrent(id)
