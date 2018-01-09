<template lang="jade">
  .feed-item(:style="style")
    .wrap
      subject-face(:subject="subject" @load="load")
      .panel
        subject-name(:subject="subject")
        mark-score-simple(:mark="mark")
        text-area.comment(:text="comment")
        .user
          user-name(:user="user")
          .date {{ model.date.display(feed.createDate) }} {{model.mark.displayStatus(status, type)}}
</template>


<script lang="coffee">
  module.exports =
    components:
      'subject-face':      require('components/image/subject-face')
      'subject-name':      require('components/wiki/subject-name')
      'user-name':         require('components/user/user-name')
      'mark-score-simple': require('components/user/mark-score-simple')
      'text-area':         require('components/@/text-area')

    props:
      'feed':
        type: Object
        required: true
      'colHeights':
        type: Array
        required: true
      'width':
        type: Number
        required: true

    computed:
      mark:    -> @feed.mark
      date:    -> @feed.createDate
      user:    -> @mark.user
      status:  -> @mark.status
      comment: -> @mark.comment
      subject: -> @mark.subject
      type:    -> @subject.type
      name:    -> @subject.name

      style: ->
        width: @width + 'px'

    methods:
      load: (data) ->
        i = @getMinIndex()
        width = @$el.offsetWidth
        height = data.height + @$el.offsetHeight
        @$el.style.left = width * i + 'px'
        @$el.style.top = @colHeights[i] + 'px'
        @$emit('complete-layout', {i, height})

      getMinIndex: ->
        min = Math.min.apply(null, @colHeights);
        index = @colHeights.indexOf(min)
        return index
</script>


<style lang="less" scoped>
  .feed-item{
    position: absolute;
    box-sizing: border-box;
    padding: 5px;
    .wrap{
      .panel{
        box-sizing: border-box;
        padding: 18px 20px 16px;
        background-color: #FFF;
        .mark-score-simple{
          margin-top: 11px;
        }
        .comment{
          margin-top: 11px;
          text-align: left;
        }
        .user{
          margin-top: 18px;
          display: flex;
          justify-content: flex-end;
          align-items: center;
          flex-wrap: wrap;
          .user-name{
            font-size: 12px;
          }
          .date{
            flex: none;
            margin-left: 6px;
            font-size: 12px;
            color: #A2AEBA;
          }
        }
      }
    }
  }
</style>
