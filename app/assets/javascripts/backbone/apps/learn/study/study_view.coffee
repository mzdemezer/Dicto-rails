@DictoRails.module "LearnApp.Study", (Study, App, Backbone, Marionette, $, _) ->

  class Study.Layout extends App.Views.Layout
    template: "learn/study/layout"

    regions:
      wrapperRegion: "#study-wrapper-region"

    triggers:
      "click .i-was-right"    : "i:was:right:clicked"
      "click .i-was-wrong"    : "i:was:wrong:clicked"
      "click .i-didnt-know"   : "i:didnt:know:clicked"


  class Study.WordLayout extends App.Views.Layout
    template: "learn/study/word_layout"
    regions:
      frontRegion:        "#study-front-word-region"
      backWordRegion:     "#study-back-word-region"
      backMeaningsRegion: "#study-back-meanings-region"

    ui:
      back: "#study-back"

    triggers:
      "click .show-meanings" : "show:meanings:clicked"

    onShow: ->
      @frontRegion.show(new Study.FrontWord { @model })
      @backWordRegion.show(new Study.BackWord { @model })
      @backMeaningsRegion.show(new Study.Meanings { collection: @model.get("meanings") })

    onShowMeaningsClicked: ->
      @frontRegion.$el.hide(100)
      @ui.back.show(200)


  class Study.FrontWord extends App.Views.ItemView
    template: "learn/study/front_word"


  class Study.BackWord extends App.Views.ItemView
    template: "learn/study/back_word"


  class Study.Meaning extends App.Views.ItemView
    template: "learn/study/meaning"
    tagName: "li"


  class Study.Meanings extends App.Views.CollectionView
    itemView: Study.Meaning
    tagName: "ol"
