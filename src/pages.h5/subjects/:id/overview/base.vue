<template lang="jade">
  .base
    .wrap
      detail-field(label="原名" v-if="nameOrigin") {{ nameOrigin }}
      detail-field(label="别名" v-if="nameAliases.length") {{ displayNameAliases }}
      detail-field(label="发行日期" v-if="publishDate") {{ displayPublishDate }}
      detail-field(label="风格" v-if="styles.length") {{ displayStyles }}
      detail-field(label="游戏模式" v-if="gameModes.length") {{ displayGameModes }}
      detail-field(label="游戏平台" v-if="gamePlatforms.length") {{ displayGamePlatforms }}
      detail-field(label="资源" v-if="resources.length")
        a.link.-line(v-for="(resource, index) in resources", :key="index", :href="resource.url" target="_blank") {{ host(resource) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-field': require('components.h5/detail-field')

    props:
      'subject':
        type: Object
        required: true

    computed:
      nameOrigin:    -> @subject.nameOrigin
      nameAliases:   -> @subject.nameAliases   ? []
      publishDate:   -> @subject.publishDate
      styles:        -> @subject.styles        ? []
      gameModes:     -> @subject.gameModes     ? []
      gamePlatforms: -> @subject.gamePlatforms ? []
      resources:     -> @subject.resources     ? []

      displayNameAliases:   -> @nameAliases.join('、')
      displayPublishDate:   -> @model.date.displayGroup(@publishDate)
      displayStyles:        -> @styles.map((style) => @model.subject.displayStyle(style)).join('、')
      displayGameModes:     -> @gameModes.map((mode) => @model.subject.displayGameMode(mode)).join('、')
      displayGamePlatforms: -> @gamePlatforms.map((platform) => @model.subject.displayGamePlatform(platform)).join('、')

    methods:
      host: (resource) ->
        dict = @model.assets.parseUrl(resource.url)
        return dict.host
</script>


<style lang="less" scoped>
  .base{
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0 20px;
    a{
      display: block;
      font-size: 13px;
      color: #3db8c1;
      margin-bottom: 3px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>
