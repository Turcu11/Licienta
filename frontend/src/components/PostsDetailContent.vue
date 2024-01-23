<script setup>
import { computed } from 'vue';
import PaymentMethod from './PaymentMethod.vue';

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
    user: Object,
})

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
                <hr>
                Special requirements: {{ specialRequirements }} <br />
                Avalible: {{ prefferedDays }} <br />
                Hours: {{ prefferedInterval }} <br />
                <div class="payment-methods">
                    <PaymentMethod text="Card" :isTrue="payCard" />
                    <PaymentMethod text="Cash" :isTrue="payCash"/>
                </div>
            </div>
            <div class="left">
                <div class="left-container">
                    <h3 class="posted-by">Posted by:</h3>
                    <h1 class="user-name">{{ user.fullName }}</h1>
                    <h1 class="user-phone">&#9742; {{ user.phone }}</h1>
                    <h5 class="for-address">Address:</h5>
                    <h5 class="address">{{ address }}</h5>
                    <span class="created-at"> &#x1F55F; {{ getTimePassed(createdAt) }}</span>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
.created-at {
    color: hsla(0, 0%, 100%, 0.75);
    font-family: inter;
    font-size: 1rem;
    margin-top: 10px;
}

.address {
    color: #FFF;
    font-family: inter;
    margin-top: 10px;
    font-size: 1rem;
}

.for-address {
    color: hsla(0, 0%, 100%, 0.75);
    font-family: inter;
    margin-bottom: 0px;
    font-size: .9rem;
}

.left {
    display: flex;
    align-items: center;
    justify-content: center;
}

.left-container {
    background-color: #343434;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    border-radius: 2rem;
    width: 90%;
    height: 70%;
}

.posted-by {
    color: hsla(0, 0%, 100%, 0.75);
    font-family: inter;
    margin-bottom: 0px;
    font-size: .9rem;
}

.user-name {
    color: #FFF;
    font-family: inter;
    font-size: 1.5rem;
}

.user-phone {
    color: hsla(0, 0%, 100%, 0.75);
    font-family: inter;
    font-size: 1rem;
}

.middle {
    color: #FFF;
    font-family: inter;
    font-size: 1rem;

    .description-box {
        margin-top: 1rem;
        padding-right: .5rem;
        width: 22rem;
        max-height: 18rem;
        border-radius: 1.25rem;
        overflow: auto;

        p {
            font-size: 1rem;
            line-height: 160%;
        }
    }
}

.middle .payment-methods{
    display: flex;
    justify-content: space-around;
    width: 22rem;
    margin-top: 1rem;

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
}</style>