module.exports =

  state:
    feeds: []
    total: 0
    page:  1
    size:  20
    moreShow: false
    moreSure: false

  mutations:
    REMOVE_FEED: (state, feed) ->
      removeItem(state.feeds, feed)

    ADD_FEED_COMMENT: (state, {feed, comment}) ->
      for _, i in state.feeds
        if isSame(state.feeds[i], feed)
          feed = state.feeds[i]
          if !feed.comments
            Vue.set(feed, 'comments', [])
          feed.comments.unshift(comment)

    'public-timeline/SET_FEEDS': (state, feeds) ->
      state.feeds = feeds

    'public-timeline/SET_TOTAL': (state, total) ->
      state.total = total

    'public-timeline/INC_PAGE': (state) ->
      state.page = state.page + 1

    'public-timeline/SET_MORE_SHOW': (state, moreShow) ->
      state.moreShow = moreShow

    'public-timeline/SET_MORE_SURE': (state, moreSure) ->
      state.moreSure = moreSure

    'public-timeline/APPEND_FEEDS': (state, feeds) ->
      state.feeds = state.feeds.concat(feeds)

    'public-timeline/RESET': (state) ->
      state.total = 0
      state.page  = 1
      state.more     = false
      state.moreSure = false

  actions:
    'public-timeline/init': ({state, commit, dispatch}) ->
      commit('public-timeline/RESET')
      result = await api.call('feed.getAllByPublic', {
        page: 1
        size: state.size
      })
      commit('public-timeline/SET_FEEDS', result.feeds)
      commit('public-timeline/SET_TOTAL', result.total)
      dispatch('public-timeline/moreSure')


    'public-timeline/more': ({state, commit, dispatch}) ->
      commit('public-timeline/INC_PAGE')
      result = await api.call('feed.getAllByPublic', {
        page: state.page
        size: state.size
      })
      commit('public-timeline/APPEND_FEEDS', result.feeds)
      dispatch('public-timeline/moreSure')


    'public-timeline/moreSure': ({state, commit}) ->
      if(state.page * state.size < state.total)
        commit('public-timeline/SET_MORE_SHOW', true)
      else
        commit('public-timeline/SET_MORE_SHOW', false)
      commit('public-timeline/SET_MORE_SURE', true)