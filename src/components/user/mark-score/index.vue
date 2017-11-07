<template lang="jade">
  .mark-score
    row.item.-center(v-if="isShowStory", :score="story")
      .label {{ indent ? '　' : '' }}故事
      .score
        span.number {{ story }}
      .value: .active
    row.item.-center(v-if="isShowImage", :score="image")
      .label {{ indent ? '　' : '' }}画面
      .score
        span.number {{ image }}
      .value: .active
    row.item.-center(v-if="isShowMusic", :score="music")
      .label {{ indent ? '　' : '' }}音乐
      .score
        span.number {{ music }}
      .value: .active
    row.item.-center(v-if="isShowEnjoy", :score="enjoy")
      .label 游戏性
      .score
        span.number {{ enjoy }}
      .value: .active
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
      isShowStory: -> @model.mark.isShowItem(@mark.subject.type, 'story')
      isShowImage: -> @model.mark.isShowItem(@mark.subject.type, 'image')
      isShowMusic: -> @model.mark.isShowItem(@mark.subject.type, 'music')
      isShowEnjoy: -> @model.mark.isShowItem(@mark.subject.type, 'enjoy')
      indent:  -> @model.subject.isType(@subject.type, 'game')
</script>


<style lang="less" scoped>
  .mark-score{
    box-sizing: border-box;
    width: 140px;
    .item{
      height: 18px;
      line-height: 18px;
      .label{
        flex: none;
        margin-right: 3px;
        font-size: 12px;
      }
      .value{
        flex: auto;
        height: 10px;
        padding: 1px;
        background-color: rgba(247, 247, 247, 1);
        border: 1px solid rgb(240, 240, 240);
        border-radius: 2px;
        .active{
          height: 10px;
          border-radius: 1px;
        }
      }
      .score{
        flex: none;
        margin-right: 3px;
        span{
          font-size: 12px;
        }
        span.number{
          display: block;
          width: 8px;
          text-align: center;
          font-weight: 600;
        }
      }
    }
    .item[score="1"]{
      .active{
        width: 100% / 7 * 1;
        background-image: linear-gradient(90deg, #f46e65 0%, #d73435 90%);
      }
    }
    .item[score="2"]{
      .active{
        width: 100% / 7 * 2;
        background-image: linear-gradient(90deg, #f78e3d 0%, #d75000 90%);
      }
    }
    .item[score="3"]{
      .active{
        width: 100% / 7 * 3;
        background-image: linear-gradient(90deg, #3db8c1 0%, #00a2ae 90%);
      }
    }
    .item[score="4"]{
      .active{
        width: 100% / 7 * 4;
        background-image: linear-gradient(90deg, #3db8c1 0%, #00a2ae 90%);
      }
    }
    .item[score="5"]{
      .active{
        width: 100% / 7 * 5;
        background-image: linear-gradient(90deg, #3db8c1 0%, #00a2ae 90%);
      }
    }
    .item[score="6"]{
      .active{
        width: 100% / 7 * 6;
        background-image: linear-gradient(90deg, #3db8c1 0%, #00a2ae 90%);
      }
    }
    .item[score="7"]{
      .active{
        width: 100%;
        background-image: linear-gradient(90deg, #3db8c1 0%, #00a2ae 90%);
      }
    }
  }
</style>