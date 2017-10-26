<template lang="jade">
  .episode-list
    .episode.row(v-for="(episode, index) in episodes", :key="index")
      .row.-left
        .order \#{{ episode.order }}
        .col.-left
          .name(v-if="episode.name") {{ episode.name }}
          .nameOrigin(v-if="episode.nameOrigin") {{ episode.nameOrigin }}
      .row.-right
        c-button.del.-gray(@click="del(episode)") 删除
        c-button.edit(@click="$emit('edit', episode)") 编辑
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    props:
      'subject':
        type: Object
        required: true
      'episodes':
        type: Array
        default: -> []

    methods:
      del: (episode) ->
        result = await @api.call('subject.deleteEpisode', @subject.id, episode.order)
        @notify('done', '删除成功')
        @commit('UPDATE_SUBJECT', result.subject)
        @commit('edit-subject-episodes-modal/ADD_RECORD', result.record)
</script>


<style lang="less" scoped>
  .episode-list{
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
    .order{
      margin-right: 10px;
      font-size: 13px;
    }
    .name{
      font-size: 13px;
      font-weight: 600;
    }
    .nameOrigin{
      font-size: 13px;
      color: #A2AEBA;
    }
    .button.del{
      margin-right: 10px;
    }
  }
</style>