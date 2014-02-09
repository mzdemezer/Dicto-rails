@DictoRails.module "LearnApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "learn/show/layout"

    regions:
      formRegion: "#learn-form-region"


  class Show.FormLayout extends App.Views.Layout
    template: "learn/show/form_layout"

    regions:
      wordSetRegion:    "#word-set-show-region"
      categoriesRegion: "#word-set-categories-region"

    onFormSubmit: -> false

    form:
      className: "form-page form-horizontal"
      buttons:
        primary: "Study now!"
        cancel: false


  class Show.WordSet extends App.Views.ItemView
    template: "learn/show/word_set"
