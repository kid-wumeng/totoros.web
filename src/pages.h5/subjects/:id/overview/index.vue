<template lang="jade">
  #subjects-id-overview
    row.row1
      .left
        face(:subject="subject")
      .right
        name-desc(:subject="subject")
    c-base(:subject="subject")
    intro(:subject="subject")
    casts(:subject="subject")
    //- staffs(:subject="subject")
    marks(:subject="subject")
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
      'marks':     require('./marks')

    props:
      'subject':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #subjects-id-overview{
    margin-top: 16px;
    >*{
      margin-bottom: 32px;
      box-sizing: border-box;
    }
    >.row1{
      width: 100%;
      padding: 0 20px;
    }
  }
</style>
