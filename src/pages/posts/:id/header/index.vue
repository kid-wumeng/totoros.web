<template lang="jade">
  row.header.-between.-center(v-if="routePage === 1")
    row.left
      user-face(:user="user")
      column
        user-name(:user="user")
        .motto(v-if="user.motto") {{ user.motto }}
    .right
      c-button.-gray(v-if="admin") 置顶
      c-button.-gray(v-if="isMe(post.user)", @click="update") 修改贴子
      .date {{ model.date.display(post.createDate) }}
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
      width: 52px;
      margin-right: 10px;
    }
    .user-name{
      display: inline-block;
      font-size: 14px;
      color: #000;
    }
    .motto{
      margin-top: 2px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .date{
      margin-left: 6px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .button{
      margin-left: 8px;
      &:first-child{
        margin-left: 0;
      }
    }
  }
</style>
