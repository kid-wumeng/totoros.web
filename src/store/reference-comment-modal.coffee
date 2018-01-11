module.exports =

  state:
    open: false
    referenceComment: null
    createMethod: ''
    atID: 0

  mutations:
    'reference-comment-modal/SHOW': (state, {referenceComment, createMethod, atID}) ->
      state.open             = true
      state.referenceComment = referenceComment
      state.createMethod     = createMethod
      state.atID             = atID

    'reference-comment-modal/HIDE': (state) ->
      state.open         = false
      state.comment      = null
      state.createMethod = ''
      state.atID         = 0

  actions:
    'reference-comment-modal/show': ({commit}, {referenceComment, createMethod, atID}) ->
      commit('reference-comment-modal/SHOW', {referenceComment, createMethod, atID})