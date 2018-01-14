<template lang="jade">
  .item(@click="toPostPage(post)")
    row.-between.-center
      row.-center.user-row
        user-face(:user="user")
        column
          row.-between.-center
            user-name(:user="user")
            row.-center(v-if="commentCount")
              .comment-icon.icon.fa-comments-o
              .comment-count {{ commentCount }}
          row.last.-center(v-if="lastCommentDate")
            .hint 最后回复
            .name {{ lastCommentUser.name }}
            .date {{ model.date.display(lastCommentDate) }}
    .title-row
      span.top(v-if="top") [置顶]
      span.title {{ title }}
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
  .item{
    box-sizing: border-box;
    width: 100%;
    align-items: stretch;
    cursor: pointer;
    .user-row{
      flex: auto;
    }
    .column{
      flex: auto;
    }
    .user-face{
      width: 40px;
      margin-right: 12px;
    }
    .last{
      flex: none;
      >*{
        margin-right: 6px;
        font-size: 12px;
        color: #A2AEBA;
      }
    }
    .comment-icon{
      font-size: 13px;
      color: #A2AEBA;
    }
    .comment-count{
      margin-left: 6px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .top{
      margin-right: 9px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .title{
      align-self: flex-start;
      font-weight: 500;
      font-size: 14px;
      color: #273340;
    }
  }
</style>