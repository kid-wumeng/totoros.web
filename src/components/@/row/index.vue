<template lang="jade">
  .row2(@click="$emit('click')")
    slot
</template>


<script lang="coffee">
</script>


<style lang="less" scoped>
  .row2{
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;

    &.-right{
      justify-content: flex-end;
    }
    &.-between{
      justify-content: space-between;
    }
    &.-center{
      align-items: center;
    }
    &.-bottom{
      align-items: flex-end;
    }
  }
</style>
