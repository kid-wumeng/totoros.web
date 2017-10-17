<template lang="jade">
  .panel(v-if="model")
    h1 上传头像
    c-image(v-if="dataUrl", :url="dataUrl" cover)
    user-face(v-else :user="loginUser")
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
      'user-face':   require('components/image/user-face')

    data: ->
      file: null
      dataUrl: ''

    methods:
      select: (file) ->
        @file = file
        @readDataUrl file, (@dataUrl) =>

      upload: ->
        @toast('图片上传中...', 0)
        try
          user = await api.call('account.uploadFace', @file)
          @done(user)
        catch error
          @fail(error)

      done: (user) ->
        @commit('HIDE_TOAST')
        @notify('done', '上传成功！')
        @commit('UPDATE_USER', user)
        @commit('user-face-modal/HIDE')

      fail: (error) ->
        @commit('HIDE_TOAST')
        @notify('fail', error.message, 5000)
</script>


<style lang="less" scoped>
  .panel{
    position: relative;
    top: -5%;
    box-sizing: border-box;
    width: 250px;
    >h1{
      text-align: center;
      font-size: 20px;
      margin-bottom: 12px;
    }
    >.image{
      box-sizing: border-box;
      width: 250px;
      height: 250px;
      border: 1px solid #EEE;
      border-radius: 3px;
    }
    >.uset-face{
      width: 100%;
      cursor: default;
    }
    >.row{
      margin-top: 20px;
      >.file-select{
        margin-right: 6px;
        .button{
          width: 100%;
        }
      }
    }
  }
</style>
