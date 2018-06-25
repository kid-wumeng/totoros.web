<template lang="jade">
   #examples_Radar
      Radar(:items="items")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Radar': require('~/components/Radar').default

      data: ->
         items: [
            { text: '语文', data: 10  }
            { text: '英语', data: 20  }
            { text: '历史', data: 30  }
            { text: '地理', data: 40  }
            { text: '数学', data: 50  }
            { text: '物理', data: 60  }
            { text: '化学', data: 70  }
            { text: '生物', data: 80  }
            { text: '体育', data: 90  }
            { text: '恋爱', data: 100 }
         ]
</script>



<style lang="less">
   #examples_Radar {
      justify-content: center;
      align-items: center;

      .Radar {
         width: 300px;
      }
   }
</style>