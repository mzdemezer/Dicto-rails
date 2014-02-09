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
