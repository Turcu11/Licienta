<script setup>
    import Filters from './Filters.vue';
</script>

<template>
    <div class="sidebar-wraper">
        <button class="create-post-button">Create a post</button>
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
    height: 50rem;
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
    font-size: 0.9rem;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
}
</style>
