<template lang="jade">
  row.mark-score-simple.-center
    row.item.-center(v-if="isShowStory", :score="story", :class="{'-active': activeStory}")
      .label 剧情
      .score
        span.number {{ story }}
    row.item.-center(v-if="isShowImage", :score="image", :class="{'-active': activeImage}")
      .label 画面
      .score
        span.number {{ image }}
    row.item.-center(v-if="isShowMusic", :score="music", :class="{'-active': activeMusic}")
      .label 音乐
      .score
        span.number {{ music }}
    row.item.-center(v-if="isShowEnjoy", :score="enjoy", :class="{'-active': activeEnjoy}")
      .label 游戏性
      .score
        span.number {{ enjoy }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'mark':
        type: Object
        required: true

    computed:
      subject: -> @mark.subject
      story:   -> if @mark.story then @mark.story else ''
      image:   -> if @mark.image then @mark.image else ''
      music:   -> if @mark.music then @mark.music else ''
      enjoy:   -> if @mark.enjoy then @mark.enjoy else ''
      isShowStory: -> @model.mark.isShowItem(@mark.subject.type, 'story') and @story
      isShowImage: -> @model.mark.isShowItem(@mark.subject.type, 'image') and @image
      isShowMusic: -> @model.mark.isShowItem(@mark.subject.type, 'music') and @music
      isShowEnjoy: -> @model.mark.isShowItem(@mark.subject.type, 'enjoy') and @enjoy
      activeStory: -> @mark.story and @mark.story >= 5
      activeImage: -> @mark.image and @mark.image >= 5
      activeMusic: -> @mark.music and @mark.music >= 5
      activeEnjoy: -> @mark.enjoy and @mark.enjoy >= 5
</script>


<style lang="less" scoped>
  .mark-score-simple{
    box-sizing: border-box;
    .progress{
      margin-right: 12px;
    }
    .item{
      height: 16px;
      line-height: 16px;
      margin-right: 12px;
      .label{
        flex: none;
        margin-right: 3px;
        font-size: 12px;
        color: #A2AEBA;
      }
      .score{
        flex: none;
        span{
          display: block;
          font-size: 12px;
          color: #A2AEBA;
        }
      }
    }
    .item.-active{
      .label, span{
        font-weight: 600;
        color: #5CC8AF;
      }
    }
  }
</style>