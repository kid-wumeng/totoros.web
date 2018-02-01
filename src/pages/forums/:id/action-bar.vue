<template lang="jade">
  row.action-bar.-between.-center(v-if="login")
    .left
      c-button(@click="publish") 发布帖子
    .right(v-if="managers.length")
      span.label 版主：
      sep-row.managers
        user-name(v-for="manager in managers", :key="manager.id", :user="manager")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':  require('components/@/button')
      'sep-row':   require('components/@/sep-row')
      'user-name': require('components/user/user-name')

    props:
      'forum':
        type: Object
        required: true

    computed:
      managers: -> @forum.managers ? []

    methods:
      publish: ->
        @dispatch('post-modal/show', {
          forum: @forum
        })
</script>


<style lang="less" scoped>
  .action-bar{
    .left{
      flex: none;
    }
    .label{
      font-size: 12px;
      color: #A2AEBA;
      user-select: none;
      margin-right: 2px;
    }
    .sep-row{
      display: inline;
      >*{
        display: inline !important;
      }
    }
    .user-name{
      font-size: 12px;
    }
  }
</style>