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
                    <img class="image" :src="image" alt="">
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

    h4 {
        color: #FFF;
    }
}

.right,
p {
    display: flex;
    flex-direction: column;
    margin-top: 1rem;
    ;
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
    height: 11rem;
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

    .middle, p, .description{
        max-width: 30rem;
    }

}

@media (max-width: 1250px) {
    .card {
        width: 43rem;
        height: auto;
    }
    .middle, p, .description{
        max-width: 25rem;
    }

}

@media (max-width: 1100px) {
    .card {
        width: 34rem;
        height: auto;
    }
    .middle, p, .description{
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

    .image{
        width: 20rem;
        height: auto;
    }
    .section{
        display: flex;
        flex-direction: column; 
        text-align: center;

    }
    .middle, p, .description{
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
    .image{
        width: 16rem;
        height: auto;
    }
    .section{
        display: flex;
        flex-direction: column; 
    }
    .middle, p{
        max-width: 15rem;
        max-height: 15rem;
        .description{
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
    .image{
        width: 16rem;
        height: auto;
    }
    .section{
        display: flex;
        flex-direction: column; 
    }
    .middle, p, .description{
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
    .image{
        width: 11rem;
        height: auto;
    }
    .section{
        display: flex;
        flex-direction: column; 
    }
    .middle, p, .description{
        max-height: 10rem;
        overflow: hidden;
        max-width: 10rem;
    }
}
</style>
