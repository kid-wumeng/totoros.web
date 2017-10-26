<template lang="jade">
  .form-item.row.-top
    .left
      .label(v-if="label", :style="labelStyle") {{ label }}
    .right
      slot
      .hint(v-if="hint") {{ hint }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'label':
        type: String
        default: ''
      'hint':
        type: String
        default: ''
      'labelWidth':
        type: Number
        default: 100

    computed:
      labelStyle: ->
        'width': if @labelWidth then @labelWidth + 'px' else 'auto'
</script>


<style lang="less">
  .form-item{
    .left{
      flex: none;
      .label{
        text-align: right;
        height: 34px;
        line-height: 33px;
        font-weight: 500;
        font-size: 14px;
      }
    }
    .right{
      margin-left: 16px;
      flex: auto;
      .hint{
        margin-top: 4px;
        padding: 0 3px;
        font-size: 12px;
        color: #888;
      }
    }
  }
</style>
