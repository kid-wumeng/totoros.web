module.exports =

  state:
    content: ''
    pictures: []
    getCursorPosition: null

  mutations:
    'input-content/SET_CONTENT': (state, content) ->
      state.content = content ? ''

    'input-content/SET_PICTURES': (state, pictures) ->
      state.pictures = pictures ? []

    'input-content/SET_GET_CURSOR_POSITION': (state, getCursorPosition) ->
      state.getCursorPosition = getCursorPosition ? (-> 0)

    'input-content/ADD_PICTURE': (state, picture) ->
      state.pictures.push(picture)

    'input-content/MOUNT_PICTURE': (state, picture) ->
      pos    = state.getCursorPosition()
      before = state.content.slice(0, pos)
      after  = state.content.slice(pos)
      insert = "![](#{picture.hash})\n"
      state.content = before + insert + after

  actions:
    'input-content/add-pictures': ({dispatch, commit}, files) ->
      total = files.length
      count = 0
      commit('SHOW_TOAST', "上传图片中，请耐心等待... #{count}/#{total}")

      tasks = []
      for file in files
        task = api.task('picture.upload', file).done (picture) ->
          commit('input-content/ADD_PICTURE', picture)
          commit('input-content/MOUNT_PICTURE', picture)
          count++
          if count is total
            commit('toast/HIDE')
          else
            commit('SHOW_TOAST', "上传图片中，请耐心等待... #{count}/#{total}")
        tasks.push(task)

      api.callSeq(tasks).done ->
        dispatch('notify/show', {type: 'done', message: '上传完成'})