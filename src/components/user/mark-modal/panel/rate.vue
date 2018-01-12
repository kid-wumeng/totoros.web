<template lang="jade">
  row.rate
    .label {{ label }}
    .item.-center(v-for="i in 7", :key="i", @click="click(i)")
      cdn-image.icon.-active(v-if="i <= score" path="assets/star-active?2017-11-01", :noStop="true")
      cdn-image.icon(v-if="i > score" path="assets/star?2017-11-01", :noStop="true")
    .text(v-if="score") {{ score }} - {{ model.mark.displayScore(score) }}
    cdn-image.preload(path="assets/star-active?2017-11-01")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-animate': require('components/@/animate')
      'cdn-image': require('components/image/cdn-image')

    model:
      prop:  'score'
      event: 'change'

    props:
      'label':
        type: String
        required: true
      'score':
        type: Number
        default: 0

    methods:
      click: (i) ->
        if i is @score
          @$emit('change', 0)
        else
          @$emit('change', i)
</script>


<style lang="less" scoped>
  .rate{
    padding: 6px 0;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    .label{
      text-align: right;
      font-weight: 500;
      font-size: 13px;
      margin-right: 12px;
    }
    .item{
      box-sizing: border-box;
      cursor: pointer;
      margin-right: 2px;
      &:last-child{
        margin-right: 0;
      }
      .icon{
        width: 24px;
        height: 24px;
        opacity: 0.5;
        &.-active{
          opacity: 1;
        }
      }
    }
    .text{
      margin-left: 12px;
      font-size: 13px;
      font-weight: 600;
      color: #A2AEBA;
    }
    .preload{
      display: none;
      width: 24px;
      height: 24px;
    }
  }
</style>