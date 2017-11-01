<template lang="jade">
  .panel(v-if="model")
    h1 上传Banner
    c-image(v-if="dataUrl", :url="dataUrl" cover)
    user-banner(v-else :user="loginUser")
    .row.-auto
      file-select(@select="select"): c-button 选择本地图片
      c-button(:disabled="!dataUrl" @click="upload") 上传
</template>


<script lang="coffee">
  module.exports =
    components:
      'file-select': require('components/@/file-select')
      'c-button':    require('components/@/button')
      'c-image':     require('components/image/image')
      'user-banner': require('components/image/user-banner')

    data: ->
      file: null
      dataUrl: ''

    methods:
      select: (file) ->
        @file = file
        @readDataUrl file, (@dataUrl) =>

      upload: ->
        try
          @toast('图片上传中...', 0)
          user = await api.call('account.uploadBanner', @file)
          @notify('done', '上传成功！')
          @commit('UPDATE_USER', user)
          @commit('user-banner-modal/HIDE')
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
    >.user-banner{
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
