<template lang="jade">
  #subjects-id-episodes
    .episode(v-for="(episode, index) in episodes", :key="index")
      span.order \#{{ episode.order }}
      span.name(v-if="episode.name") {{ episode.name }}
      span.nameOrigin(v-if="episode.nameOrigin") {{ episode.nameOrigin }}
      text-area.intro(v-if="episode.intro", :text="episode.intro", indent, :limit="100" more)
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area': require('components/@/text-area')

    props:
      'subject':
        type: Object
        required: true

    computed:
      episodes: -> @state['subject-detail'].episodes

    methods:
      init: ->
        @dispatch('subject-detail/get-episodes', @subject.id)
</script>


<style lang="less" scoped>
  #subjects-id-episodes{
    padding-top: 16px;
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
    .order{
      font-size: 14px;
      font-weight: 600;
    }
    .name{
      margin-left: 10px;
      font-size: 14px;
      font-weight: 600;
    }
    .nameOrigin{
      margin-left: 10px;
      font-size: 14px;
      color: #A2AEBA;
    }
    .intro{
      margin-top: 4px;
      color: #707C88;
    }
  }
</style>
