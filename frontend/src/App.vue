<script setup>
import { RouterLink, RouterView } from 'vue-router'
import NavBar from './components/NavBar.vue';
</script>

<template>
  <div>
    <div class="background-image">
      <img src="teava+.jpg" alt="" srcset="">
    </div>
    <header>
      <div class="wrapper">
        <NavBar />
      </div>
      <RouterView />
    </header>

  </div>
</template>

<style scoped>
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
```