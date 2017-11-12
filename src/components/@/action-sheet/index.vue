<template lang="jade">
  .action-sheet
    .icon.fa-angle-double-down(@click="open=true")
    .list(v-show="open", :style="listStyle" @mouseleave="open=false")
      .item(v-for="(action, index) in actions", :key="index", @click="action.click") {{ action.label }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'actions':
        type: Array
        default: -> []

    data: ->
      open: false
      width: 0

    computed:
      listStyle: ->
        width: @width + 'px'

    watch:
      'actions': ->
        @computedWidth()

    mounted: ->
      @computedWidth()

    methods:
      computedWidth: ->
        # 测试一个中文字占多宽
        oneWidth = 13
        # 拿到最长的那个功能label的字数
        max = 0
        for action in @actions
          len = action.label.length
          if len > max
            max = len
        # 列表宽度 = 最长的label的宽度 + 左右两侧内边距
        width = max * oneWidth + 24
        # 设置
        @width = width
</script>


<style lang="less" scoped>
  .action-sheet{
    @fontSize: 13px;
    position: relative;
    .icon{
      font-size: 16px;
      color: #A2AEBA;
      cursor: pointer;
    }
    .list{
      position: absolute;
      top: 20px;
      right: 0;
      z-index: 1;
      padding: 2px 0;
      background-color: rgba(252, 252, 252, 1);
      border: 1px solid rgb(230, 230, 230);
      box-shadow: 0 0 10px rgba(100, 100, 100, 0.1);
      .item{
        padding: 4px 12px;
        text-align: center;
        font-weight: 500;
        font-size: @fontSize;
        color: #A2AEBA;
        cursor: pointer;
        &:hover{
          color: #FFF;
          background-color: #3db8c1;
        }
      }
    }
  }
</style>