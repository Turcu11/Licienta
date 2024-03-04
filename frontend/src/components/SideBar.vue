<script setup>
import { RouterLink } from 'vue-router';
import Filters from './Filters.vue';
import { useFilterData } from '../stores/filterData';

const filterStore = useFilterData();

const isUserLogedIn = () => {
    if (localStorage.getItem('user')) {
        return true;
    } else {
        return false;
    }
};

const haddleMyPosts = () => {
    if (filterStore.myPosts) {
        filterStore.setMyPosts(false);
    } else {
        filterStore.setMyPosts(true);
    }
};

</script>

<template>
    <div class="sidebar-wraper">
        <RouterLink :to="{name: 'createPost'}">
            <button class="create-post-button">Create a post</button>
        </RouterLink>
        <Filters/>
        <div v-if="isUserLogedIn()" class="my-posts">
            <button class="my-posts-button" :class="{'my-posts-button-active': filterStore.myPosts && filterStore.allFiltersOff}" @click="haddleMyPosts()">Posted by me</button>
        </div>
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
    width: 11rem;
    height: 2.8rem;
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
        border: 2px solid #C12323;
        transform: scale(1.1);
    }
}

.my-posts-button {
    margin-top: 1rem;
    width: 10rem;
    height: 2.5rem;
    border-radius: 1.5rem;
    border: none;
    background: #484848;
    color: #FFF;
    font-family: inter;
    text-align: center;
    font-size: .95rem;
    font-style: normal;
    font-weight: 500;
    line-height: normal;

    &:hover {
        border: 2px solid #C12323;
        transform: scale(1.1);
    }
}
.my-posts-button-active{
    background: #C12323;
    color: #FFF;
    border: 2px solid #C12323;
    transform: scale(1.1);
}
</style>
