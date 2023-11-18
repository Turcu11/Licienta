<script setup>
import { RouterLink, RouterView } from 'vue-router'
import NavBar from './components/NavBar.vue';
import BackgroundImage from './components/BackgroundImage.vue';
</script>

<template>
  <div>
    <BackgroundImage/>
    <header>
      <!-- <div class="wrapper"> -->
        <NavBar />
      <!-- </div> -->
      <RouterView />
    </header>

  </div>
</template>

<style scoped>

</style>