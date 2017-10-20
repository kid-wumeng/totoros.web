<template lang="jade">
  .forum-list
    c-table
      .forum(v-for="forum in forums", :key="forum.id")
        .name {{ forum.name }}
        .open(:class="{'-open': forum.open}") {{ forum.open ? '开放ing' : '未开放' }}
        .actions
          c-button(@click="update(forum)") 修改
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-table':  require('components/@/table')
      'c-button': require('components/@/button')

    computed:
      forums: -> @state['admin-forums'].forums

    methods:
      update: (forum) ->
        @dispatch('update-forum-modal/show', forum.id)
</script>


<style lang="less">
  .forum-list{
    .forum{
      .name{
        width: 40%;
      }
      .open{
        width: 20%;
        &.-open{
          color: #40C9A2;
        }
      }
    }
  }
</style>