<script setup>
import { RouterLink, useRoute, useRouter } from 'vue-router';
import CreatePostForm from '../components/CreatePostForm.vue';

const router = useRouter();
const goBack = () => {
    router.go(-1);
};

</script>

<template>

    <div class="wrapper">
        <h1 @click="goBack" class="go-back" > &#x2039 Go back </h1>
        <div class="create-post-form">
            <CreatePostForm />
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
    margin-bottom: 0px;
    margin-left: 3rem;
    margin-top: 3rem;
    color: #FFF;
    font-family: inter;
    cursor: pointer;
    &:hover {
        color: #d3d3d3;
    }
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
    }
}

@media (max-width: 768px) {
    .wrapper {
        width: 25rem;
        height: auto;
    }
}

@media (max-width: 480px) {
    .wrapper {
        width: 20rem;
        height: auto;
    }
}
</style>