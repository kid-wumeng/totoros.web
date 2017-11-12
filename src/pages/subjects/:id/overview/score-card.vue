<template lang="jade">
  row.score-card
    .left.col
      .score {{ displayScore }}
      .count {{ count }} users
    .right.col.-left
      .like-items.row
        .story.row
          .label 故事
          .value {{ displayStory }}
        .image.row
          .label 画面
          .value {{ displayImage }}
        .music.row
          .label 音乐
          .value {{ displayMusic }}
        .enjoy.row
          .label 游戏性
          .value {{ displayEnjoy }}
      .rank.row
        .label totoros-rank
        .value #?
</template>


<script lang="coffee">
  module.exports =
    props:
      'subject':
        type: Object
        required: true

    computed:
      story: -> @subject.markStat?.story ? 0
      image: -> @subject.markStat?.image ? 0
      music: -> @subject.markStat?.music ? 0
      enjoy: -> @subject.markStat?.enjoy ? 0

      displayStory: -> if @story then @story.toFixed(1) else '-'
      displayImage: -> if @image then @image.toFixed(1) else '-'
      displayMusic: -> if @music then @music.toFixed(1) else '-'
      displayEnjoy: -> if @enjoy then @enjoy.toFixed(1) else '-'

      score: ->
        total = 0
        count = 0
        if @model.mark.isShowItem(@subject.type, 'story') and @story
          total += @story
          count += 1
        if @model.mark.isShowItem(@subject.type, 'image') and @image
          total += @image
          count += 1
        if @model.mark.isShowItem(@subject.type, 'music') and @music
          total += @music
          count += 1
        if @model.mark.isShowItem(@subject.type, 'enjoy') and @enjoy
          total += @enjoy
          count += 1
        if(count)
          return total / count
        else
          return 0

      displayScore: -> if @score then @score.toFixed(1) else '-'

      count: ->
        will_do = @subject.markStat?['will-do'] ? 0
        doing   = @subject.markStat?['doing']   ? 0
        done    = @subject.markStat?['done']    ? 0
        do_not  = @subject.markStat?['donot']   ? 0
        return will_do + doing + done + do_not
</script>


<style lang="less" scoped>
  .score-card{
    align-self: flex-start;
    flex: none;
    padding: 10px 14px;
    background-color: rgba(250, 250, 250, 1);
    border: 1px solid rgb(240, 240, 240);
    box-shadow: 0 0 10px rgba(100, 100, 100, 0.1);
    .left{
      padding-right: 12px;
      border-right: 1px solid #EEE;
      margin-right: 12px;
      .score{
        font-weight: 600;
        font-size: 22px;
      }
      .count{
        margin-top: 6px;
        font-size: 12px;
        color: #707C88;
      }
    }
    .right{
      align-self: stretch;
      justify-content: space-between;
      .like-items{
        >*{
          margin-right: 12px;
          height: 18px;
          line-height: 18px;
          &:last-child{
            margin-right: 0;
          }
          .label{
            font-size: 13px;
            color: #707C88;
          }
          .value{
            margin-left: 3px;
            font-weight: 600;
            font-size: 13px;
          }
        }
      }
      .rank{
        .label{
          font-size: 13px;
          color: #707C88;
        }
        .value{
          margin-left: 3px;
          font-weight: 600;
          font-size: 13px;
        }
      }
    }
  }
</style>
