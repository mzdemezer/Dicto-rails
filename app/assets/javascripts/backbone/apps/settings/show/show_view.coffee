@DictoRails.module "SettingsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "settings/show/show_layout"

    regions:
      navigationRegion:   "#settings-navigation-region"
      mainRegion:         "#settings-main-region"
