<template lang="jade">
  .breadcrumb(v-if="login")
    span.club(@click="toClubPage(club)") {{ club.name }}
    span.sep /
    span.title {{ post.title }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'post':
        type: Object
        required: true

    computed:
      club: -> @post.club
</script>


<style lang="less" scoped>
  .breadcrumb{
    .club{
      font-weight: 600;
      font-size: 14px;
      cursor: pointer;
      color: #A2AEBA;
      &:hover{
        text-decoration: underline;
      }
    }
    .sep{
      font-size: 14px;
      color: #CCC;
      margin: 0 6px;
    }
    .title{
      font-weight: 600;
      font-size: 16px;
      color: #333;
    }
  }
</style>
