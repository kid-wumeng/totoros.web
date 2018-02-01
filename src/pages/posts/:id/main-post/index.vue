<template lang="jade">
  .main-post(v-if="routePage === 1")
    row.title-row.-between.-center
      .left
        router-link.forum-name(:to="getForumPath(post.forum)") {{ post.forum.name }}
        .sep.icon.fa-angle-right
        .title {{ post.title }}
      .right
        .label 主题
    floor.content(:user="post.user", :content="post.content", :date="post.createDate", :show-edit="true" @update="update")
</template>


<script lang="coffee">
  module.exports =
    components:
      'floor': require('components/@/floor')

    props:
      'post':
        type: Object
        required: true

    methods:
      update: ->
        @dispatch('post-modal/show', {post: @post})
</script>


<style lang="less" scoped>
  .main-post{
    box-sizing: border-box;
    background-color: #FFF;
    overflow: hidden;
    .title-row{
      box-sizing: border-box;
      padding: 40px 30px 10px;
      .left > *{
        display: inline;
        line-height: 25px;
      }
      .right{
        flex: none;
        margin-left: 60px;
      }
    }
    .forum-name{
      font-weight: 500;
      font-size: 15px;
      color: #A2AEBA;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .sep{
      margin: 0 10px;
      font-size: 15px;
      color: #A2AEBA;
    }
    .title{
      font-weight: 600;
      font-size: 17px;
      color: #262626;
    }
    .label{
      flex: none;
      font-size: 13px;
      font-weight: 600;
      color: #A2AEBA;
    }
  }
</style>
