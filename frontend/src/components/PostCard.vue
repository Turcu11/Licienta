<script setup>
import { defineProps } from 'vue'

defineProps({
    title: String,
    description: String,
    image: String,
    priceOffer: Number,
    postedBy: String,
    postedAt: String,
})

</script>
    
<template>
    <div>
        <div class="card">
            <div class="section">
                <div class="left">
                    <img :src="image" alt="">
                </div>

                <div class="middle">
                    <h1 class="title">{{ title }}</h1>
                    <p class="description">{{ description }}</p>
                    <p>Posted by: <span>{{ postedBy }}</span></p>
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
.section {
    display: flex;
    flex-direction: row;
    align-items: center;
}

.left {
    margin: .95rem;
}

.middle p {
    display: flex;
    flex-direction: column;
    max-width: 50rem;
    color: rgba(255, 255, 255, 0.75);
    font-family: Inter;
    font-weight: 300;
    line-height: normal;
    h4{
        color: #FFF;
    }
}

.right, p {
    display: flex;
    flex-direction: column;
    margin-top: 1rem;;
    color: rgba(255, 255, 255, 0.75);
    font-family: Inter;
    font-weight: 300;
    line-height: normal;

    span, h4{
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
    height: 11rem;
    background-color: #484848;
    border-radius: 1.25rem;
    margin-top: 1rem;
    margin-bottom: 1rem;
}
</style>
