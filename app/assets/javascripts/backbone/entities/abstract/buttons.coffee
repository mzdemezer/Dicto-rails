@DictoRails.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Button extends Entities.Model
		defaults:
			buttonType: "button"

	class Entities.ButtonsCollection extends Entities.Collection
		model: Entities.Button

	API =
		getFormButtons: (buttons, model) ->
			buttons = @getDefaultButtons buttons, model

			array = []
			unless buttons.cancel is false
				array.push
					type: "cancel"
					className: "btn btn-default"
					text: buttons.cancel

			unless buttons.primary is false
				array.push
					type: "primary"
					className: "btn btn-primary"
					text: buttons.primary
					buttonType: "submit"

			array.reverse() if buttons.placement is "left"

			if buttons.className
				additionalClass = " " + buttons.className
				_(array).each (button) ->
					button.className += additionalClass

			buttonCollection = new Entities.ButtonsCollection array
			buttonCollection.placement = buttons.placement
			buttonCollection

		getDefaultButtons: (buttons, model) ->
			_.defaults buttons,
				primary: if model.isNew() then "Create" else "Update"
				cancel: "Cancel"
				placement: "right"
				className: ""

	App.reqres.setHandler "form:button:entities", (buttons = {}, model) ->
		API.getFormButtons buttons, model
