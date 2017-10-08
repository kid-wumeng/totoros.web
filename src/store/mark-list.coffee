module.exports =

  state:
    items: []

  mutations:
    UPDATE_MARK: (state, mark) ->
      Vue.set(state.items, mark.id, mark)

    UPDATE_MARKS: (state, marks) ->
      for mark in marks
        Vue.set(state.items, mark.id, mark)