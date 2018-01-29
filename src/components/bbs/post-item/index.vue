<template lang="jade">
  router-link.post-item(:to="getPostPath(post)")
    row.-center
      .left
        user-face(:user="user" circle)
      row.right.-between.-center
        div
          span.top(v-if="top") [置顶]
          span.title {{ title }}
          span.comment-count(v-if="commentCount") +{{ commentCount }}
        row.last.-center(v-if="lastCommentDate")
          .hint Last by
          user-name(:user="lastCommentUser")
          .date {{ model.date.display(lastCommentDate) }}
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
      user:            -> @post.user
      title:           -> @post.title
      top:             -> @post.top
      commentCount:    -> @post.commentCount ? 0
      lastCommentDate: -> @post.lastCommentDate
      lastCommentUser: -> @post.lastCommentUser
</script>


<style lang="less" scoped>
  .post-item{
    box-sizing: border-box;
    width: 100%;
    align-items: stretch;
    cursor: pointer;
    &:hover{
      background-color: rgba(250, 250, 250, 1);
    }
    .right{
      flex: auto;
      .column{
        height: 100%;
      }
    }
    .user-face{
      width: 32px;
      margin-right: 12px;
    }
    .top{
      margin-right: 9px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .title{
      align-self: flex-start;
      font-weight: 400;
      font-size: 14px;
      color: darken(#445669, 5%);
      cursor: pointer;
    }
    .comment-count{
      margin-left: 6px;
      font-size: 12px;
      font-weight: 500;
      color: #C3272B;
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