<template lang="jade">
  .left
    form-item(label="类别")
      type-radio-bar(v-model="type" @change="changeType")

    form-item(label="中文名")
      edit-input(v-model="name" @change="changeName")

    form-item(label="季度" hint="若仅有1季就不用填" v-if="model.subject.isType(type, 'anime')")
      edit-input(v-model="season" @change="changeSeason" type="number")

    form-item(label="原名")
      edit-input(v-model="nameOrigin" @change="changeNameOrigin")

    form-item(label="别名")
      edit-input-tag(v-model="nameAliases" @change="changeNameAliases" prompt-message="别名")

    form-item(label="简介")
      edit-input-area(v-model="intro" @change="changeIntro")

    form-item(label="发行日期")
      edit-input-date(v-model="publishDate" @change="changePublishDate")

    form-item(label="风格")
      radio-grid(v-model="styles", @change="changeStyles")
        radio(
          v-for="style in model.subject.STYLES",
          :label="model.subject.displayStyle(style)",
          :value="style",
          :key="style"
        )

    form-item(label="游戏模式" v-if="model.subject.isType(type, 'game')")
      radio-grid(v-model="gameModes", @change="changeGameModes")
        radio(
          v-for="mode in model.subject.GAME_MODES",
          :label="model.subject.displayGameMode(mode)",
          :value="mode",
          :key="mode"
        )

    form-item(label="游戏平台" v-if="model.subject.isType(type, 'game')")
      radio-grid(v-model="gamePlatforms", @change="changeGamePlatforms")
        radio(
          v-for="platform in model.subject.GAME_PLATFORMS",
          :label="model.subject.displayGamePlatform(platform)",
          :value="platform",
          :key="platform"
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

    props:
      'subject':
        type: Object
        required: true

    data: ->
      type:          @subject.type
      name:          @subject.name
      season:        @subject.season
      nameOrigin:    @subject.nameOrigin
      nameAliases:   @subject.nameAliases
      intro:         @subject.intro
      publishDate:   @subject.publishDate
      styles:        @subject.styles
      gameModes:     @subject.gameModes
      gamePlatforms: @subject.gamePlatforms

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
        api.call('subject.update', @subject.id, data).done(@done)

      done: ->
        @notify('done', '修改成功 ~', 800)
</script>


<style lang="less" scoped>
  .left{
    box-sizing: border-box;
    width: 540px;
    height: 100%;
    padding: 0 30px;
    overflow: scroll;
    >*{
      margin-bottom: 16px;
    }
  }
</style>
