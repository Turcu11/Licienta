<script setup>
import { RouterLink, RouterView, useRouter } from 'vue-router'
import NavBar from './components/NavBar.vue';
import BackgroundImage from './components/BackgroundImage.vue';
import { useUserLoginData } from './stores/userLoginData';
import { onMounted, watchEffect } from 'vue';

const userData = useUserLoginData();
const router = useRouter();

onMounted(() => {
  if(localStorage.getItem('user') != undefined){
    userData.user = JSON.parse(localStorage.getItem('user'));
  } else {
    router.push('/login');
  }
})

watchEffect(() => {
  const currentRoute = router.currentRoute.value.path;
    if (!userData.user && !['/login', '/register', '/'].includes(currentRoute)) {
        router.push('/login');
    }
});
</script>

<template>
  <div>
    <div>  
      <BackgroundImage/>
    </div>
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