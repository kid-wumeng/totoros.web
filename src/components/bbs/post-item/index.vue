<template lang="jade">
  .post-item.row.-left
    .left
      user-face(:user="post.user")
    row.right.-between.-center
      div
        span.title(@click="toPostPage(post)") {{ post.title }}
        span.comment-count(v-if="commentCount") replies +{{ commentCount }}
      row.last.-center
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
      width: 28px;
      margin-right: 10px;
    }
    .title{
      align-self: flex-start;
      font-weight: 400;
      font-size: 14px;
      color: #222;
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
    .last{
      margin-left: 8px;
      flex: none;
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
  }
</style>