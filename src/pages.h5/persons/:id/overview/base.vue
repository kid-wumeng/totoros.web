<template lang="jade">
  .base
    .wrap
      detail-field(label="原名" v-if="nameOrigin") {{ nameOrigin }}
      detail-field(label="别名" v-if="nameAliases.length") {{ displayNameAliases }}
      detail-field(label="出生日期" v-if="birthDate") {{ displayBirthDate }}
      detail-field(label="逝世日期" v-if="deathDate") {{ displayDeathDate }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-field': require('components.h5/detail-field')

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
