@DictoRails.module "WordSetsApp.Show.CategoriesApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.View extends App.Views.ItemView
    template: "word_sets/show/categories/form/form_view"

    form:
      className: "form-inline"
      buttons:
        className: "btn-sm"
