<template lang="jade">
  .editer
    action-bar(
      @add-picture="addPicture"
      @add-subject="addSubject"
      @add-role="addRole"
      @add-person="addPerson"
      @add-organization="addOrganization"
    )
    input-area(
      ref="input-area",
      :value="value",
      :placeholder="placeholder",
      :rows="rows",
      :autofocus="autofocus",
      @input="input"
    )
</template>


<script lang="coffee">
  module.exports =
    components:
      'input-area': require('components/@/input-area')
      'action-bar': require('./action-bar')

    props:
      'value':
        type: String
        default: ''
      'placeholder':
        type: String
        default: ''
      'rows':
        type: Number
        default: 20
      'autofocus':
        type: Boolean
        default: false

    methods:
      input: (value) ->
        @$emit('input', value)

      mount: (string) ->
        pos    = @$refs['input-area'].getCursorPosition()
        before = @value.slice(0, pos)
        after  = @value.slice(pos)
        value  = before + string + after
        @$emit('input', value)

      addPicture: (picture) ->
        string = "![](#{picture.hash})\n"
        @mount(string)

      addSubject: (subject) ->
        id      = subject.id
        name    = subject.name
        type    = subject.type
        season  = subject.season        ? ''
        version = subject.face?.version ? ''
        string  = "[#{name}](subject?id=#{id}&type=#{type}"
        if(season)
          string += "&season=#{season}"
        if(version)
          string += "&face.version=#{version}"
        string += ')\n'
        @mount(string)

      addRole: (role) ->
        id      = role.id
        name    = role.name
        version = role.face?.version ? ''
        string  = "[#{name}](role?id=#{id}"
        if(version)
          string += "&face.version=#{version}"
        string += ')\n'
        @mount(string)

      addPerson: (person) ->
        id      = person.id
        name    = person.name
        version = person.face?.version   ? ''
        year    = person.birthDate?.year ? ''
        string  = "[#{name}](person?id=#{id}"
        if(year)
          string += "&birthDate.year=#{year}"
        if(version)
          string += "&face.version=#{version}"
        string += ')\n'
        @mount(string)

      addOrganization: (organization) ->
        id      = organization.id
        name    = organization.name
        version = organization.face?.version       ? ''
        year    = organization.establishDate?.year ? ''
        string  = "[#{name}](organization?id=#{id}"
        if(year)
          string += "&establishDate.year=#{year}"
        if(version)
          string += "&face.version=#{version}"
        string += ')\n'
        @mount(string)
</script>


<style lang="less" scoped>
  .editer{
    .input-area{
      margin-top: 12px;
    }
  }
</style>