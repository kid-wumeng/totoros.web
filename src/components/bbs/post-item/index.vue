<template lang="jade">
  .post-item.row.-left
    .left
      user-face(:user="post.user")
    .right
      column.-between
        .title(@click="toPostPage(post)") {{ post.title }}
        row.-between.-center
          row.left.-center
            user-name(:user="post.user")
            .date {{ model.date.display(post.createDate) }}
          row.right.-center
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
      width: 42px;
      margin-right: 10px;
    }
    .title{
      align-self: flex-start;
      font-weight: 600;
      font-size: 14px;
      color: #707C88;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .user-name{
      margin-right: 6px;
      font-weight: 600;
      font-size: 12px;
    }
    .date{
      margin-right: 6px;
      font-size: 12px;
      color: #BBB;
    }
    .hint{
      margin-right: 6px;
      font-size: 12px;
      color: #BBB;
    }
    .comment-count{
      padding: 2px 6px;
      font-weight: 600;
      font-size: 12px;
      color: #BBB;
      border-radius: 100px;
      background-color: #F2F2F2;
    }
  }
</style>