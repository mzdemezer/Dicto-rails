@DictoRails.module "LearnApp.Study", (Study, App, Backbone, Marionette, $, _) ->

  class Study.Layout extends App.Views.Layout
    template: "learn/study/layout"

    regions:
      wrapperRegion: "#study-wrapper-region"
