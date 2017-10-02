<template lang="jade">
  .type-radio-bar
    radio-bar(:radios="main_radios",  :active="main" @change="changeMain")
    radio-bar(:radios="anime_radios", :active="sub"  @change="changeSub" v-show="main === 'anime'")
    radio-bar(:radios="comic_radios", :active="sub"  @change="changeSub" v-show="main === 'comic'")
    radio-bar(:radios="game_radios",  :active="sub"  @change="changeSub" v-show="main === 'game'")
</template>


<script lang="coffee">
  module.exports =
    components:
      'radio-bar': require('components/@/RadioBar')

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

      main_radios: [{
        label: '动画'
        value: 'anime'
      },{
        label: '漫画'
        value: 'comic'
      },{
        label: '游戏'
        value: 'game'
      }]

      anime_radios: [{
        label: 'TV'
        value: 'tv'
      },{
        label: 'OVA'
        value: 'ova'
      },{
        label: 'Web'
        value: 'web'
      },{
        label: '剧场版'
        value: 'movie'
      },{
        label: '同人'
        value: 'doujin'
      },{
        label: '其它'
        value: 'other'
      }]

      comic_radios: [{
        label: '长篇'
        value: 'long'
      },{
        label: '短篇'
        value: 'short'
      },{
        label: '画集'
        value: 'paint'
      },{
        label: '同人'
        value: 'doujin'
      },{
        label: '其它'
        value: 'other'
      }]

      game_radios: [{
        label: '正式发行'
        value: 'official'
      },{
        label: '同人'
        value: 'doujin'
      },{
        label: '其它'
        value: 'other'
      }]

    methods:
      changeMain: (radio) ->
        @main = radio.value
        @sub  = ''
        @$emit('change', '')

      changeSub: (radio) ->
        @sub = radio.value
        @$emit('change', @main+'-'+@sub)
</script>


<style lang="less" scoped>
  .type-radio-bar{
    .radio-bar:first-child{
      margin-bottom: 12px;
    }
  }
</style>
