do ->
  routes =
    settings: -> "settings"
    settings_account: -> "settings/account"
    edit_settings_account: -> "settings/account/edit"
    settings_search_tabs: -> "settings/search_tabs"
    learn: -> "learn"

  _(routes).chain().keys().each (route) ->
    Routes[route + "_path"] = routes[route]
