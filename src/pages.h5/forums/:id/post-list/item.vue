<template lang="jade">
  router-link.item(:to="getPostPath(post)")
    .title-row
      user-face(:user="user" circle)
      span.top(v-if="top") [置顶]
      span.title {{ title }}
    .user-row(v-if="lastCommentDate")
      span.comment-count +{{ commentCount }}
      span.sep /
      span.hint last by
      span.name {{ lastCommentUser.name }}
      span.sep /
      span.date {{ model.date.display(lastCommentDate) }}
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
    padding: 16px 20px;
    background-color: #FFF;
    cursor: pointer;
    margin-top: 8px;
    .title-row{
      text-align: justify;
      .user-face{
        display: inline-block;
        margin-right: 9px;
        width: 20px;
        vertical-align: middle;
      }
      .top{
        margin-right: 8px;
        font-size: 12px;
        color: #A2AEBA;
        vertical-align: middle;
      }
      .title{
        align-self: flex-start;
        font-size: 16px;
        color: #262626;
        vertical-align: middle;
      }
    }
    .user-row{
      margin-top: 6px;
      >*{
        margin-right: 4px;
        font-size: 11px;
        color: #A2AEBA;
      }
    }
  }
</style>