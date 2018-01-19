<template lang="jade">
  #organizations-id-overview
    row.row1
      .left
        face(:organization="organization")
      .right
        name-desc(:organization="organization")
    c-base(:organization="organization")
    intro(:organization="organization")
    staffs(:organization="organization")
</template>


<script lang="coffee">
  module.exports =
    components:
      'face':      require('./face')
      'name-desc': require('./name-desc')
      'c-base':    require('./base')
      'intro':     require('./intro')
      'staffs':    require('./staffs')

    props:
      'organization':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #organizations-id-overview{
    padding: 20px 0 0;
    background-color: #FFF;
    >*{
      box-sizing: border-box;
      margin-bottom: 32px;
      &:last-child{
        margin-bottom: 0;
      }
    }
    >.row1{
      width: 100%;
      padding: 0 20px;
    }
  }
</style>
