<script setup>
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
                    <p class="description">{{ description }}</p>
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
.section {
    display: flex;
    flex-direction: row;
    align-items: center;
}

.left {
    width: 10rem;
    height: 9rem;
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

    .middle,
    p,
    .description {
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
        max-height: 10rem;
        overflow: hidden;
        max-width: 10rem;
    }
}</style>
