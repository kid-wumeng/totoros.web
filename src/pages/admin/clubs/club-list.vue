<template lang="jade">
  .club-list
    c-table
      .club(v-for="club in clubs", :key="club.id")
        .order {{ club.order ? 'Order ' + club.order : '' }}
        .name  {{ club.name }}
        .open(:class="{'-open': club.open}") {{ club.open ? '开放ing' : '未开放' }}
        .actions
          c-button(@click="update(club)") 修改
          c-button(@click="uploadFace(club)") 上传FACE
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-table':  require('components/@/table')
      'c-button': require('components/@/button')

    computed:
      clubs: -> @state['admin-clubs'].clubs

    methods:
      update: (club) ->
        @dispatch('update-club-modal/show', club.id)

      uploadFace: (club) ->
        @dispatch('club-face-modal/show', club.id)
</script>


<style lang="less">
  .club-list{
    .club{
      .order{
        width: 15%;
      }
      .name{
        width: 40%;
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