module.exports =

  state:
    feeds: []
    total: 0
    page: 1
    size: 30
    over: false

  mutations:
    'public-timeline/APPEND_FEEDS': (state, feeds) ->
      state.feeds  = feeds

    'public-timeline/SET_TOTAL': (state, total) ->
      state.total = total

    'public-timeline/SET_PAGE': (state, page) ->
      state.page = page

    'public-timeline/SET_OVER': (state, over) ->
      state.over = over

    'public-timeline/RESET': (state) ->
      state.feeds = []
      state.total = 0
      state.page  = 1
      state.over  = false

  actions:
    'public-timeline/init': ({state, commit}) ->
      commit('public-timeline/RESET')
      result = await api.call('feed.getAllByPublic', {
        size: state.size
      })
      commit('public-timeline/APPEND_FEEDS', result.feeds)
      commit('public-timeline/SET_TOTAL', result.total)


    'public-timeline/more': ({state, commit}) ->
      page = state.page + 1
      size = state.size
      total = state.total

      if page * size >= total
        commit('public-timeline/SET_OVER', true)
      commit('public-timeline/SET_PAGE', page)

      result = await api.call('feed.getAllByPublic', {
        page: page
        size: size
      })
      commit('public-timeline/APPEND_FEEDS', result.feeds)