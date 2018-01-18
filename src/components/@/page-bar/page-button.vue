<template lang="jade">
  a.page-button(:href="'#'+page", :class="rootClass") {{ page }}
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
    color: #FFF;
    background-image: linear-gradient(-180deg, #66C277 0%, #16a085 90%);
    border-radius: 3px;
    cursor: pointer;
    user-select: none;
    &:active{
      background-image: linear-gradient(-180deg, #1E8470 0%, #16a085 90%);
    }
  }
  .page-button.-disabled{
    font-weight: 600;
    color: #707C88;
    background-image: none;
    background-color: #fafbfc;
    border: 1px solid #F2F2F2;
    cursor: default;
  }
</style>