<template lang="jade">
  .forum-list
    c-table
      .forum(v-for="forum in forums", :key="forum.id")
        .order {{ forum.order ? 'Order ' + forum.order : '' }}
        .name  {{ forum.name }}
        .open(:class="{'-open': forum.open}") {{ forum.open ? '开放ing' : '未开放' }}
        .actions
          c-button.-gray(@click="update(forum)") 基本设定
          c-button.-gray(@click="updateManagers(forum)") 版主
          c-button.-gray(@click="uploadFace(forum)") FACE
          c-button.-gray(@click="uploadBanner(forum)") BANNER
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

      updateManagers: (forum) ->
        @dispatch('forum-managers-modal/show', forum.id)

      uploadFace: (forum) ->
        @dispatch('forum-face-modal/show', forum.id)

      uploadBanner: (forum) ->
        @dispatch('forum-banner-modal/show', forum.id)
</script>


<style lang="less">
  .forum-list{
    .forum{
      .order{
        width: 15%;
      }
      .name{
        width: 20%;
      }
      .open{
        width: 15%;
        &.-open{
          color: #40C9A2;
        }
      }
      .actions{
        >*{
          margin-right: 6px;
          &:last-child{
            margin-right: 0;
          }
        }
      }
    }
  }
</style>