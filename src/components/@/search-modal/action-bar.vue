<template lang="jade">
  .action-bar.row
    .left.row.-left
      input(v-focus="true" placeholder="Search" spellcheck="false" @input="changeQ")
      .types.row(v-if="!allowType")
        .type(:class="{'-active': type === 'user'}"         @click="changeType('user')")         Totoros成员
        .type(:class="{'-active': type === 'subject'}"      @click="changeType('subject')")      作品
        .type(:class="{'-active': type === 'role'}"         @click="changeType('role')")         角色
        .type(:class="{'-active': type === 'person'}"       @click="changeType('person')")       人物
        .type(:class="{'-active': type === 'organization'}" @click="changeType('organization')") 团体
    .right
      .icon.fa-close(@click="commit('search-modal/HIDE')")
</template>


<script lang="coffee">
  module.exports =
    computed:
      allowType: -> @state['search-modal'].allowType
      type:      -> @state['search-modal'].type

    methods:
      changeQ: (event) ->
        @commit('search-modal/SET_Q', event.target.value)
        @dispatch('search-modal/search')

      changeType: (type) ->
        @commit('search-modal/SET_TYPE', type)
        @dispatch('search-modal/search')
</script>


<style lang="less" scoped>
  .action-bar{
    flex: none;
    box-sizing: border-box;
    width: 100%;
    padding: 30px;
    .left{
      flex: auto;
    }
    .right{
      margin-left: 55px;
    }
    input{
      box-sizing: border-box;
      font-family: "Helvetica Neue", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
      font-weight: 200;
      font-size: 50px;
      color: #FFF;
      background-color: transparent;
      outline: none;
      &::placeholder{
        color: #CCC;
      }
    }
    .types{
      margin-left: 30px;
      .type{
        margin-left: 16px;
        font-weight: 200;
        font-size: 30px;
        color: #666;
        cursor: pointer;
      }
      .type.-active{
        color: #FFF;
      }
    }
    .icon.fa-close{
      font-size: 48px;
      font-weight: 100;
      color: #FFF;
      cursor: pointer;
    }
  }
</style>