<template lang="jade">
  .post-item.row.-left
    .left
      user-face(:user="post.user")
    .right.row
      .col.-left
        .title(@click="toPostPage(post)") {{ post.title }}
        .row.-bottom
          .left.row
            user-name(:user="post.user")
            .date {{ model.date.display(post.createDate) }}
          .right.row
            .hint {{ 18 }} comments
            .hint /
            .hint last from
            user-name(:user="post.user")
            .date {{ model.date.display(post.createDate) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face': require('components/image/user-face')
      'user-name': require('components/user/user-name')

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
      align-items: stretch;
      >.col{
        flex: auto;
        justify-content: space-between;
        >.row{
          align-self: stretch;
          flex: auto;
        }
      }
    }
    .user-face{
      width: 40px;
      margin-right: 10px;
    }
    .title{
      font-weight: 600;
      font-size: 14px;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .user-name{
      margin-right: 6px;
      font-weight: 600;
      font-size: 12px;
      color: #A2AEBA;
    }
    .date{
      margin-right: 6px;
      font-size: 12px;
      color: #CCC;
    }
    .hint{
      margin-right: 6px;
      font-size: 12px;
      color: #CCC;
    }
    .comment-count{
      padding: 2px 6px;
      font-weight: 600;
      font-size: 13px;
      color: #AAA;
      border-radius: 100px;
      background-color: #F2F2F2;
    }
  }
</style>