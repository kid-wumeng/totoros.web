<template lang="jade">
  .foot.row.-left.-top
    .left
      comment-form(v-if="showForm", :feed="feed", @add-done="showForm=false")
      comment-list(:feed="feed")
    .right.row.-left
      action(icon="fa-comment-o", :label="labelComment" @click="showForm=!showForm")
      action(icon="fa-thumbs-o-up" label="赞")
</template>


<script lang="coffee">
  module.exports =
    components:
      'action':       require('components/@/action')
      'comment-form': require('./comment-form')
      'comment-list': require('./comment-list')

    props:
      'feed':
        type: Object
        required: true

    data: ->
      showForm: false

    computed:
      labelComment: ->
        if @feed.commentCount
          return '回复 ' + @feed.commentCount
        else
          return '回复'
</script>


<style lang="less" scoped>
  .foot{
    box-sizing: border-box;
    padding: 0 16px 16px 16px;
    >.left{
      flex: auto;
      margin-right: 80px;
    }
    >.right{
      flex: none;
    }
    .action{
      color: #A2AEBA;
    }
  }
</style>