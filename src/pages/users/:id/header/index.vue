<template lang="jade">
  .header
    banner(:user="user")
    row
      face-area(:user="user")
      column
        .top
          c-base(:user="user")
        .bottom
          tab-bar(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'banner':    require('./banner')
      'face-area': require('./face-area')
      'c-base':    require('./base')
      'tab-bar':   require('./tab-bar')

    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .header{
    @offset: 90px; // 头像尺寸的一半
    >.row2{
      position: relative;
      left: 0;
      top: -@offset;
      margin: 0 auto;
      box-sizing: border-box;
      width: 1000px;
      border-bottom: 1px solid rgba(245, 245, 245, 1);
      >.column{
        align-self: stretch;
        flex: auto;
        padding-top: 18px;
        padding-left: 20px;
        padding-right: 20px;
        position: relative;
        justify-content: space-between;
        >.top{
          position: relative;
          top: @offset;
        }
      }
    }
  }
</style>