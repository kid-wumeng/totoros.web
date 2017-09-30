exports.focus = {
  inserted: (el, binding) ->
    if binding.value is true
      el.focus()
}