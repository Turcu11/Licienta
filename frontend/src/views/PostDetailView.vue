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
    // console.log(postId.value)
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
        <h1 @click="goBack" class="go-back"> &#x2039 Go back </h1>
        <div v-if="isLoading">Loading...</div>
        <div v-else-if="currentPost.post">
            <PostsDetailContent :id="currentPost.post.id" :title="currentPost.post.title"
                :description="currentPost.post.description" :address="currentPost.post.address"
                :category="currentPost.post.category" :specialRequirements="currentPost.post.specialRequirments"
                :prefferedInterval="currentPost.post.preferredInterval" :prefferedDays="currentPost.post.preferredDays"
                :payCash="currentPost.post.payCash" :payCard="currentPost.post.payCard" :price="currentPost.post.price"
                :isNegotiable="currentPost.post.isNegotiable" :image="currentPost.post.image"
                :isDone="currentPost.post.isDone" :userID="currentPost.post.userID"
                :serviceProviderID="currentPost.post.serviceProviderID" :createdAt="currentPost.post.createdAt"
                :user="currentPost.post.User" />
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
    &:hover {
        color: #d3d3d3;
    }
}

::-webkit-scrollbar {
    width: 10px;
}

::-webkit-scrollbar-track {
    background: transparent;
}

::-webkit-scrollbar-thumb {
    background: #C12323;
    border-radius: 5px;
}

@media (max-width: 1350px) {
    .wrapper {
        width: 60rem;
    }
}

@media (max-width: 1000px) {
    .wrapper {
        width: 50rem;
    }
}

@media (max-width: 850px) {
    .wrapper {
        width: 42rem;
        overflow: auto;
    }
}

@media (max-width: 768px) {
    .wrapper {
        width: 31rem;
    }
}

@media (max-width: 600px) {
    .wrapper {
        width: 26rem;
        overflow: auto;
    }
}

@media (max-width: 480px) {
    .wrapper {
        width: 20rem;
        overflow: auto;
    }
}
</style>