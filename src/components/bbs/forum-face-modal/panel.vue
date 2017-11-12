<template lang="jade">
  .panel
    h1 上传头像：{{ forum.name }}
    c-image(v-if="dataUrl", :url="dataUrl" cover)
    forum-face(v-else :forum="forum")
    .row.-auto
      file-select(@select="select"): c-button 选择本地图片
      c-button(:disabled="!dataUrl" @click="upload") 上传
</template>


<script lang="coffee">
  module.exports =
    components:
      'file-select':  require('components/@/file-select')
      'c-button':     require('components/@/button')
      'c-image':      require('components/image/image')
      'forum-face':    require('components/image/forum-face')

    data: ->
      file: null
      dataUrl: ''

    computed:
      forum: -> @state['forum-face-modal'].forum

    methods:
      select: (file) ->
        @file = file
        @readDataUrl file, (@dataUrl) =>

      upload: ->
        try
          @toast('图片上传中...', 0)
          forum = await api.call('forum.uploadFace', @forum.id, @file)
          @notify('done', '上传成功！')
          @commit('forum-face-modal/HIDE')
        catch error
          @notify('fail', error.message, 5000)
        @commit('toast/HIDE')
</script>


<style lang="less" scoped>
  .panel{
    position: relative;
    top: -5%;
    box-sizing: border-box;
    >h1{
      text-align: center;
      font-size: 20px;
      margin-bottom: 12px;
    }
    >.image{
      box-sizing: border-box;
      width: 250px;
      height: 250px;
      border-radius: 3px;
    }
    >.forum-face{
      width: 100%;
      cursor: default;
    }
    >.row{
      margin: 0 auto;
      margin-top: 20px;
      width: 250px;
      >.file-select{
        margin-right: 6px;
        .button{
          width: 100%;
        }
      }
    }
  }
</style>