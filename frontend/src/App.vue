<script setup>
import { RouterLink, RouterView, useRouter } from 'vue-router'
import NavBar from './components/NavBar.vue';
import BackgroundImage from './components/BackgroundImage.vue';

</script>

<template>
  <div>
      <BackgroundImage/>
    <header>
        <NavBar />
      </header>
      <RouterView />

  </div>
</template>

<style scoped>

</style>