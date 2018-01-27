<template lang="jade">
  .item
    row.head.-center
      .left
        user-face(:user="comment.user")
      .right
        user-name(:user="comment.user")
        .hint {{ hint }}
        .desc(:class="descClass", @click="clickReference") {{ desc }}
    text-area.content(:text="content" @click.native="click")
    .date {{ model.date.display(notice.createDate) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face': require('components/image/user-face')
      'user-name': require('components/user/user-name')
      'text-area': require('components/@/text-area')

    props:
      'notice':
        type: Object
        required: true

    computed:
      comment:          -> @notice.comment
      content:          -> @comment?.content
      referenceContent: -> @model.assets.trim(@comment?.referenceComment?.content ? '')

      title: ->
        switch @notice.at
          when 'post' then @notice.post.title

      hint: ->
        if(@referenceContent)
          return '回复了'
        else
          return '评论了'

      desc: ->
        if(@referenceContent)
          desc = "“#{@referenceContent}”"
        else
          desc = "#{@title}"

        if(desc.length > 36)
          return desc.slice(0, 36) + '...'
        else
          return desc

      descClass: ->
        '-title': if @referenceContent then false else true

    methods:
      click: ->
        floor = @comment.floor ? 0
        page  = Math.ceil(floor / 50)
        switch @notice.at
          when 'post' then @toPostPage(@notice.post, {comment: @comment, page})

      clickReference: (e) ->
        if(!@referenceContent)
          switch @notice.at
            when 'post' then @toPostPage(@notice.post)
          e.stopPropagation()
</script>


<style lang="less" scoped>
  .item{
    .left{
      .user-face{
        width: 23px;
      }
    }
    .right{
      >*{
        display: inline;
        font-size: 13px;
      }
      .user-name{
        margin-left: 8px;
      }
      .hint{
        margin-left: 7px;
        color: #A2AEBA;
      }
      .desc{
        margin-left: 6px;
        color: #A2AEBA;
      }
      .desc.-title{
        font-weight: 600;
        color: #445669;
        cursor: pointer;
        &:hover{
          text-decoration: underline;
        }
      }
    }
    .content{
      box-sizing: border-box;
      margin: 30px 16px;
      padding: 0 20px;
      line-height: 24px;
      text-align: justify;
      font-size: 14px;
      color: #445669;
      border-left: 3px solid #ADD9CF;
      cursor: pointer;
      &:hover{
        color: #6C7A89;
      }
    }
    .date{
      font-size: 12px;
      color: #A2AEBA;
    }
  }
</style>