<template lang="jade">
  .panel
    h1 上传题图：{{ forum.name }}
    c-image(v-if="dataUrl", :url="dataUrl" cover)
    forum-banner(v-else :forum="forum")
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
      'forum-banner': require('components/image/forum-banner')

    data: ->
      file: null
      dataUrl: ''

    computed:
      forum: -> @state['forum-banner-modal'].forum

    methods:
      select: (file) ->
        @file = file
        @readDataUrl file, (@dataUrl) =>

      upload: ->
        try
          @toast('图片上传中...', 0)
          forum = await api.call('forum.uploadBanner', @forum.id, @file)
          @notify('done', '上传成功！')
          @commit('forum-banner-modal/HIDE')
        catch error
          @notify('fail', error.message, 5000)
        @commit('toast/HIDE')
</script>


<style lang="less" scoped>
  .panel{
    position: relative;
    top: -5%;
    box-sizing: border-box;
    width: 100%;
    >h1{
      text-align: center;
      font-size: 20px;
      margin-bottom: 12px;
    }
    >.image{
      box-sizing: border-box;
      width: 100%;
      height: 200px;
      border-radius: 3px;
    }
    >.forum-banner{
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