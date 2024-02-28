<script setup>
import { RouterLink } from 'vue-router';
import Filters from './Filters.vue';

</script>

<template>
    <div class="sidebar-wraper">
        <RouterLink :to="{name: 'createPost'}">
            <button class="create-post-button">Create a post</button>
        </RouterLink>
        <Filters/>
    </div>
</template>



<style lang="scss" scoped>
.sidebar-wraper {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 1.8rem;
    width: 15rem;
    height: 45rem;
    border-radius: 1.25rem;
    background: #343434;
}

.create-post-button {
    margin-top: 2.5rem;
    width: 12.5rem;
    height: 3rem;
    border-radius: 1.5rem;
    border: none;
    background: #484848;
    color: #FFF;
    font-family: inter;
    text-align: center;
    font-size: 1rem;
    font-style: normal;
    font-weight: 500;
    line-height: normal;

    &:hover {
        /* background: #636363; */
        border: 2px solid #C12323;
    }
}
</style>
