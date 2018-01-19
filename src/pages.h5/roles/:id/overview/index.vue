<template lang="jade">
  #roles-id-overview
    row.row1
      .left
        face(:role="role")
      .right
        name-desc(:role="role")
    c-base(:role="role")
    intro(:role="role")
    casts(:role="role")
</template>


<script lang="coffee">
  module.exports =
    components:
      'face':      require('./face')
      'name-desc': require('./name-desc')
      'c-base':    require('./base')
      'intro':     require('./intro')
      'casts':     require('./casts')

    props:
      'role':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #roles-id-overview{
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
