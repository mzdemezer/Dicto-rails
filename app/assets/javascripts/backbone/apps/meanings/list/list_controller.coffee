@DictoRails.module "MeaningsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      { word } = options
      if word?
        @meanings = word.get("meanings")
      else
        @meanings = App.request "new:meanings:entities", []

      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @panelRegion()
        @meaningsRegion()

      @show @layout


    onClose: ->
      @meanings = null


    panelRegion: ->
      panelView = @getPanelView()

      @listenTo panelView, "new:meaning:clicked", =>
        newMeaning = App.request "new:meaning:entity"
        @meanings.add(newMeaning)

      @layout.panelRegion.show panelView

    meaningsRegion: ->
      meaningsView = @getMeaningsView()

      @listenTo meaningsView, "childview:show", (wrapper) =>
        { model, region } = wrapper

        if @meanings.get(model)?
          if model.isNew()
            App.vent.trigger "new:meaning", model, region
          else
            @showMeaning model, region

      @listenTo App.vent, "meaning:cancelled meaning:updated meaning:created", (meaning, region) =>
        @showMeaning meaning, region

      @listenTo App.vent, "new:meaning:cancelled", (meaning) =>
        meaning.destroy()

      @listenTo meaningsView, "childview:meaning:delete:clicked", (wrapper) =>
        meaning = wrapper.model
        if confirm "Are you sure you want to delete '#{meaning.get("text")}'?"
          meaning.destroy()

        unless meaning.isDestroyed()
          alert("You can't do that!")

      @listenTo meaningsView, "childview:meaning:edit:clicked", (wrapper) =>
        App.vent.trigger "edit:meaning", wrapper.model, wrapper.region

      @layout.meaningsRegion.show meaningsView


    showMeaning: (meaning, region) ->
      if region?
        meaningView = @getMeaningView(meaning)
        region.show meaningView


    getLayoutView: ->
      new List.Layout

    getPanelView: ->
      new List.Panel

    getMeaningsView: ->
      new List.Meanings
        collection: @meanings

    getMeaningView: (meaning) ->
      new List.Meaning
        model: meaning
