<template lang="jade">
  detail-area.base(title="基本档案")
    detail-field(label="原名" v-if="nameOrigin") {{ nameOrigin }}
    detail-field(label="别名" v-if="nameAliases.length") {{ displayNameAliases }}
    detail-field(label="成立日期" v-if="establishDate") {{ displayEstablishDate }}
    detail-field(label="解散日期" v-if="disbandDate") {{ displayDisbandDate }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area':  require('components/wiki/detail-area')
      'detail-field': require('components/wiki/detail-field')

    props:
      'organization':
        type: Object
        required: true

    computed:
      nameOrigin:    -> @organization.nameOrigin
      nameAliases:   -> @organization.nameAliases ? []
      establishDate: -> @organization.establishDate
      disbandDate:   -> @organization.disbandDate

      displayEstablishDate: -> @model.date.displayGroup(@establishDate)
      displayDisbandDate:   -> @model.date.displayGroup(@disbandDate)
</script>


<style lang="less" scoped>
  .base{
  }
</style>
