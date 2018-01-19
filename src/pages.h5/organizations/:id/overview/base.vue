<template lang="jade">
  .base
    .wrap
      detail-field(label="原名" v-if="nameOrigin") {{ nameOrigin }}
      detail-field(label="别名" v-if="nameAliases.length") {{ displayNameAliases }}
      detail-field(label="成立日期" v-if="establishDate") {{ displayEstablishDate }}
      detail-field(label="解散日期" v-if="disbandDate") {{ displayDisbandDate }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-field': require('components.h5/detail-field')

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