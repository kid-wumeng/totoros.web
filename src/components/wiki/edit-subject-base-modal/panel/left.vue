<template lang="jade">
  .left
    form-item(label="类别")
      type-radio-bar(
        :type="type",
        @change="changeType",
      )

    form-item(label="作品名" hint="优先使用中文")
      edit-input(
        :value="name",
        @change="changeName",
      )

    form-item(v-if="isAnime" label="季度" hint="若仅有一季则不用填")
      edit-input(
        type="number",
        :value="season",
        @change="changeSeason",
      )

    form-item(label="原名")
      edit-input(
        :value="nameOrigin",
        @change="changeNameOrigin",
      )

    form-item(label="别名")
      edit-input-tag(
        prompt-message="别名",
        :tags="nameAliases",
        @change="changeNameAliases",
      )

    form-item(label="简介")
      edit-input-area(
        :value="intro",
        @change="changeIntro",
      )

    form-item(label="发行日期")
      edit-input-date(
        :dateGroup="publishDate",
        @change="changePublishDate",
      )

    form-item(label="风格")
      radio-grid(
        :values="styles",
        :cols="4",
        @change="changeStyles")
        radio(
          v-for="style in model.subject.STYLES",
          :label="model.subject.displayStyle(style)",
          :value="style",
          :key="style",
        )

    form-item(v-if="isGame" label="游戏模式")
      radio-grid(
        :values="gameModes",
        :cols="4",
        @change="changeGameModes")
        radio(
          v-for="mode in model.subject.GAME_MODES",
          :label="model.subject.displayGameMode(mode)",
          :value="mode",
          :key="mode",
        )

    form-item(v-if="isGame" label="游戏平台")
      radio-grid(
        :values="gamePlatforms",
        :cols="4",
        @change="changeGamePlatforms")
        radio(
          v-for="platform in model.subject.GAME_PLATFORMS",
          :label="model.subject.displayGamePlatform(platform)",
          :value="platform",
          :key="platform",
        )
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':        require('components/@/button')
      'form-item':       require('components/@/form-item')
      'radio-grid':      require('components/@/radio-grid')
      'radio':           require('components/@/radio')
      'edit-input':      require('components/wiki/edit-input')
      'edit-input-area': require('components/wiki/edit-input-area')
      'edit-input-tag':  require('components/wiki/edit-input-tag')
      'edit-input-date': require('components/wiki/edit-input-date')
      'type-radio-bar':  require('components/wiki/type-radio-bar')

    computed:
      subject:       -> @state['edit-subject-base-modal'].subject
      type:          -> @subject.type
      name:          -> @subject.name
      season:        -> @subject.season
      nameOrigin:    -> @subject.nameOrigin
      nameAliases:   -> @subject.nameAliases
      intro:         -> @subject.intro
      publishDate:   -> @subject.publishDate
      styles:        -> @subject.styles
      gameModes:     -> @subject.gameModes
      gamePlatforms: -> @subject.gamePlatforms

      isAnime: -> @model.subject.isType(@type, 'anime')
      isGame:  -> @model.subject.isType(@type, 'game')

    methods:
      changeType: (type) ->
        if type
          @submit({type})

      changeName: (name) ->
        @submit({name})

      changeSeason: (season) ->
        @submit({season: parseInt(season)})

      changeNameOrigin: (nameOrigin) ->
        @submit({nameOrigin})

      changeNameAliases: (nameAliases) ->
        @submit({nameAliases})

      changeIntro: (intro) ->
        @submit({intro})

      changePublishDate: (publishDate) ->
        @submit({publishDate})

      changeStyles: (styles) ->
        @submit({styles})

      changeGameModes: (gameModes) ->
        @submit({gameModes})

      changeGamePlatforms: (gamePlatforms) ->
        @submit({gamePlatforms})

      submit: (data) ->
        result = await @api.call('subject.update', @subject.id, data)
        @commit('UPDATE_SUBJECT', result.subject)
        @commit('edit-subject-base-modal/ADD_RECORDS', result.records)
        @notify('done', '修改成功 ~', 800)
</script>


<style lang="less" scoped>
  .left{
    box-sizing: border-box;
    width: 600px;
    height: 100%;
    padding: 0 80px 0 30px;
    overflow: scroll;
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>
