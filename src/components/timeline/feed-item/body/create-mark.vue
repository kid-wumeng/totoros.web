<template lang="jade">
  .create-mark
    text-area.comment(:text="comment")
    .subject.row.-top
      .left
        text-area.intro(:text="subject.intro", :limit="120" indent)
      .right
        photo-frame
          subject-face(:subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area':    require('components/@/text-area')
      'photo-frame':  require('components/wiki/photo-frame')
      'subject-face': require('components/image/subject-face')

    props:
      'feed':
        type: Object
        required: true

    computed:
      mark:    -> @feed.mark
      subject: -> @mark?.subject
      comment: -> @mark?.comment
</script>


<style lang="less" scoped>
  .create-mark{
    .left{
      flex: auto;
      margin-right: 12px;
    }
    .subject{
      margin-top: 12px;
      box-sizing: border-box;
      padding: 12px 12px;
      background-color: rgba(250, 250, 250, 1);
      .subject-face{
        width: 100px;
      }
      .intro{
        color: #4C5F72;
      }
    }
  }
</style>