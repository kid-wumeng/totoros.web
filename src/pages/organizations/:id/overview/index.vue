<template lang="jade">
  #organizations-id-overview
    .row.-left.-top
      .left
        face(:organization="organization")
        c-base(:organization="organization")
      .right
        intro(:organization="organization")
</template>


<script lang="coffee">
  module.exports =
    components:
      'face':   require('./face')
      'c-base': require('./base')
      'intro':  require('./intro')

    props:
      'organization':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #organizations-id-overview{
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
