<template lang="jade">
  .banner
    .upload(v-if="isMe(user)" @click="click") 点击更新题图
    user-banner(:user="user")
    user-banner-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-banner':       require('components/image/user-banner')
      'user-banner-modal': require('components/user/user-banner-modal')

    props:
      'user':
        type: Object
        required: true

    methods:
      click: ->
        if @isMe(@user)
          @commit('user-banner-modal/SHOW')
</script>


<style lang="less" scoped>
  .banner{
    width: 100%;
    position: relative;
    .upload{
      position: absolute;
      right: 20px;
      top: 20px;
      padding: 6px 12px;
      font-weight: 600;
      font-size: 15px;
      color: #FFF;
      border: 1px dashed #FFF;
      cursor: pointer;
      opacity: 0.4;
      transition: opacity 0.2s ease;
      &:hover{
        opacity: 0.9;
      }
    }
  }
</style>