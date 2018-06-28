<template lang="jade">
   Modal.MarkDialog(:open="true" @close="close")
      .wrap
         h1 标记〖 {{ subject.name }} 〗
         TabBar(v-model="step", :tabs="stepRadios" type="ghost")
         Column(x="fill")
            Rate(v-model="score" size="large" changeable)
            Input(v-model="content" area hint="评论 / 可选")
            Row(x="between" y="center")
               .remove 删除
               Button(text="OK" type="ghost")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Modal':    require('~/components/Modal').default
         'Row':      require('~/components/Row').default
         'Column':   require('~/components/Column').default
         'TabBar':   require('~/components/TabBar').default
         'RadioBar': require('~/components/RadioBar').default
         'Rate':     require('~/components/Rate').default
         'Input':    require('~/components/Input').default
         'Button':   require('~/components/Button').default

      props:
         'open':
            type: Boolean
            default: false
         'mark':
            type: Object
            default: null
         'subject':
            type: Object
            required: true

      data: ->
         'step':    @mark?.step    ? 1
         'score':   @mark?.score   ? 0
         'world':   @mark?.world   ? false
         'story':   @mark?.story   ? false
         'roles':   @mark?.roles   ? false
         'paint':   @mark?.paint   ? false
         'music':   @mark?.music   ? false
         'content': @mark?.content ? ''

         'stepRadios': [
            { text: io.formatMarkStep(1), data: 1 }
            { text: io.formatMarkStep(2), data: 2 }
            { text: io.formatMarkStep(3), data: 3 }
         ]

      computed:
         id: -> mark?.id

      methods:
         sure: ->
            @$emit('sure')

         close: ->
            @$emit('close')
</script>



<style lang="less">
   .MarkDialog {
      background-color: rgba(255, 255, 255, 0.4) !important;

      .wrap {
         width: 480px;
         background-color: white;
         box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);

         h1 {
            padding: 10px;
            font-weight: 600;
            font-size: 13px;
            color: white;
            background-image: linear-gradient(-60deg, #53BD66 0%, #16a085 80%);
         }

         .Column {
            padding: 30px 20px;

            .Rate {
               margin: 0 auto;
            }

            .Input {
               margin-top: 30px;
               width: 100%;
               height: 174px;
            }

            .Row {
               margin-top: 30px;

               .Button {
                  height: 30px;
               }
            }
         }
      }
   }
</style>