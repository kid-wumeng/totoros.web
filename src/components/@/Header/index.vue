<template lang="jade">
  .header
    .row
      .logo.image(:style="logoStyle")
      h1(v-if="state.user") {{ state.user.name }}
</template>


<script lang="coffee">
  module.exports =
    computed:
      logoStyle: ->
        'background-image': @url('assets/logo?2017-09-30')
</script>


<style lang="less" scoped>
  .header{
    width: 100%;
    text-align: center;
    .row{
      margin: 0 auto;
      width: 960px;
      height: 72px;
      .logo{
        @width: 90px;
        width: @width;
        height: @width / 4.5;
      }
    }
  }
</style>
