<script setup>
import {ref, onMounted, onUnmounted} from 'vue';
import SideBar from '../components/SideBar.vue';
import Posts from '../components/Posts.vue';

let screenSize = ref(window.innerWidth);
let filters = ref({});

const updateScreenSize = () => {
    screenSize.value = window.innerWidth;
};

onMounted(() => {
    window.addEventListener('resize', updateScreenSize);
});

onUnmounted(() => {
    window.removeEventListener('resize', updateScreenSize);
});

const handleUpdateFilters = (newFilters) => {
    filters.value = newFilters;
}

</script>
    
<template>
    <div class="wraper">
        <div v-if="screenSize > 1000">
            <SideBar @apply-filters="handleUpdateFilters"/>
        </div>
        <Posts :filters="filters"/>
    </div>
</template>

<style lang="scss" scoped>
.wraper{
    display: flex;
    justify-content: center;
}

</style>
