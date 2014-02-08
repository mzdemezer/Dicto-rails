@DictoRails.module "LearnApp.Study", (Study, App, Backbone, Marionette, $, _) ->

  class Study.Layout extends App.Views.Layout
    template: "learn/study/layout"

    regions:
      wrapperRegion: "#study-wrapper-region"


  class Study.WordLayout extends App.Views.Layout
    template: "learn/study/word_layout"
    regions:
      frontRegion:        "#study-front-word-region"
      backWordRegion:     "#study-back-word-region"
      backMeaningsRegion: "#study-back-meanings-region"

    ui:
      back: "#study-back"
    onShow: ->
      @frontRegion.show(new Study.FrontWord { @model })
      @backWordRegion.show(new Study.BackWord { @model })
      @backMeaningsRegion.show(new Study.Meanings { collection: @model.get("meanings") })
