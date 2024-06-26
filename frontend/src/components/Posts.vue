<script setup>
import PostCard from './PostCard.vue';
import SideBar from './SideBar.vue';
import { usePostsData } from '../stores/postsData';
import { useFilterData } from '../stores/filterData';
import { getTimePassed } from '../utils/TimeUtils.js';
import { ref, onMounted, onUnmounted, watch } from 'vue';
import Menu from "../assets/icons/menu.svg";


let results = ref(null);
const postsData = usePostsData();
const filterData = useFilterData();

onMounted(async () => {
    await postsData.getAllPosts();
    filterData.setPosts(postsData.posts);
    results.value = postsData.posts.length;
    filterData.doneByMe = null
    filterData.myPosts = false;
});

watch(() => (filterData.filter || filterData.myPosts), () => {
    filterResults();
});

let showFilter = ref(false);

const filterToggle = () => {
    showFilter.value = !showFilter.value;
};

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

const filterResults = async () => {
    if (filterData.allFiltersOff) {
        if (filterData.doneByMe) {
            filterData.posts = filterData.getAllPostsDoneByMe(filterData.doneByMe).then(() => {
                results.value = filterData.posts.length;
            });
            return;
        }
        if (filterData.myPosts) {
            filterData.posts = postsData.posts.filter(post => {
                return post.userID === JSON.parse(localStorage.getItem('user')).id;
            });
            results.value = filterData.posts.length;
            return;
        } else {
            filterData.posts = postsData.posts;
            results.value = filterData.posts.length;
            return;
        }
    }
    else {
        filterData.posts = postsData.posts.filter(post => {
            return filterData.filter[post.category];
        });
        results.value = filterData.posts.length;
    }
};

</script>

<template>
    <div class="wrapper">
        <div class="view-title">
            <span v-if="screenSize < 1000" @click="filterToggle">
                <button class="filter-button">
                    <img :src="Menu" alt="menu" />
                </button>
            </span>
            Found {{ results }} results
        </div>
        <div v-if="showFilter && screenSize < 1000" class="filters" @click="filterToggle">
            <div class="filters-content" @click.stop>
                <SideBar />
            </div>
        </div>
        <div class="cards">
            <div class="post-cards-container">
                <Router-Link :to="`/postDetail/${post.id}`" v-for="(post, index) in filterData.posts" :key="index">
                    <PostCard :post="post" :posted-at="getTimePassed(post.createdAt)" />
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
    height: 45rem;
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
    display: flex;
    color: #FFF;
    font-family: Inter;
    font-size: 1.75rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;
    margin-top: 3rem;
    margin-left: 4rem;
}

.filter-button {
    background-color: transparent;
    border: none;
    cursor: pointer;

    img {
        margin-right: 1rem;
        width: 2rem;
        height: 2rem;

        &:hover {
            scale: 1.1;
        }
    }
}

.filters {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
}

.filters-content {
    height: 85%;
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

    .view-title {
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