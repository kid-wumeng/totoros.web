<template lang="jade">
  .face-area
    user-face(:user="user", :class="{'-clickable': isMe(user)}" prevent @click="uploadFace")
    c-button(v-if="isMe(user)" @click="$router.push('/setting')") Setting
    div(v-else)
      c-button(v-if="followSure && !followed" @click="follow") + 关注
      c-button.-gray(v-if="followSure && followed" @click="unfollow") 取消关注

    user-face-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':       require('components/image/user-face')
      'user-face-modal': require('components/user/user-face-modal')
      'c-button':        require('components/@/button')

    props:
      'user':
        type: Object
        required: true

    data: ->
      followed:   false
      followSure: false

    methods:
      init: ->
        @followed   = await api.call('user.followSure', @user.id)
        @followSure = true

      uploadFace: ->
        if @isMe(@user)
          @commit('user-face-modal/SHOW')

      follow: ->
        if(@login)
          await api.call('user.follow', @user.id)
          @followed = true
          @notify('done', '关注成功')

      unfollow: ->
        if(@login)
          await api.call('user.unfollow', @user.id)
          @followed = false
          @notify('done', '取消成功')
</script>


<style lang="less" scoped>
  .face-area{
    @padding: 4px;

    box-sizing: border-box;
    width: 180px;
    padding: @padding;
    background-color: #FFF;
    border-radius: 3px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);

    .user-face:not(.-clickable){
      cursor: auto;
    }

    .button{
      margin-top: @padding;
      width: 100%;
      height: 28px;
      line-height: 28px;
      font-size: 13px;
    }
    .button.-gray{
      background-color: rgba(250, 250, 250, 1);
    }
  }
</style>