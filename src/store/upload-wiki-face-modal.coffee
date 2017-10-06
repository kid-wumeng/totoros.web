module.exports =

  # type = subject | role | person | organization

  state:
    open: false
    type: ''
    id:   0

  mutations:
    SHOW_UPLOAD_WIKI_FACE_MODAL: (state, {type, id}) ->
      state.open = true
      state.type = type
      state.id   = id

    HIDE_UPLOAD_WIKI_FACE_MODAL: (state) ->
      state.open = false
      state.type = ''
      state.id   = 0

  actions:
    'show-upload-wiki-face-modal': ({dispatch, commit}, {type, id}) ->
      commit('SHOW_UPLOAD_WIKI_FACE_MODAL', {type, id})
      switch type
        when 'subject'      then dispatch('get-subject', id)
        when 'role'         then dispatch('get-role', id)
        when 'person'       then dispatch('get-person', id)
        when 'organization' then dispatch('get-organization', id)
