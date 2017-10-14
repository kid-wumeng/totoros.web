<template lang="jade">
  detail-area.base(title="基本档案")
    detail-field(label="原名" v-if="nameOrigin") {{ nameOrigin }}
    detail-field(label="别名" v-if="nameAliases.length") {{ displayNameAliases }}
    detail-field(label="出生日期" v-if="birthDate") {{ displayBirthDate }}
    detail-field(label="逝世日期" v-if="deathDate") {{ displayDeathDate }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area':  require('components/wiki/detail-area')
      'detail-field': require('components/wiki/detail-field')

    props:
      'person':
        type: Object
        required: true

    computed:
      nameOrigin:  -> @person.nameOrigin
      nameAliases: -> @person.nameAliases ? []
      birthDate:   -> @person.birthDate
      deathDate:   -> @person.deathDate

      displayBirthDate: -> @model.date.displayGroup(@birthDate)
      displayDeathDate: -> @model.date.displayGroup(@deathDate)
</script>


<style lang="less" scoped>
  .base{
  }
</style>
