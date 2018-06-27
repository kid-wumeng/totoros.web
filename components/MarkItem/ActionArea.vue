<template lang="jade">
   .ActionArea
      .top
         Row(x="center" y="center")
            span.date {{ date }}
            span.step {{ step }}
         .actions
            span.action.update(@click="update") 修改标记
            span.sep /
            span.action.delete(@click="remove") 移除
      .bottom
         Button(text="READ" type="ghost")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Row':    require('~/components/Row').default
         'Button': require('~/components/Button').default

      props:
         'mark':
            type: Object
            required: true

      computed:
         step: -> io.formatMarkStep(@mark.step)
         date: -> io.formatDate(@mark.createDate)

      methods:
         update: -> @$emit('update')
         remove: -> @$emit('remove')
</script>



<style lang="less">
   .ActionArea {
      flex: none;
      align-self: stretch;
      width: 160px;
      height: 200px;
      padding: 8px;
      text-align: center;
      font-size: 13px;
      border: 1px dashed #14BEB4;
      border-radius: 2px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;

      .date {
         color: #707C88;
      }

      .step {
         margin-left: 8px;
         color: #707C88;
      }

      .actions {
         margin-top: 4px;
         color: lighten(#A2AEBA, 10%);
         user-select: none;

         .action {
            cursor: pointer;
            transition: color 0.2s ease;
            &.update:hover {
               font-weight: 500;
               color: #445669;
            }
            &.delete:hover {
               font-weight: 500;
               color: red;
            }
         }
         .sep {
            margin: 0 8px;
         }
      }

      .Button {
         height: 32px;
         font-family: "Ubuntu";
         font-weight: 500;
      }
   }
</style>