<template lang="jade">
  .type-radio-bar
    radio-bar(:value="main" @change="changeMain")
      radio(label="动画", value="anime")
      radio(label="漫画", value="comic")
      radio(label="游戏", value="game")

    radio-bar(:value="sub" @change="changeSub" v-show="main === 'anime'")
      radio(label="TV",     value="tv")
      radio(label="OVA",    value="ova")
      radio(label="Web",    value="web")
      radio(label="剧场版", value="movie")
      radio(label="同人",   value="doujin")
      radio(label="其它",   value="other")

    radio-bar(:value="sub" @change="changeSub" v-show="main === 'comic'")
      radio(label="长篇", value="long")
      radio(label="短篇", value="short")
      radio(label="画集", value="paint")
      radio(label="同人", value="doujin")
      radio(label="其它", value="other")

    radio-bar(:value="sub" @change="changeSub" v-show="main === 'game'")
      radio(label="正式发行", value="official")
      radio(label="同人",     value="doujin")
      radio(label="其它",     value="other")
</template>


<script lang="coffee">
  module.exports =
    components:
      'radio-bar': require('components/@/radio-bar')
      'radio':     require('components/@/radio')

    model:
      prop: 'type'
      event: 'change'

    props:
      'type':
        type: String
        default: ''

    data: ->
      main: @type.split('-')[0]
      sub:  @type.split('-')[1]

    methods:
      changeMain: (main) ->
        @main = main
        @sub  = ''
        @$emit('change', '')

      changeSub: (sub) ->
        @sub = sub
        @$emit('change', @main+'-'+@sub)
</script>


<style lang="less" scoped>
  .type-radio-bar{
    .radio-bar:first-child{
      margin-bottom: 12px;
    }
  }
</style>
