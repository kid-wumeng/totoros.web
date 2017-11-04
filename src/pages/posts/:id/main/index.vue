<template lang="jade">
  .main.box-frame.-outset(v-if="routePage === 1")
    row.-between.-center
      row.left
        user-face(:user="post.user")
        user-name(:user="post.user")
        .date {{ model.date.display(post.createDate) }}
      .right
        action-bar(:post="post")
    markdown-area(:content="post.content")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':     require('components/image/user-face')
      'user-name':     require('components/user/user-name')
      'markdown-area': require('components/@/markdown-area')
      'action-bar':    require('./action-bar')

    props:
      'post':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .main{
    box-sizing: border-box;
    width: 100%;
    align-items: stretch;
    padding: 20px;
    >.right{
      flex: auto;
    }
    .user-face{
      width: 48px;
      margin-right: 11px;
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
    .markdown-area{
      margin-top: 5px;
    }
  }
</style>
