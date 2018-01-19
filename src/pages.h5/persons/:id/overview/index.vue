<template lang="jade">
  #persons-id-overview
    row.row1
      .left
        face(:person="person")
      .right
        name-desc(:person="person")
    c-base(:person="person")
    intro(:person="person")
    casts(:person="person")
    staffs(:person="person")
</template>


<script lang="coffee">
  module.exports =
    components:
      'face':      require('./face')
      'name-desc': require('./name-desc')
      'c-base':    require('./base')
      'intro':     require('./intro')
      'casts':     require('./casts')
      'staffs':    require('./staffs')

    props:
      'person':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #persons-id-overview{
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
