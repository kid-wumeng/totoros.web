module.exports =

  state:
    open:    false
    subject: null
    casts:   []
    records: []

  mutations:
    CREATE_CAST: (state, cast) ->
      state.casts.push(cast)

    UPDATE_CAST: (state, cast) ->
      update(state.casts, cast)

    REMOVE_CAST: (state, cast) ->
      remove(state.casts, cast)

    'edit-subject-casts-modal/SHOW': (state, {subject, casts, records}) ->
      state.open    = true
      state.subject = subject
      state.casts   = casts   ? []
      state.records = records ? []

    'edit-subject-casts-modal/HIDE': (state) ->
      state.open    = false
      state.subject = null
      state.casts   = []
      state.records = []

    'edit-subject-casts-modal/ADD_RECORD': (state, record) ->
      state.records = [record, state.records...]

  actions:
    'edit-subject-casts-modal/show': ({commit}, id) ->
      subject = await api.call('subject.get', id)
      casts   = await api.call('cast.getAll', {sid: id})
      records = await api.call('subject.getEditRecords', id, {type: 'cast'})
      commit('edit-subject-casts-modal/SHOW', {subject, casts, records})