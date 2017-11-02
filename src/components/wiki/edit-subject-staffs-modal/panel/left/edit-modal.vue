<template lang="jade">
  modal.edit-modal(@close="$emit('close')")
    .panel
      form-item(v-if="!staff" label="* 类别")
        radio-bar(v-model="type")
          radio(label="人物", value="person")
          radio(label="团体", value="organization")

      form-item(v-if="!staff" v-show="type === 'person'" label="* 人物")
        edit-input(:value="personName" button="select" @select="selPerson")

      form-item(v-if="!staff" v-show="type === 'organization'" label="* 团体")
        edit-input(:value="organizationName" button="select" @select="selOrganization")

      form-item(v-show="type === 'person'" label="* JOBs")
        radio-grid(v-model="jobs")
          radio(
            v-for="job in model.assets.STAFF_PERSON_JOBS",
            :label="model.assets.displayStaffJob(job)",
            :value="job",
            :key="job",
          )

      form-item(v-show="type === 'organization'" label="JOBs")
        radio-grid(v-model="jobs")
          radio(
            v-for="job in model.assets.STAFF_ORGANIZATION_JOBS",
            :label="model.assets.displayStaffJob(job)",
            :value="job",
            :key="job",
          )

      .row.-right
        c-button(@click="submit") 确认提交
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal':      require('components/@/modal')
      'c-button':   require('components/@/button')
      'form-item':  require('components/@/form-item')
      'radio-bar':  require('components/@/radio-bar')
      'radio-grid': require('components/@/radio-grid')
      'radio':      require('components/@/radio')
      'edit-input': require('components/wiki/edit-input')

    props:
      'subject':
        type: Object
        required: true
      'staff':
        type: Object
        default: null

    data: ->
      type:         @staff?.type         ? 'person'
      person:       @staff?.person       ? null
      organization: @staff?.organization ? null
      jobs:         @staff?.jobs         ? []

    computed:
      personName:       -> @person?.name       ? ''
      organizationName: -> @organization?.name ? ''

    methods:
      selPerson: ->
        @person = await @dispatch('search-modal/show', {allowType: 'person'})

      selOrganization: ->
        @organization = await @dispatch('search-modal/show', {allowType: 'organization'})

      submit: ->
        if @staff
          @update()
        else
          @create()

      create: ->
        if(!@type)
          @notify('fail', '请选择类别')
        else if(@type is 'person' and !@person)
          @notify('fail', '请选择人物')
        else if(@type is 'organization' and !@organization)
          @notify('fail', '请选择团体')
        else if(@jobs.length is 0)
          @notify('fail', '请选择至少一个JOB')
        else
          result = await @api.call('staff.create', {
            sid:  @subject.id
            pid:  @person?.id
            oid:  @organization?.id
            type: @type
            jobs: @jobs
          })
          @notify('done', '添加成功')
          @commit('CREATE_STAFF', result.staff)
          @commit('edit-subject-staffs-modal/ADD_RECORD', result.record)
          @$emit('close')

      update: ->
        if(@jobs.length is 0)
          @notify('fail', '请选择至少一个JOB')
        else
          result = await @api.call('staff.update', @staff.id, {
            jobs: @jobs
          })
          @notify('done', '修改成功')
          @commit('UPDATE_STAFF', result.staff)
          @commit('edit-subject-staffs-modal/ADD_RECORD', result.record)
          @$emit('close')
</script>


<style lang="less" scoped>
  .edit-modal{
    .panel{
      width: 480px;
      >*{
        margin-bottom: 16px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
  }
</style>