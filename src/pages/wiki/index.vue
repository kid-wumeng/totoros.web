<template lang="jade">
  #wiki
    row.item.-center(v-for="(subject, index) in subjects", :key="index")
      .id {{ subject.id }}
      .type {{ subject.overview_data.type }}
      c-input.name(v-model="subject.overview_data.name")
      c-input.nameOrigin(v-model="subject.overview_data.nameOrigin")
      c-input.season(v-model="subject.season" placeholder="季度" type="number")
      c-button(v-if="!subject.abandon" @click="subject.abandon = true") 删除
      c-button.-gray(v-else @click="subject.abandon = false") 恢复

    c-button(@click="submit") 确定提交


    //- c-button(@click="commit('create-subject-modal/SHOW')") 创建作品
    //- c-button(@click="commit('create-role-modal/SHOW')") 创建角色
    //- c-button(@click="commit('create-person-modal/SHOW')") 创建人物
    //- c-button(@click="commit('create-organization-modal/SHOW')") 创建团体
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    data: ->
      subjects: []

    methods:
      init: ->
        subjects = await @api.call('temp.getAllTempAnimes')
        for subject in subjects
          if !subject.abandon
            subject.abandon = false
        @subjects = subjects

      submit: ->
        datas = @subjects.map (subject) =>
          return{
            id:           subject.id
            'overview_data.name': subject.overview_data.name
            'overview_data.nameOrigin': subject.overview_data.nameOrigin
            season:    if subject.season then parseInt(subject.season) else null
            abandon:   subject.abandon
          }

        await @api.call('temp.updateAllTempAnimes', datas)
        @notify('done', '修改成功')
</script>


<style lang="less" scoped>
  #wiki{
    margin: 60px auto;
    width: 800px;
    .item{
      margin-bottom: 10px;
      >*{
        margin-right: 10px;
      }
      .id{
        width: 100px;
      }
      .type{
        width: 100px;
      }
      .name{
        width: 400px;
      }
      .nameOrigin{
        width: 200px;
      }
      .season{
        width: 100px;
      }
    }
  }
</style>
