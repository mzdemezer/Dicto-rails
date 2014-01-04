@DictoRails.module "SearchTabsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.SearchTab extends App.Views.ItemView
    template: "search_tabs/show/search_tab"
