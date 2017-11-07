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
      color: #A0D5C5;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .sep{
      font-size: 13px;
      color: #BBB;
      margin: 0 6px;
    }
    .title{
      font-weight: 600;
      font-size: 15px;
      color: #333;
    }
  }
</style>
