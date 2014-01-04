@DictoRails.module "SearchTabsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.SearchTab extends App.Views.ItemView
    template: "show/templates/search_tab"
