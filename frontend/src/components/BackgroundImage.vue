<script setup>
import BGurl from '/BG.jpg'
</script>

<template>
    <div class="background-image">
      <img :src="BGurl" alt="">
    </div>
</template>

<style lang="scss" scoped>
*{
  background-image: url('/BG.jpg');
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  object-fit: cover;
  z-index: -1;
}
.background-image img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  object-fit: cover;
  z-index: -1;
}
</style>
