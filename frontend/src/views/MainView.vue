<script setup>
import SideBar from '../components/SideBar.vue';
import Posts from '../components/Posts.vue';
</script>
    
<template>
    <div class="wraper">
        <SideBar/>
        <Posts/>
    </div>
</template>


<style lang="scss" scoped>
.wraper{
    display: flex;
    flex-direction: row;
    justify-content: center
}
</style>
