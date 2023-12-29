<script setup>
import { ref, onMounted } from 'vue';
import PostCard from './PostCard.vue';
import { usePostsData } from '../stores/postsData';
let results = ref(null);

const postsData = usePostsData();

onMounted(async () => {
    await postsData.getAllPosts();
    results.value = postsData.posts.length;
});

const getTimePassed = (createdAt) => {
    const now = new Date();
    const postDate = new Date(createdAt);
    const diffInMilliseconds = now - postDate;
    const diffInSeconds = Math.floor(diffInMilliseconds / 1000);
    const diffInMinutes = Math.floor(diffInSeconds / 60);
    const diffInHours = Math.floor(diffInMinutes / 60);
    const diffInDays = Math.floor(diffInHours / 24);

    if (diffInDays > 0) {
        return `${diffInDays} day(s) ago`;
    } else if (diffInHours > 0) {
        return `${diffInHours} hour(s) ago`;
    } else if (diffInMinutes > 0) {
        return `${diffInMinutes} minute(s) ago`;
    } else {
        return `${diffInSeconds} second(s) ago`;
    }
};

</script>

<template>
    <div class="wrapper">
        <div class="view-title">Found {{ results }} results</div>
        <div class="cards">
            <div class="post-cards-container">
                <Router-Link :to="`/postsDetail/${post.id}`" v-for="(post, index) in postsData.posts" :key="index">
                    <PostCard   :title="post.title" 
                                :image="post.image" 
                                :description="post.description"
                                :posted-by="post.postedBy" 
                                :category="post.category"
                                :price-offer="post.price" 
                                :posted-at="getTimePassed(post.createdAt)" />
                </Router-Link>
            </div>
        </div>
    </div>
</template>

<style scoped lang="scss">
a {
    text-decoration: none;
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

body {
    scrollbar-face-color: #C12323;
    scrollbar-track-color: transparent;
}

.wrapper {
    display: flex;
    flex-direction: column;
    margin-top: 1.8rem;
    margin-left: 1.75rem;
    width: 80rem;
    height: 50rem;
    border-radius: 1.25rem;
    padding-right: 10px;
    background-color: #343434;
}

.cards {
    margin-top: 1.8rem;
    margin-left: 4rem;
    margin-bottom: 2rem;
    border-radius: 1.25rem;
    background-color: #343434;
    overflow: auto;
}

.post-cards-container {
    display: flex;
    flex-direction: column;
}

.view-title {
    color: #FFF;
    font-family: Inter;
    font-size: 1.75rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;
    margin-top: 3rem;
    margin-left: 4rem;
}

@media (max-width: 1600px) {
    .wrapper {
        width: 60rem;
    }

}

@media (max-width: 1250px) {
    .wrapper {
        width: 50rem;
    }

    .cards {
        margin-left: 3rem;
    }

}

@media (max-width: 1100px) {
    .wrapper {
        width: 40rem;
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
    }
}

@media (max-width: 480px) {
    .wrapper {
        margin-left: 0rem;
        width: 20rem;
    }

    .cards {
        margin-left: 1rem;
    }
}

@media (max-width: 360px) {
    .wrapper {
        margin-left: 0rem;
        width: 16rem;
    }

    .cards {
        margin-left: 1rem;
    }
}
</style>
