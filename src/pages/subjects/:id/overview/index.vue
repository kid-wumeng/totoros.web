<template lang="jade">
  #subjects-id-overview
    row
      .left
        face(:subject="subject")
        resources(:subject="subject")
        c-base(:subject="subject")
        staffs(:subject="subject")
      .right
        //- score-card(:subject="subject")
        c-mark(:subject="subject" v-if="checkined && login")
        intro(:subject="subject")
        casts(:subject="subject")
        posts(:subject="subject")
        marks(:subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'face':       require('./face')
      'c-base':     require('./base')
      'staffs':     require('./staffs')
      'score-card': require('./score-card')
      'c-mark':     require('./mark')
      'intro':      require('./intro')
      'resources':  require('./resources')
      'casts':      require('./casts')
      'marks':      require('./marks')
      'posts':      require('./posts')

    props:
      'subject':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #subjects-id-overview{
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
        >.mark{
          margin-bottom: 28px;
        }
      }
    }
  }
</style>
