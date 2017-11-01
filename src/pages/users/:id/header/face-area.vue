<template lang="jade">
  .face-area
    user-face(:user="user", :class="{'-clickable': isMe(user)}" prevent @click="click")
    c-button(v-if="isMe(user)" @click="$router.push('/setting')") Setting

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

    methods:
      click: ->
        if @isMe(@user)
          @commit('user-face-modal/SHOW')
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

    >.button{
      margin-top: @padding;
      width: 100%;
      height: 28px;
      line-height: 28px;
      font-size: 13px;
    }
  }
</style>