<template lang="jade">
  .detail-area
    .row.-left
      .title {{ title }}
      .tab.row.-left(v-for="(tab, index) in tabs", :key="index" @click="tab.click()") {{ tab.label }} {{ tab.count }}
    c-line
    slot
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-line': require('components/@/line')

    props:
      'title':
        type: String
        default: ''
      'tabs':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .detail-area{
    .title{
      font-weight: 600;
      font-size: 15px;
    }
    .tab{
      margin-left: 12px;
      cursor: pointer;
      font-weight: 600;
      font-size: 13px;
      color: #8B9FC9;
    }
    .line{
      margin-top: 8px;
      margin-bottom: 12px;
      color: #EEE;
    }
  }
</style>