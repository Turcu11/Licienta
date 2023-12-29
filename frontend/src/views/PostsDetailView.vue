<script setup>
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router';
import { usePostDetailsData } from '../stores/postDetailsData.js';

const route = useRoute();
const postId = route.params.id;
const currentPost = usePostDetailsData();
const post = ref(null);

onMounted(async () => {
    post.value = await currentPost.getPostById(postId);
    console.log(post.data);
});
</script>

<template>
    <h1>Hello this is post {{ postId }}</h1>
</template>

<style lang="scss"></style>