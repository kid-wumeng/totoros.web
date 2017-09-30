<template lang="jade">
  #timeline 时间线
</template>


<script lang="coffee">
  module.exports =
    data: ->
      email: ''
      pass:  ''
      pass2: ''
      name:  ''
</script>


<style lang="less" scoped>
  #register{
    display: flex;
    justify-content: center;
    align-items: center;

    .wrap{
      margin-top: -10%;
      width: 260px;

      .input{
        margin-bottom: 12px;
      }
    }
  }
</style>
