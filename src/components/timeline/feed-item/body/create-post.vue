<template lang="jade">
  .create-post
    text-area(:text="content")
    picture-grid(v-if="pictures.length", :pictures="pictures")
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area':    require('components/@/text-area')
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
    .picture-grid{
      margin-top: 12px;
      width: 60%;
      background-color: #000;
    }
  }
</style>