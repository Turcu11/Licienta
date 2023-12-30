<script setup>
import { onMounted, ref, watch } from 'vue';
import { RouterLink, useRoute, useRouter } from 'vue-router';
import { usePostDetailsData } from '../stores/postDetailsData.js';
import PostsDetailContent from '../components/PostsDetailContent.vue';

const route = useRoute();
const router = useRouter();
const postId = ref(route.params.id);
const currentPost = usePostDetailsData();
const isLoading = ref(true);

const fetchPost = async () => {
    isLoading.value = true;
    await currentPost.getPostById(postId.value);
    isLoading.value = false;
};

watch(postId, fetchPost, { immediate: true });

const goBack = () => {
    router.go(-1);
};
</script>

<template>
    <div class="wrapper">
        <h1 @click="goBack" class="go-back" > &#x2039 Go back </h1>
        <div v-if="isLoading">Loading...</div>
        <div v-else-if="currentPost.post">
            <PostsDetailContent 
                :id="currentPost.post.id" 
                :title="currentPost.post.title" 
                :description="currentPost.post.description"
                :image="currentPost.post.image"
            />
        </div>
    </div>
</template>

<style lang="scss" scoped>
.wrapper {
    display: flex;
    flex-direction: column;
    margin: auto;
    margin-top: 1.8rem;
    width: 80rem;
    height: 45rem;
    border-radius: 1.25rem;
    background-color: #343434;
}
.go-back{
    margin-left: 3rem;
    margin-top: 3rem;
    color: #FFF;
    font-family: inter;
    cursor: pointer;
}
</style>