module.exports =

  state:
    open: false
    allowType: null
    type: null
    q: ''
    results: []
    redirect: false
    resolve: null


  mutations:
    'search-modal/SHOW': (state, {allowType, redirect, resolve}) ->
      state.open      = true
      state.allowType = allowType
      state.type      = if allowType then allowType else 'subject'
      state.redirect  = redirect
      state.resolve   = resolve

    'search-modal/HIDE': (state) ->
      state.open      = false
      state.allowType = null
      state.type      = null
      state.q         = ''
      state.results   = []
      state.redirect  = false
      state.resolve   = null

    'search-modal/SET_TYPE': (state, type) ->
      state.type = type

    'search-modal/SET_Q': (state, q) ->
      state.q = q

    'search-modal/SET_RESULTS': (state, {results}) ->
      state.results = results ? []


  actions:
    'search-modal/show': ({dispatch, commit}, {allowType, redirect}) ->
      return new Promise (resolve) ->
        commit('search-modal/SHOW', {allowType, redirect, resolve})
        setTimeout (->
          dispatch('search-modal/search', '+id')
        ), 300  # 延时加载：防止DOM渲染影响动画性能


    'search-modal/search': ({state, commit}, sort='+id') ->
      switch state.type
        when 'user'         then method = 'user.getAll'
        when 'subject'      then method = 'subject.getAll'
        when 'role'         then method = 'role.getAll'
        when 'person'       then method = 'person.getAll'
        when 'organization' then method = 'organization.getAll'

      result = await api.call(method, {q: state.q, intro: true, sort, size: 20})

      switch state.type
        when 'user'         then commit('search-modal/SET_RESULTS', {results: result.users})
        when 'subject'      then commit('search-modal/SET_RESULTS', {results: result.subjects})
        when 'role'         then commit('search-modal/SET_RESULTS', {results: result.roles})
        when 'person'       then commit('search-modal/SET_RESULTS', {results: result.persons})
        when 'organization' then commit('search-modal/SET_RESULTS', {results: result.organizations})