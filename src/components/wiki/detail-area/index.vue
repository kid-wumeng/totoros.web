<template lang="jade">
  .detail-area
    .title(:class="titleClass") {{ title }}
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
      'titleCenter':
        type: Boolean
        default: false

    computed:
      titleClass: ->
        '-title-center': @titleCenter
</script>


<style lang="less" scoped>
  .detail-area{
    >.title{
      text-align: center;
      font-size: 14px;
      font-weight: 600;
      color: #A2AEBA;
    }
    >.line{
      margin-top: 7px;
      margin-bottom: 7px;
    }
  }
</style>