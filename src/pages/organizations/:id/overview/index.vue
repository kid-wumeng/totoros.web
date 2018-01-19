<template lang="jade">
  #organizations-id-overview
    .row.-left.-top
      .left
        face(:organization="organization")
        c-base(:organization="organization")
      .right
        intro(:organization="organization")
        staffs(:organization="organization")
</template>


<script lang="coffee">
  module.exports =
    components:
      'face':   require('./face')
      'c-base': require('./base')
      'intro':  require('./intro')
      'staffs': require('./staffs')

    props:
      'organization':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #organizations-id-overview{
    >.row{
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
