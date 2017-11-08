<template lang="jade">
  row.header.-between.-center(v-if="routePage === 1")
    row.left
      user-face(:user="user")
      column.-between
        .top
          user-name(:user="user")
          .motto(v-if="user.motto") {{ user.motto }}
        .bottom
          .date {{ model.date.display(post.createDate) }}
    .right
      c-button.-gray(v-if="admin") 置顶
      c-button.-gray(v-if="isMe(post.user)", @click="update") 修改贴子
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':  require('components/@/button')
      'user-face': require('components/image/user-face')
      'user-name': require('components/user/user-name')

    props:
      'post':
        type: Object
        required: true

    computed:
      user: -> @post.user

    methods:
      update: ->
        @dispatch('post-modal/show', {post: @post})
</script>


<style lang="less" scoped>
  .header{
    >.left{
      align-items: stretch;
    }
    >.right{
      flex: none;
    }
    .user-face{
      width: 64px;
      margin-right: 10px;
    }
    .user-name{
      display: inline-block;
      font-size: 14px;
      color: #445669;
    }
    .motto{
      margin-top: 2px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .date{
      margin-right: 6px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .button{
      margin-left: 6px;
      &:first-child{
        margin-left: 0;
      }
    }
  }
</style>
