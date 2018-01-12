<template lang="jade">
  .item.row.-left.-top(@click="click")
    .left
      face(:result="result")
    .right
      row.-center
        .name {{ result.name }}
        .desc(v-if="desc") {{ desc }}
      text-area.intro(:text="result.intro", :limit="120")
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area': require('components/@/text-area')
      'face':      require('./face')

    props:
      'result':
        type: Object
        required: true

    computed:
      type:     -> @state['search-modal'].type
      results:  -> @state['search-modal'].results
      redirect: -> @state['search-modal'].redirect
      resolve:  -> @state['search-modal'].resolve

      desc: ->
        desc = ''
        if(@type is 'subject')
          desc += model.subject.displayType(@result.type)
          if(@result.season)
            desc += " / Season #{@result.season}"
        return desc

    methods:
      click: ->
        if @redirect
          switch @type
            when 'user'         then @toUserPage(@result)
            when 'subject'      then @toSubjectPage(@result)
            when 'role'         then @toRolePage(@result)
            when 'person'       then @toPersonPage(@result)
            when 'organization' then @toOrganizationPage(@result)
        else
          @resolve(@result)
        @commit('search-modal/HIDE')
</script>


<style lang="less" scoped>
  .item{
    box-sizing: border-box;
    padding: 14px;
    cursor: pointer;
    transition: all 0.2s ease;
    &:hover{
      background-color: rgba(255, 255, 255, 0.1);
    }
    .right{
      width: 60%;
      margin-left: 14px;
    }
    .face{
      width: 100px;
    }
    .name{
      font-weight: 600;
      font-size: 15px;
      color: #FFF;
    }
    .desc{
      margin-left: 8px;
      font-size: 13px;
      color: #DDD;
    }
    .intro{
      margin-top: 4px;
      width: 70%;
      color: #DDD;
    }
  }
</style>