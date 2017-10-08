<template lang="jade">
  .rate.row.-left
    .star(
      v-for="i in 5",
      :class="{'-clickable': clickable}",
      :style="{fontSize: size, marginRight: padding}"
      @click="click(i)"
    )
      .icon.fa-star(:class="{'-active': i <= int}")
      .icon.fa-star-half(:class="{'-active': float && i === int+1}")
</template>


<script lang="coffee">
  module.exports =
    model:
      prop: 'score'
      event: 'change'

    props:
      'score':
        type: Number
        default: 0
      'clickable':
        type: Boolean
        default: false
      'size':
        type: String
        default: '15px'
      'padding':
        type: String
        default: '2px'

    computed:
      formatScore: ->
        if @score >= 5
          return 5
        else if @score >= 4.5
          return 4.5
        else if @score >= 4
          return 4
        else if @score >= 3.5
          return 3.5
        else if @score >= 3
          return 3
        else if @score >= 2.5
          return 2.5
        else if @score >= 2
          return 2
        else if @score >= 1.5
          return 1.5
        else if @score >= 1
          return 1
        else if @score >= 0.5
          return 0.5
        else
          return 0

      int:   -> parseInt(@formatScore)
      float: -> @formatScore - @int

    methods:
      click: (i) ->
        if @clickable
          if i is @int
            @$emit('change', 0)
          else
            @$emit('change', i)
</script>


<style lang="less" scoped>
  .rate{
    .star{
      position: relative;
      &:last-child{
        margin-right: 0 !important;
      }
      .icon.fa-star{
        color: #EEE;
        transition: color 0.15s ease;
      }
      .icon.fa-star-half{
        color: transparent;
        position: absolute;
        top: 0;
        pointer-events: none;
      }
      .icon.-active{
        color: #F7A9A8;
      }
    }
    .star.-clickable{
      cursor: pointer;
    }
  }
</style>
