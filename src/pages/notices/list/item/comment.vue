<template lang="jade">
  .item
    row.user.-center
      user-name(:user="comment.user")
      .date {{ model.date.display(notice.createDate) }}
      .hint 回复你
    text-area.content(:text="content")
    .reference(@click="clickReference")
      span.title.-more(v-if="!referenceContent") 『 {{ title }} 』
      .referenceContent.-more(v-if="referenceContent") {{ referenceContent }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-name': require('components/user/user-name')
      'text-area': require('components/@/text-area')

    props:
      'notice':
        type: Object
        required: true

    computed:
      comment:          -> @notice.comment
      content:          -> @comment?.content
      referenceContent: -> @comment?.referenceComment?.content

      title: ->
        switch @notice.at
          when 'post' then @notice.post.title

    methods:
      clickReference: ->
        floor = @comment.floor ? 0
        page  = Math.ceil(floor / 50)
        switch @notice.at
          when 'post' then @toPostPage(@notice.post, {comment: @comment.referenceComment, page})
</script>


<style lang="less" scoped>
  .item{
    .user{
      .user-name{
        font-size: 12px;
      }
      .date{
        margin-left: 6px;
        font-size: 12px;
        color: #A2AEBA;
      }
      .hint{
        margin-left: 6px;
        font-size: 12px;
        color: #A2AEBA;
      }
    }
    .content{
      margin-top: 16px;
      margin-left: 13px;
    }
    .reference{
      margin-top: 20px;
      box-sizing: border-box;
      padding: 7px 16px 10px;
      border-left: 3px solid #ADD9CF;
      line-height: 19px;
      text-align: justify;
      cursor: pointer;
      background-color: rgb(250, 250, 250);
      &:hover{
        background-color: rgb(247, 247, 247);
      }
      .title{
        font-weight: 600;
        font-size: 13px;
        color: #A2AEBA;
      }
      .referenceContent{
        margin-top: 4px;
        font-size: 13px;
        color: #A2AEBA;
      }
    }
  }
</style>