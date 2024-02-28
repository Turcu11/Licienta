<script setup>
import {ref, onMounted, onUnmounted, watch} from 'vue';
import SideBar from '../components/SideBar.vue';
import Posts from '../components/Posts.vue';

let screenSize = ref(window.innerWidth);

const updateScreenSize = () => {
    screenSize.value = window.innerWidth;
};

onMounted(() => {
    window.addEventListener('resize', updateScreenSize);
});

onUnmounted(() => {
    window.removeEventListener('resize', updateScreenSize);
});
</script>
    
<template>
    <div class="wraper">
        <div v-if="screenSize > 1000">
            <SideBar/>
        </div>
        <Posts/>
    </div>
</template>

<style lang="scss" scoped>
.wraper{
    display: flex;
    justify-content: center;
}

</style>
