module.exports =

  state:
    items: []

  mutations:
    UPDATE_SUBJECT: (state, subject) ->
      subject.resources = [{
        url: 'http://www.bilibili.com/video/av15119339/'
      },{
        url: 'http://www.dilidili.wang/anime/divetsnh/'
      },{
        url: 'http://pan.baidu.com/s/1eS3UgTk'
      }]
      Vue.set(state.items, subject.id, subject)

  actions:
    'get-subject': ({commit}, id) ->
      subject = await api.call('subject.get', id)
      commit('UPDATE_SUBJECT', subject)