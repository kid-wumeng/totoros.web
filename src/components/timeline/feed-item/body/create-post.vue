<template lang="jade">
  .create-post
    .title(@click="toPostPage(post)") {{ post.title }}
    markdown-area.content(v-if="content", :content="content")
    picture-grid(v-if="pictures.length", :pictures="pictures")
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area':    require('components/@/text-area')
      'markdown-area': require('components/@/markdown-area')
      'picture-grid': require('components/image/picture-grid')

    props:
      'feed':
        type: Object
        required: true

    computed:
      post:     -> @feed.post
      content:  -> @feed.content
      pictures: -> @post?.pictures ? []
</script>


<style lang="less" scoped>
  .create-post{
    .title{
      display: inline-block;
      font-weight: 600;
      font-size: 15px;
      color: #111;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .content{
      margin-top: 7px;
      width: 90%;
      line-height: 20px;
      text-align: justify;
      font-size: 13px;
      color: #4A4A4A;
    }
    .picture-grid{
      margin-top: 13px;
      width: 60%;
    }
  }
</style>