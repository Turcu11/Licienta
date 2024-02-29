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
    if (props.image && props.image !== 'null' && props.image !== 'undefined' && props.image !== 'http://localhost:5173/placeholder.jpg' && props.image !== '' && props.image !== ' ') {
        return props.image;
    } else if (props.image.includes('.jpg') || props.image.includes('.png')) {
        return props.image;
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
                <div class="extra-details">
                    Special requirements: <b>{{ specialRequirements }} </b> <br />
                    Avalible: <b>{{ prefferedDays }}</b> <br />
                    Hours: <b>{{ prefferedInterval }} </b> <br />
                </div>
                <div class="payment-methods">
                    <PaymentMethod text="Card" :isTrue="payCard" />
                    <PaymentMethod text="Cash" :isTrue="payCash" />
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
    text-align: center;
    padding: 10%;
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

.middle .payment-methods {
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
}

@media (max-width: 1350px) {
    .container {
        width: 56rem;
    }

    .middle {
        width: 14rem;

        .description-box {
            width: 14em;
        }

        hr {
            width: 14em;
        }

        .extra-details {
            width: 14em;
        }

        .payment-methods {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 14em;
        }

        .description-box {
            max-height: 10rem;
        }

        h1 {
            font-size: 1.7rem;
        }
    }

    .img {
        width: 24rem;
    }
}

@media (max-width: 1000px) {
    .container {
        width: 46rem;
    }

    .middle {
        width: 10rem;

        .description-box {
            width: 10em;
            margin-top: 0.3rem;
            margin-bottom: 0.3rem;
        }

        hr {
            display: none;
        }

        .extra-details {
            width: 10em;
        }

        .payment-methods {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 10em;
        }

        .payment-methods {
            scale: 0.9;
        }

        .description-box {
            max-height: 10rem;
        }
    }

    .img {
        height: 22rem;
        width: 18rem;
    }

    .right {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    h1 {
        margin-bottom: 0.5rem;
        font-size: 1.5rem;
    }
}

@media (max-width: 850px) {
    .container {
        width: 36rem;
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        height: auto;
    }

    .section {
        flex-direction: column;
    }

    .img {
        width: 100%;
        height: 20rem;
    }

    .middle {
        width: 100%;
        text-align: center;
        padding: 0;
        margin-top: 1rem;

        .description-box {
            width: 90%;
            max-height: 10rem;
        }

        .extra-details {
            width: 90%;
        }

        .payment-methods {
            flex-direction: row;
            width: 90%;
        }
    }
}

@media (max-width: 768px) {
    .container {
        width: 25rem;
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        height: auto;
    }
}

@media (max-width: 600px) {
    .container {
        width: 21rem;
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        height: auto;
    }
}

@media (max-width: 480px) {
    .container {
        width: 16rem;
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        height: auto;
    }

    .img {
        width: 16rem;
        height: auto;
    }

    .middle {
        .description-box {
            max-height: max-content;
            height: auto;
        }
    }
    .section{
        .right{
            padding: 0px;
        }
    }
}</style>