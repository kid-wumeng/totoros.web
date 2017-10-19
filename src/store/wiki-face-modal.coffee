module.exports =

  state:
    open: false
    type: ''
    data: null

  mutations:
    'wiki-face-modal/SHOW': (state, {type, data}) ->
      state.open = true
      state.type = type
      state.data = data

    'wiki-face-modal/HIDE': (state) ->
      state.open = false
      state.type = ''
      state.data = null

  actions:
    'wiki-face-modal/show': ({dispatch, commit}, {type, id}) ->
      switch type
        when 'subject'      then data = await api.call('subject.get', id)
        when 'role'         then data = await api.call('role.get', id)
        when 'person'       then data = await api.call('person.get', id)
        when 'organization' then data = await api.call('organization.get', id)
      commit('wiki-face-modal/SHOW', {type, data})