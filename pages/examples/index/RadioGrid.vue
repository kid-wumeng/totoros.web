<template lang="jade">
   #examples_RadioGrid
      p 单选：{{ data1 }}
      RadioGrid(v-model="data1", :radios="radios1" type="solid")
      RadioGrid(v-model="data1", :radios="radios1" type="ghost")
      p 多选：{{ data2 }}
      RadioGrid(v-model="data2", :radios="radios2" type="solid" many, :cols="4")
      RadioGrid(v-model="data2", :radios="radios2" type="ghost" many, :cols="4")
</template>



<script lang="coffee">
   module.exports =
      components:
         'RadioGrid': require('~/components/RadioGrid').default

      data: ->
         radios1: [
            { data: 'comic', text: '漫画' }
            { data: 'paint', text: '绘本' }
            { data: 'serie', text: 'TV/OVA' }
            { data: 'movie', text: '动画电影' }
         ]

         radios2: [
            { data: '青年', text: '青年' }
            { data: '少年', text: '少年' }
            { data: '少女', text: '少女' }
            { data: '儿童', text: '儿童' }
            { data: '科幻', text: '科幻' }
            { data: '魔幻', text: '魔幻' }
            { data: '玄幻', text: '玄幻' }
            { data: '奇幻', text: '奇幻' }
            { data: '冒险', text: '冒险' }
            { data: '格斗', text: '格斗' }
            { data: '武士', text: '武士' }
            { data: '武侠', text: '武侠' }
            { data: '悬疑', text: '悬疑' }
            { data: '推理', text: '推理' }
            { data: '犯罪', text: '犯罪' }
            { data: '恐怖', text: '恐怖' }
            { data: '历史', text: '历史' }
            { data: '文化', text: '文化' }
            { data: '战争', text: '战争' }
            { data: '青春', text: '青春' }
            { data: '社会', text: '社会' }
            { data: '日常', text: '日常' }
            { data: '搞笑', text: '搞笑' }
            { data: '纯爱', text: '纯爱' }
            { data: '后宫', text: '后宫' }
            { data: '耽美', text: '耽美' }
            { data: '百合', text: '百合' }
            { data: '情色', text: '情色' }
            { data: '职场', text: '职场' }
            { data: '生存', text: '生存' }
            { data: '斗智', text: '斗智' }
            { data: '运动', text: '运动' }
            { data: '美食', text: '美食' }
            { data: '音乐', text: '音乐' }
            { data: '英雄', text: '英雄' }
         ]

         data1: 'paint'
         data2: ['魔幻', '悬疑', '战争']
</script>



<style lang="less">
   #examples_RadioGrid {
      > .RadioGrid {
         width: 480px;
      }
   }
</style>