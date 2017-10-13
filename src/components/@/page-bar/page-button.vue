<template lang="jade">
  .page-button(:class="rootClass") {{ page }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'page':
        type: Number
        required: true
      'disabled':
        type: Boolean
        required: true

    computed:
      rootClass: ->
        '-disabled': @disabled
</script>


<style lang="less" scoped>
  .page-button{
    display: flex;
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    width: 32px;
    height: 32px;
    font-weight: 600;
    font-size: 13px;
    color: #707C88;
    background-color: rgba(250, 250, 250, 0.93);
    border: 1px solid #FFF;
    border-radius: 3px;
    box-shadow: 0 0 6px -3px #000;
    cursor: pointer;
  }
  .page-button.-disabled{
    color: #FFF;
    background-color: #A2AEBA;
    border-color: transparent;
    box-shadow: none;
    cursor: default;
  }
</style>