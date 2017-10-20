<template lang="jade">
  .table
    slot
</template>


<script lang="coffee">
  module.exports =
    props:
      'heads':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .table{
    width: 100%;
    >*{
      box-sizing: border-box;
      width: 100%;
      padding: 12px;
      display: flex;
      align-items: center;
      font-weight: 600;
      &:nth-child(odd){
        background-color: rgb(250, 250, 250, 1);
      }
      >*{
        display: flex;
        justify-content: center;
        align-items: center;
        color: #707C88;
      }
      >*:last-child{
        flex: auto;
        justify-content: flex-end;
      }
    }
  }
</style>
