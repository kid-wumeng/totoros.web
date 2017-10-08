<template lang="jade">
  .favor-group.row.-left
    .item(v-if="showStory", :class="{'-clickable': clickable, '-active': story}" @click="click('story')")
      .label(:style="{fontSize: size}") 故事
      .icon.fa-heart-o(:style="{fontSize: size}")

    .item(v-if="showImage", :class="{'-clickable': clickable, '-active': image}" @click="click('image')")
      .label(:style="{fontSize: size}") 画面
      .icon.fa-heart-o(:style="{fontSize: size}")

    .item(v-if="showMusic", :class="{'-clickable': clickable, '-active': music}" @click="click('music')")
      .label(:style="{fontSize: size}") 音乐
      .icon.fa-heart-o(:style="{fontSize: size}")

    .item(v-if="showEnjoy", :class="{'-clickable': clickable, '-active': enjoy}" @click="click('enjoy')")
      .label(:style="{fontSize: size}") 游戏性
      .icon.fa-heart-o(:style="{fontSize: size}")
</template>


<script lang="coffee">
  module.exports =
    model:
      prop: 'favor'
      event: 'change'

    props:
      'favor':
        type: Object
        default: -> {}
      'clickable':
        type: Boolean
        default: false
      'subject':
        type: Object
        required: true
      'size':
        type: String
        default: '13px'

    computed:
      showStory: -> @model.mark.validFavor(@subject.type, 'story') and (if @clickable then true else @story)
      showImage: -> @model.mark.validFavor(@subject.type, 'image') and (if @clickable then true else @image)
      showMusic: -> @model.mark.validFavor(@subject.type, 'music') and (if @clickable then true else @music)
      showEnjoy: -> @model.mark.validFavor(@subject.type, 'enjoy') and (if @clickable then true else @enjoy)

      story: -> @favor?.story ? false
      image: -> @favor?.image ? false
      music: -> @favor?.music ? false
      enjoy: -> @favor?.enjoy ? false

    methods:
      click: (item) ->
        favor =
          story: @story
          image: @image
          music: @music
          enjoy: @enjoy
        favor[item] = !favor[item]
        @$emit('change', favor)
</script>


<style lang="less" scoped>
  .favor-group{
    >.item{
      margin-right: 4px;
      display: flex;
      justify-content: center;
      align-items: center;
      &:last-child{
        margin-right: 0;
      }
      >.label,
      >.icon{
        transition: color 0.15s ease;
        font-weight: bold;
        color: #A8B3BE;
      }
      >.icon{
        margin-left: 1px;
        transform: scale3d(0.9, 0.9, 1);
      }
    }
    >.item.-active{
      >.label,
      >.icon{
        color: #F7A9A8;
      }
    }
    >.item.-clickable{
      flex: auto;
      cursor: pointer;
    }
  }
</style>