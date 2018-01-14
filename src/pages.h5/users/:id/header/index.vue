<template lang="jade">
  .header
    user-banner(:user="user")
    row.wrap
      .face-wrap: user-face(:user="user")
      c-base(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-banner': require('components/image/user-banner')
      'user-face':   require('components/image/user-face')
      'c-base':      require('./base')

    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .header{
    position: relative;
    .user-banner{
      height: 100px;
    }
    .wrap{
      box-sizing: border-box;
      padding: 0 24px;
      .face-wrap{
        flex: none;
        box-sizing: border-box;
        width: 100px;
        background-color: #FFF;
        border: 2px solid #FFF;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
        border-radius: 3px;
        overflow: hidden;
        position: relative;
        top: -50px;
        .user-face{
          box-sizing: border-box;
        }
      }
      .base{
        margin-top: 8px;
        margin-left: 12px;
      }
    }
  }
</style>