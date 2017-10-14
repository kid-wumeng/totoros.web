<template lang="jade">
  #roles-id-overview
    .row.-left.-top
      .left
        face(:role="role")
        c-base(:role="role")
      .right
        intro(:role="role")
</template>


<script lang="coffee">
  module.exports =
    components:
      'face':   require('./face')
      'c-base': require('./base')
      'intro':  require('./intro')

    props:
      'role':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #roles-id-overview{
    >.row{
      >.left{
        width: 200px;
        >*{
          margin-bottom: 20px;
          &:last-child{
            margin-bottom: 0;
          }
        }
      }
      >.right{
        width: 500px;
        flex: auto;
        margin-left: 20px;
        display: flex;
        flex-direction: column;
        >*{
          margin-bottom: 20px;
          &:last-child{
            margin-bottom: 0;
          }
        }
      }
    }
  }
</style>
