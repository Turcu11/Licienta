<script setup>
import { computed } from 'vue';

const props = defineProps({
    id: Number,
    title: String,
    description: String,
    address: String,
    category: String,
    specialRequirements: String,
    prefferedInterval: String,
    prefferedDays: String,
    payCash: Boolean,
    payCard: Boolean,
    price: Number,
    isNegotiable: Boolean,
    image: String,
    isDone: Boolean,
    userID: Number,
    serviceProviderID: Number,
    createdAt: String,
    updatedAt: String,
    deletedAt: String,
})

const imgUrl = computed(() => {
    if (props.image && props.image !== 'null' && props.image !== 'undefined') {
        return "http://localhost:5173/" + props.image;
    } else {
        return "http://localhost:5173/placeholder.jpg";
    }
});

</script>

<template>
    <div class="container">
        <div class="section">
            <div class="right">
                <div class="img">
                    <img :src="imgUrl" alt="Post image" />
                </div>
            </div>
            <div class="middle">
                <h1>{{ title }}</h1>
                <div class="description-box">
                    <p>{{ description }}</p>
                </div>
                <br />
                Special requirements: {{ specialRequirements }} <br />
                prefferedInterval: {{ prefferedInterval }} <br />
                prefferedDays: {{ prefferedDays }} <br />
                payCash: {{ payCash }} <br />
                payCard: {{ payCard }} <br />
            </div>
            <div class="left">

            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
.middle{
    color: #FFF;
    font-family: inter;
    font-size: 1rem;
    .description-box{
        // background-color: red;
        margin-top: 1rem;
        width: 22rem;
        height: 18rem;
        border-radius: 1.25rem;
        overflow: auto;
        // background-color: #484848;
        p{
            font-size: 1rem;
            line-height: 160%;
        }
    }
}

.img {
    margin-top: .8rem;
    margin-left: .8rem;
    height: 31.25rem;
    width: 31.25rem;

    img {
        height: 100%;
        width: 100%;
        border-radius: 1.25rem;
        object-fit: cover;
    }
}

.section {
    display: flex;
    justify-content: space-between;

    .right,
    .middle,
    .left {
        flex: 1;
        padding: 1rem;
    }
}

.container {
    display: flex;
    flex-direction: column;
    margin: auto;
    margin-top: 1rem;
    width: 75rem;
    height: 35rem;
    border-radius: 1.25rem;
    padding-right: 10px;
    background-color: #484848;
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

</style>