<template lang="jade">
  .row2
    slot
</template>


<script lang="coffee">
</script>


<style lang="less" scoped>
  .row2{
    display: flex;
    justify-content: flex-start;
    align-items: center;

    &.-right{
      justify-content: flex-end;
    }
    &.-between{
      justify-content: space-between;
    }
    &.-top{
      align-items: flex-start;
    }
  }
</style>
