<script setup>
import { defineProps, watch } from 'vue';
defineProps({
    title: String,
    description: String,
    image: String,
    priceOffer: Number,
    postedBy: String,
    postedAt: String,
    category: String
})

</script>
    
<template>
    <div>
        <div class="card">
            <div class="section">
                <div class="left">
                    <img class="image" v-if="image" :src="image">
                    <img class="image" v-else src="/placeholder.jpg">
                </div>

                <div class="middle">
                    <h1 class="title">{{ title }}</h1>
                    <div class="description-box">
                        <p class="description">{{ description }}</p>
                    </div>
                    <br>
                    <p>Categoty: {{ category }}</p>
                </div>

                <div class="right">
                    <h4>Offered: {{ priceOffer }} &#8364</h4>
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
    overflow: hidden;
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

h1{
    margin-bottom: 0.3rem;
}

p{
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
    padding-right: 2rem;
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

@media (max-width: 1350px) {
    .card {
        width: 57rem;
        height: auto;
    }

    .middle,
    p,
    .description {
        max-width: 30rem;
    }

}

@media (max-width: 1000px) {
    .card {
        width: 47rem;
        height: auto;
    }

    .middle,
    p,
    .description {
        max-width: 25rem;
    }

}

@media (max-width: 850px) {
    .card {
        width: 39rem;
        height: auto;
    }

    .middle,
    p,
    .description {
        max-width: 25rem;
    }

}

</style>
