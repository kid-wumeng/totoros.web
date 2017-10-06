<template lang="jade">
  .score-card.row.-left.-top
    .left.col
      .score {{ 9.25 }}
      .count {{ 618621 }} users
    .right.col.-left
      .like-items.row
        .story.row
          .label 故事
          .value 7.8
        .image.row
          .label 画面
          .value 9.1
        .music.row
          .label 音乐
          .value 6.0
        .enjoy.row
          .label 游戏性
          .value 6.7
      .rank.row
        .label Totoros-ranked
        .value \#{{7}}
</template>


<script lang="coffee">
  module.exports =
    props:
      'subject':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .score-card{
    align-self: flex-start;
    flex: none;
    padding: 8px 12px;
    background-color: rgba(250, 250, 250, 0.93);
    border: 1px solid #F2F2F2;
    border-radius: 1px;
    .left{
      padding-right: 12px;
      border-right: 1px solid #EEE;
      margin-right: 12px;
      .score{
        font-weight: 600;
        font-size: 24px;
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
