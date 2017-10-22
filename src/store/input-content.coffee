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


  actions:
    'input-content/add-pictures': ({dispatch, commit}, files) ->
      total = files.length
      count = 0
      commit('toast/SHOW', "上传图片中，请耐心等待... #{count}/#{total}")

      tasks = []
      for file in files
        task = api.task('picture.upload', file).done (picture) ->
          commit('input-content/ADD_PICTURE', picture)
          dispatch('input-content/mountPicture', picture)
          count++
          if count is total
            commit('toast/HIDE')
          else
            commit('toast/SHOW', "上传图片中，请耐心等待... #{count}/#{total}")
        tasks.push(task)

      api.callSeq(tasks).done ->
        dispatch('notify/show', {type: 'done', message: '上传完成'})


    'input-content/mount': ({state, commit}, string) ->
      position = state.getCursorPosition()
      before   = state.content.slice(0, position)
      after    = state.content.slice(position)
      string   = string
      content  = before + string + after
      commit('input-content/SET_CONTENT', content)


    'input-content/mountPicture': ({dispatch}, picture) ->
      string = "![](#{picture.hash})\n"
      dispatch('input-content/mount', string)


    'input-content/mountSubject': ({dispatch}, subject) ->
      id      = subject.id
      name    = subject.name
      type    = subject.type
      season  = subject.season ? ''
      version = subject.face?.version ? ''
      string  = "[#{name}](subject?id=#{id}&type=#{type}&season=#{season}&face.version=#{version})\n"
      dispatch('input-content/mount', string)


    'input-content/mountRole': ({dispatch}, role) ->
      id      = role.id
      name    = role.name
      version = role.face?.version ? ''
      string  = "[#{name}](role?id=#{id}&face.version=#{version})\n"
      dispatch('input-content/mount', string)


    'input-content/mountPerson': ({dispatch}, person) ->
      id      = person.id
      name    = person.name
      version = person.face?.version   ? ''
      year    = person.birthDate?.year ? ''
      string  = "[#{name}](person?id=#{id}&birthDate.year=#{year}&face.version=#{version})\n"
      dispatch('input-content/mount', string)


    'input-content/mountOrganization': ({dispatch}, organization) ->
      id      = organization.id
      name    = organization.name
      version = organization.face?.version       ? ''
      year    = organization.establishDate?.year ? ''
      string  = "[#{name}](organization?id=#{id}&establishDate.year=#{year}&face.version=#{version})\n"
      dispatch('input-content/mount', string)