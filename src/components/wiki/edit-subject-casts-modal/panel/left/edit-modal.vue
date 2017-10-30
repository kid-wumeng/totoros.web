<template lang="jade">
  modal.edit-modal(@close="$emit('close')")
    .panel
      form-item(label="* 身份")
        radio-bar(v-model="importance")
          radio(:label="model.assets.displayCastImportance(4)", :value="4")
          radio(:label="model.assets.displayCastImportance(3)", :value="3")
          radio(:label="model.assets.displayCastImportance(2)", :value="2")
          radio(:label="model.assets.displayCastImportance(1)", :value="1")

      form-item(v-if="!cast", label="* 角色")
        edit-input(:value="roleName" button="select" @select="selRole")

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
      role:       @cast?.role       ? null
      persons:    @cast?.persons    ? []
      importance: @cast?.importance ? 0

    computed:
      roleName: -> @role?.name ? ''
      sid:      -> @subject.id
      rid:      -> @role?.id
      pids:     -> @persons.map (person) -> person.id

    methods:
      selRole: ->
        @role = await @dispatch('search-modal/show', {allowType: 'role'})

      addPerson: ->
        person = await @dispatch('search-modal/show', {allowType: 'person'})
        @persons = [@persons..., person]

      delPerson: (person) ->
        @persons = @omit(@persons, person)

      submit: ->
        if @cast
          @update()
        else
          @create()

      create: ->
        if(!@importance)
          @notify('fail', '请选择身份')
        else if(!@role)
          @notify('fail', '请选择角色')
        else
          result = await @api.call('cast.create', {
            sid:        @sid
            rid:        @rid
            pids:       @pids
            importance: @importance
          })
          @notify('done', '添加成功')
          @commit('CREATE_CAST', result.cast)
          @commit('edit-subject-casts-modal/ADD_RECORD', result.record)
          @$emit('close')

      update: ->
        result = await @api.call('cast.update', @cast.id, {
          pids:       @pids
          importance: @importance
        })
        @notify('done', '修改成功')
        @commit('UPDATE_CAST', result.cast)
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