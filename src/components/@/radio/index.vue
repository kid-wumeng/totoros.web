<template lang="jade">
  .radio.-center(:class="radioClass" @click="change") {{ label }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'label':
        type: String
        required: true
      'value':
        type: null
        required: true

    data: ->
      active:       false
      borderTop:    false
      borderBottom: false
      borderLeft:   false
      borderRight:  false

    computed:
      radioClass: ->
        '-active':       @active
        '-borderTop':    @borderTop
        '-borderBottom': @borderBottom
        '-borderLeft':   @borderLeft
        '-borderRight':  @borderRight

    methods:
      change: ->
        @$emit('change', @value, !@active)
</script>


<style lang="less" scoped>
  .radio{
    box-sizing: border-box;
    height: 32px;
    align-self: stretch;
    font-weight: 400;
    font-size: 14px;
    color: #BBB;
    cursor: pointer;
  }
  .radio.-active{
    background-color: #fafbfc;
    box-shadow: inset 0 1px 2px rgba(27, 31, 35, 0.075);
    font-weight: 600;
    color: #445669;
  }
  .radio.-borderTop{
    border-top: 1px solid rgb(209, 213, 218);
  }
  .radio.-borderBottom{
    border-bottom: 1px solid rgb(209, 213, 218);
  }
  .radio.-borderLeft{
    border-left: 1px solid rgb(209, 213, 218);
  }
  .radio.-borderRight{
    border-right: 1px solid rgb(209, 213, 218);
  }
</style>
