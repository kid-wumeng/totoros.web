<template lang="jade">
  modal.edit-modal(@close="$emit('close')")
    .panel
      form-item(label="* 身份")
        radio-bar(v-model="importance")
          radio(:label="model.assets.displayCastImportance(4)", :value="4")
          radio(:label="model.assets.displayCastImportance(3)", :value="3")
          radio(:label="model.assets.displayCastImportance(2)", :value="2")
          radio(:label="model.assets.displayCastImportance(1)", :value="1")

      form-item(label="* 角色")
        edit-input(:value="role_name" button="select" @select="selRole")

      form-item(label="声优")
        edit-input-tags(v-model="persons", name="name" @add="addPerson")

      .row.-right
        c-button(@click="submit") 确认提交
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal':           require('components/@/modal')
      'c-button':        require('components/@/button')
      'form-item':       require('components/@/form-item')
      'radio-bar':       require('components/@/radio-bar')
      'radio':           require('components/@/radio')
      'edit-input':      require('components/wiki/edit-input')
      'edit-input-tags': require('components/wiki/edit-input-tags')

    props:
      'subject':
        type: Object
        required: true
      'cast':
        type: Object
        default: null

    data: ->
      importance: @cast?.importance ? 0
      role:       @cast?.role       ? null
      persons:    @cast?.persons    ? []

    computed:
      role_name: -> @role?.name ? ''

    methods:
      selRole: ->
        @role = await @dispatch('search-modal/show', {allowType: 'role'})

      addPerson: ->
        person = await @dispatch('search-modal/show', {allowType: 'person'})
        @persons = [@persons..., person]

      delPerson: (person) ->
        @persons = @omit(@persons, person)

      submit: ->
        if(!@importance)
          @notify('fail', '请选择身份')
        else if(!@role)
          @notify('fail', '请选择角色')
        else
          if @cast then @update() else @create()

      create: ->
        result = await @api.call('subject.createCast', @params()...)
        @done(result)

      update: ->
        result = await @api.call('subject.updateCast', @params()...)
        @done(result)

      params: ->
        sid        = @subject.id
        importance = @importance
        rid        = @role?.id
        pids       = @persons.map (person) -> person.id
        return [sid, importance, rid, pids]

      done: (result) ->
        @notify('done', '提交成功')
        @commit('UPDATE_SUBJECT', result.subject)
        @commit('edit-subject-casts-modal/ADD_RECORD', result.record)
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