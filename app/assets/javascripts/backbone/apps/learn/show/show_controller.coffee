@DictoRails.module "LearnApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { @word_set_id } = options
      wordSets = App.request "word:sets:entities"

      @layout = @getLayoutView(wordSets)

      App.execute "when:fetched", wordSets, =>
        wordSet = wordSets.get(@word_set_id)

        if wordSet?
          @listenTo @layout, "show", =>
            @formRegion(wordSet)
        else
          @layout = null
          @show(new App.Views.Shared.NotFound)

      @show @layout,
        loading: true


    formRegion: (model) ->
      @formLayout = @getFormLayout(model)
      @listenTo @formLayout, "form:submit", @onFormSubmit

      @listenTo @formLayout, "show", =>
        @wordSetRegion(model)
        @categoriesRegion(model)

      formWrapper = App.request "form:wrapper", @formLayout
      @layout.formRegion.show formWrapper

    wordSetRegion: (model) ->
      wordSetView = @getWordSetView(model)

      @formLayout.wordSetRegion.show wordSetView

    categoriesRegion: (model) ->
      @categoriesController = new Show.CategoriesApp.Controller {
        region: @formLayout.categoriesRegion
        model
      }


    onFormSubmit: (data) ->
      categories_ids = (data.categories || []).join()
      App.navigate "learn/#{@word_set_id}/#{categories_ids}", trigger: true


    getLayoutView: (collection) ->
      new Show.Layout { collection }

    getWordSetView: (model) ->
      new Show.WordSet { model }

    getFormLayout: (model) ->
      new Show.FormLayout { model }
