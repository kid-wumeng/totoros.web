<template lang="jade">
  .wiki-detail-box
    .title {{ title }}
    .content(:class="contentClass")
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
      'noBorder':
        type: Boolean
        default: false

    computed:
      contentClass: ->
        '-no-border': @noBorder
</script>


<style lang="less">
  .wiki-detail-box{
    >.title{
      text-align: center;
      font-size: 14px;
      font-weight: 600;
      color: #A2AEBA;
    }
    >.content{
      margin-top: 7px;
      box-sizing: border-box;
      border: 1px solid #E4E8EB;
      border-radius: 3px;
      overflow: hidden;
    }
    >.content.-no-border{
      border: none;
    }
  }
</style>