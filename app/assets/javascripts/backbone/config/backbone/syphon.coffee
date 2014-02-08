Backbone.Syphon.InputReaders.register 'checkbox', ($el) ->
  $el.val()

Backbone.Syphon.KeyAssignmentValidators.register "checkbox", ($el, key, value) ->
  $el.prop("checked")
