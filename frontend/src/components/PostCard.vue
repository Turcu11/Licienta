<script setup>
import { defineProps } from 'vue';
import { useUserLoginData } from '../stores/userLoginData';
import { usePostsData } from '../stores/postsData';
import { useRouter } from 'vue-router';
import Delete from "../assets/icons/Delete.svg";

const postsData = usePostsData();
const activeUser = useUserLoginData();
const router = useRouter();

const props = defineProps({
    post: Object,
    postedAt: String,
})

const isMyPost = () => {
    if (activeUser && activeUser.user) {
        if (activeUser.user.id === props.post.userID) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        return false;
    }
}

const handleDelete = async () => {
    if (confirm("Are you sure you want to delete this post?")) {
        await postsData.deletePost(props.post.id);
        router.push({ name: "mainView" });
    } else {
        return;
    }
}
</script>

<template>
    <div>
        <div class="card">
            <div class="section">
                <div class="left">
                    <img class="image" v-if="post.image" :src="post.image">
                    <img class="image" v-else src="/placeholder.jpg">
                </div>

                <div class="middle">
                    <h1 class="title">{{ post.title }}</h1>
                    <div class="description-box">
                        <p class="description">{{ post.description }}</p>
                    </div>
                    <br>
                    <p>Categoty: {{ post.category }}</p>
                </div>

                <div class="right">
                    <div v-if="isMyPost()" class="delete-button">
                        <button @click="handleDelete()">
                            <img :src="Delete" alt="Delete">
                        </button>
                    </div>
                    <h4>Offered: {{ post.priceOffer }}&#8364</h4>
                    <p>{{ postedAt }}</p>
                </div>
            </div>
        </div>
    </div>
</template>


<style scoped lang="scss">
.description-box {
    max-width: 45rem;
    max-height: 4rem;
    text-overflow: ellipsis;
    overflow: hidden;
}

.delete-button {
    button {
        background: none;
        border: none;
        cursor: pointer;
    }

    img {
        width: 1.5rem;
        height: 1.5rem;

        &:hover {
            transform: scale(1.1);
        }
    }
}

.section {
    display: flex;
    flex-direction: row;
    align-items: center;
}

.left {
    width: 10rem;
    height: 10rem;
    margin: .95rem;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
}

.left img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 1rem;
}

h1 {
    margin-bottom: 0.3rem;
}

p {
    margin-top: 0.5rem;
}

.middle p {
    display: flex;
    flex-direction: column;
    max-width: 50rem;
    color: rgba(255, 255, 255, 0.75);
    font-family: Inter;
    font-weight: 300;
    line-height: normal;

    h4 {
        color: #FFF;
    }
}

.right {
    display: flex;
    flex-direction: column;
    margin-top: 1rem;
    margin-left: auto;
    padding-right: 1.5rem;
    text-align: right;
    color: rgba(255, 255, 255, 0.75);
    font-family: Inter;
    font-weight: 300;
    line-height: normal;

    span,
    h4 {
        color: #FFF;
        font-weight: 600;
    }
}

.title {
    color: #FFF;
    font-family: Inter;
    font-size: 1.375rem;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
}

.card {
    width: 71rem;
    height: 12rem;
    background-color: #484848;
    border-radius: 1.25rem;
    margin-top: 1rem;
    margin-bottom: 1rem;
}

@media (max-width: 1600px) {
    .card {
        width: 50rem;
        height: auto;
    }

    .middle,
    p,
    .description {
        text-overflow: ellipsis;
        max-width: 30rem;
    }

}

@media (max-width: 1250px) {
    .card {
        width: 43rem;
        height: auto;
    }

    .middle,
    p,
    .description {
        text-overflow: ellipsis;
        max-width: 25rem;
    }

}

@media (max-width: 1100px) {
    .card {
        width: 34rem;
        height: auto;
    }

    .middle,
    p,
    .description {
        text-overflow: ellipsis;
        max-width: 20rem;
    }
}

@media (max-width: 768px) {
    .card {
        width: 25rem;
        height: auto;
        display: flex;
        flex-direction: column;
    }

    .left {
        width: 22rem;
        height: 20rem;
    }

    .image {
        width: 20rem;
        height: auto;
    }

    .section {
        display: flex;
        flex-direction: column;
        text-align: center;

    }

    .right {
        text-align: center;
        margin-left: auto;
        margin-right: auto;
    }

    .middle,
    p,
    .description {
        text-overflow: ellipsis;
        max-width: 15rem;
    }

}

@media (max-width: 600px) {
    .card {
        width: 20rem;
        height: auto;
        display: flex;
        flex-direction: column;
    }

    .left {
        width: 18rem;
        height: 18rem;
    }

    .image {
        width: 16rem;
        height: auto;
    }

    .section {
        display: flex;
        flex-direction: column;
    }

    .right {
        text-align: center;
        margin-left: auto;
        margin-right: auto;
    }

    .middle,
    p {
        max-width: 15rem;
        max-height: 15rem;

        .description {
            text-overflow: ellipsis;
            max-width: 15rem;
            overflow: hidden;
        }
    }
}

@media (max-width: 480px) {
    .card {
        width: 18rem;
        height: auto;
        display: flex;
        flex-direction: column;
    }

    .left {
        width: 16rem;
        height: 16rem;
    }

    .image {
        width: 16rem;
        height: auto;
    }

    .section {
        display: flex;
        flex-direction: column;
    }

    .right {
        text-align: center;
        margin-left: auto;
        margin-right: auto;
    }

    .middle,
    p,
    .description {
        text-overflow: ellipsis;
        max-width: 14rem;
        max-height: 12rem;
        overflow: hidden;
    }
}

@media (max-width: 360px) {
    .card {
        width: 13.5rem;
        height: auto;
        display: flex;
        flex-direction: column;
    }

    .left {
        width: 12rem;
        height: 12rem;
    }


    .image {
        width: 11rem;
        height: auto;
    }

    .section {
        display: flex;
        flex-direction: column;
    }

    .right {
        text-align: center;
        margin-left: auto;
        margin-right: auto;
    }

    .middle,
    p,
    .description {
        text-overflow: ellipsis;
        overflow: hidden;
        max-height: 10rem;
        max-width: 10rem;
    }
}
</style>