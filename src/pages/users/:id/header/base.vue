<template lang="jade">
  .base
    .name {{ user.name }}
    row.-center
      .motto {{ user.motto }}
      .idolCount(v-if="user.idolCount" @click="replaceUserPage(user, 'idols')") 关注 {{ user.idolCount }} 人
      .fanCount(v-if="user.fanCount"   @click="replaceUserPage(user, 'fans')") 被 {{ user.fanCount }} 人关注
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .base{
    box-sizing: border-box;
    .name{
      font-weight: 600;
      font-size: 16px;
      margin-bottom: 5px;
    }
    .motto{
      font-size: 13px;
      color: #707C88;
    }
    .idolCount{
      margin-left: 10px;
      font-size: 12px;
      cursor: pointer;
    }
    .fanCount{
      margin-left: 10px;
      font-size: 12px;
      cursor: pointer;
    }
  }
</style>