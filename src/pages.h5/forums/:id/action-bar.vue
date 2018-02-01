<template lang="jade">
  .action-bar
    .publish(@click="publish") 发布一个话题
</template>


<script lang="coffee">
  module.exports =
    props:
      'forum':
        type: Object
        required: true

    computed:
      managers: -> @forum.managers ? []

    methods:
      publish: ->
        if(@login)
          @dispatch('post-modal/show', {forum: @forum})
        else
          @$router.push('/register')
</script>


<style lang="less" scoped>
  .action-bar{
    box-sizing: border-box;
    padding: 0 16px;
    padding-bottom: 16px;
    text-align: center;
    background-color: #FFF;
    .publish{
      display: inline-block;
      padding: 6px 16px;
      font-size: 14px;
      font-weight: 600;
      color: #707C88;
      border: 0.5px solid #707C88;
      border-radius: 3px;
      cursor: pointer;
    }
  }
</style>