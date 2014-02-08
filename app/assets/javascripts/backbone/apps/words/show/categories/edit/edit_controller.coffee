@DictoRails.module "WordsApp.Show.CategoriesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Base.CategoriesApp.Controller

    initializeForm: ->

      @view.onFormSubmit = (data) =>
        $.post(Routes.word_categories_path(@model.id), data)
        .done (data) =>
          @model.set("categories", data)
        .fail ->
          alert "Something went wrong, please try again."
        .always =>
          @finished()
        false

      @listenTo @view, "form:cancel", @finished

    getCategories: ->
      App.request "word:categories:entities", @model.get("word_set_id"), @model.get("categories")

    finished: ->
      App.vent.trigger "list:word:categories", { @model, @region }

