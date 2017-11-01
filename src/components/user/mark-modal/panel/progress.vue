<template lang="jade">
  column.progress(v-if="subject.episodeCount")
    .hint 观看进度管理
    .grid
      .episode.-center(v-for="i in episodes", :key="i", :class="{'-active': i <= progress}" @click="change(i)") {{ i }}
</template>


<script lang="coffee">
  module.exports =
    model:
      prop:  'progress'
      event: 'change'

    props:
      'subject':
        type: Object
        required: true
      'progress':
        type: Number
        default: 0

    computed:
      episodes: ->
        episodes = []
        i = @subject.episodeCount ? 0
        while i
          episodes.push(i)
          i--
        return episodes

    methods:
      change: (i) ->
        if i is @progress
          @$emit('change', 0)
        else
          @$emit('change', i)
</script>


<style lang="less" scoped>
  .progress{
    height: 100%;
    .hint{
      margin-bottom: 12px;
      text-align: right;
      font-size: 13px;
      color: #A2AEBA;
    }
    .grid{
      display: flex;
      align-items: flex-start;
      flex-wrap: wrap;
      overflow-y: scroll;
      .episode{
        width: 32px;
        height: 32px;
        font-size: 12px;
        color: #A2AEBA;
        background-color: #FAFAFA;
        border: 1px solid #FFF;
        border-radius: 3px;
        cursor: pointer;
        user-select: none;
        transition: all 0.1s ease;
      }
      .episode.-active{
        font-weight: 600;
        color: #FFF;
        background-color: #59ABE3;
      }
    }
  }
</style>