module.exports =

  state:
    open: false
    allowType: null
    type: null
    q: ''
    results: []
    resolve: null


  mutations:
    'search-modal/SHOW': (state, {allowType, resolve}) ->
      state.open      = true
      state.allowType = allowType
      state.type      = if allowType then allowType else 'subject'
      state.resolve   = resolve

    'search-modal/HIDE': (state) ->
      state.open      = false
      state.allowType = null
      state.type      = null
      state.q         = ''
      state.results   = []
      state.resolve   = null

    'search-modal/SET_TYPE': (state, type) ->
      state.type = type

    'search-modal/SET_Q': (state, q) ->
      state.q = q

    'search-modal/SET_RESULTS': (state, {results}) ->
      state.results = results ? []


  actions:
    'search-modal/show': ({dispatch, commit}, {allowType}) ->
      return new Promise (resolve) ->
        commit('search-modal/SHOW', {allowType, resolve})
        dispatch('search-modal/search')


    'search-modal/search': ({state, commit}) ->
      switch state.type
        when 'user'         then method = 'user.getAll'
        when 'subject'      then method = 'subject.getAll'
        when 'role'         then method = 'role.getAll'
        when 'person'       then method = 'person.getAll'
        when 'organization' then method = 'organization.getAll'

      api.call(method, {q: state.q, intro: true, size: 100}).done (result) ->
        switch state.type
          when 'user'         then commit('search-modal/SET_RESULTS', {results: result.users})
          when 'subject'      then commit('search-modal/SET_RESULTS', {results: result.subjects})
          when 'role'         then commit('search-modal/SET_RESULTS', {results: result.roles})
          when 'person'       then commit('search-modal/SET_RESULTS', {results: result.persons})
          when 'organization' then commit('search-modal/SET_RESULTS', {results: result.organizations})