<template lang="jade">
   Row.Score(y="center")
      Rate(:score="score")
      .item(v-if="world") {{ io.formatScore('world') }} +1
      .item(v-if="story") {{ io.formatScore('story') }} +1
      .item(v-if="roles") {{ io.formatScore('roles') }} +1
      .item(v-if="paint") {{ io.formatScore('paint') }} +1
      .item(v-if="music") {{ io.formatScore('music') }} +1
</template>



<script lang="coffee">
   module.exports =
      components:
         'Row':  require('~/components/Row').default
         'Rate': require('~/components/Rate').default

      props:
         'mark':
            type: Object
            required: true

      computed:
         score: -> @mark.score
         world: -> @mark.world
         story: -> @mark.story
         roles: -> @mark.roles
         paint: -> @mark.paint
         music: -> @mark.music
</script>



<style lang="less">
   .Score {
      .Rate {
         margin-right: 14px;
      }
      .item {
         font-size: 13px;
         color: #F3C02D;
         margin-right: 10px;
         &:last-child { margin-right: 0; }
      }
   }
</style>