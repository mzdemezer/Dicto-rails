@DictoRails.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "search/list/list_layout"
