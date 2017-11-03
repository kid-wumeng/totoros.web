<template lang="jade">
  .detail-area
    row.-center
      .title {{ title }}
      sep-row(sep="/", :padding="6")
        .tab(v-for="(tab, index) in tabs", :key="index" @click="tab.click()") {{ tab.label }}
    c-line
    slot
</template>


<script lang="coffee">
  module.exports =
    components:
      'sep-row': require('components/@/sep-row')
      'c-line':  require('components/@/line')

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
    .sep-row{
      margin-left: 14px;
      .tab{
        font-weight: 500;
        font-size: 12px;
        color: #707C88;
        cursor: pointer;
        &:hover{
        }
      }
    }
    .line{
      margin-top: 8px;
      margin-bottom: 12px;
      color: rgba(245, 245, 245, 1);
    }
  }
</style>