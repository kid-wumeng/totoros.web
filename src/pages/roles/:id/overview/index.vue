<template lang="jade">
  #roles-id-overview
    row
      .left
        face(:role="role")
        c-base(:role="role")
      .right
        intro(:role="role")
        casts(:role="role")
</template>


<script lang="coffee">
  module.exports =
    components:
      'face':   require('./face')
      'c-base': require('./base')
      'intro':  require('./intro')
      'casts':  require('./casts')

    props:
      'role':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #roles-id-overview{
    margin-top: 16px;
    >.row2{
      >.left{
        width: 220px;
        >*{
          margin-bottom: 50px;
          &:last-child{
            margin-bottom: 0;
          }
        }
      }
      >.right{
        width: 500px;
        flex: auto;
        margin-left: 24px;
        display: flex;
        flex-direction: column;
        >*{
          margin-bottom: 50px;
          &:last-child{
            margin-bottom: 0;
          }
        }
      }
    }
  }
</style>
