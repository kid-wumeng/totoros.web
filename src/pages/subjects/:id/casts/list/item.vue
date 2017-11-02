<template lang="jade">
  row.item.-top
    .left
      role-face(:role="role" square)
    .right
      row.-between
        row
          role-name(:role="role")
          span.nameOrigin {{ role.nameOrigin }}
        sep-row
          row(v-for="(person, index) in persons", :key="index")
            person-face(:person="person" square border)
            person-name(:person="person")
      .importance - {{ model.assets.displayCastImportance(cast.importance) }} -
      text-area.intro(:text="role.intro", :limit="120")
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area':   require('components/@/text-area')
      'sep-row':     require('components/@/sep-row')
      'role-face':   require('components/image/role-face')
      'role-name':   require('components/wiki/role-name')
      'person-face': require('components/image/person-face')
      'person-name': require('components/wiki/person-name')

    props:
      'cast':
        type: Object
        required: true

    computed:
      role:       -> @cast.role
      persons:    -> @cast.persons ? []
      importance: -> @cast.importance
</script>


<style lang="less" scoped>
  .item{
    padding-bottom: 10px;
    border-bottom: 1px dotted #EAEAEA;
    margin-bottom: 10px;
    >.right{
      flex: auto;
      position: relative;
    }
    .role-face{
      width: 72px;
      margin-right: 12px;
    }
    .nameOrigin{
      margin-left: 7px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .importance{
      margin-top: 2px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .intro{
      margin-top: 4px;
      color: #445669;
    }
    .person-face{
      width: 24px;
    }
    .person-name{
      margin-left: 4px;
      font-size: 12px;
    }
  }
</style>
