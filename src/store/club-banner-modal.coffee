module.exports =

  state:
    open: false
    club: null

  mutations:
    'club-banner-modal/SHOW': (state, club) ->
      state.club = club
      state.open  = true

    'club-banner-modal/HIDE': (state) ->
      state.club = null
      state.open  = false

  actions:
    'club-banner-modal/show': ({dispatch, commit}, id) ->
      club = await api.call('club.get', id)
      commit('club-banner-modal/SHOW', club)