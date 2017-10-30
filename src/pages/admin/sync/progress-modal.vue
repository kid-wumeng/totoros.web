<template lang="jade">
  modal.progress-modal(v-if="open" hide-close)
    .panel
      h1 {{ hint }}
      c-button(v-if="over" @click="commit('admin-sync/HIDE_PROGRESS')") 关闭对话框
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal':    require('components/@/modal')
      'c-button': require('components/@/button')

    computed:
      open:   -> @state['admin-sync'].progressOpen
      second: -> @state['admin-sync'].progressSecond
      over:   -> @state['admin-sync'].progressOver
      hint:   ->
        if @over
          return "同步完成，总用时 #{@second} 秒"
        else
          return "同步ing，已用时 #{@second} 秒"
</script>


<style lang="less" scoped>
  .progress-modal{
    .panel{
      position: relative;
      top: -10%;
      display: flex;
      flex-direction: column;
      align-items: center;
      h1{
        font-size: 18px;
        margin-bottom: 20px;
      }
    }
  }
</style>