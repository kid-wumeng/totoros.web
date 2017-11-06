<template lang="jade">
  .post-item.row.-left
    .left
      user-face(:user="post.user")
    row.right.-between.-center
      row.-center
        .title(@click="toPostPage(post)") {{ post.title }}
        .comment-count(v-if="commentCount") replies +{{ commentCount }}
      row.-center
        .hint Last by
        user-name(:user="post.user")
        .date {{ model.date.display(post.createDate) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face': require('components/image/user-face')
      'user-name': require('components/user/user-name')
      'c-button':  require('components/@/button')

    props:
      'post':
        type: Object
        required: true

    computed:
      commentCount: -> @post.commentCount ? 15
</script>


<style lang="less" scoped>
  .post-item{
    box-sizing: border-box;
    width: 100%;
    align-items: stretch;
    >.right{
      flex: auto;
      .column{
        height: 100%;
      }
    }
    .user-face{
      width: 32px;
      margin-right: 10px;
    }
    .user-name{
      margin-right: 6px;
      font-size: 12px;
    }
    .date{
      font-size: 12px;
      color: #A2AEBA;
    }
    .hint{
      margin-right: 6px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .title{
      align-self: flex-start;
      font-weight: 400;
      font-size: 14px;
      color: #111;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .comment-count{
      margin-left: 6px;
      font-size: 12px;
      color: #317589;
      opacity: 0.6;
      cursor: pointer;
    }
  }
</style>