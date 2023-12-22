<script setup>
import { ref } from 'vue';
import PostCard from './PostCard.vue';
let results = ref(46);

</script>

<template>
    <div class="wrapper">
        <div class="view-title">Found {{ results }} results</div>
        <div class="cards">
            <div class="post-cards-container">
                <PostCard title="Radiator wont heat" image="radiator.png"
                    description="Lorem ipsum dolor sit amet consectetur. Sagittis commodo ipsum amet id non commodo. Nulla tristique turpis tempus sit dictumst nisi condimentum nunc vestibulum."
                    posted-by="John Doe" :price-offer=20 posted-at="just now" />
                <PostCard title="Radiator wont heat" image="radiator.png"
                    description="Lorem ipsum dolor sit amet consectetur. Sagittis commodo ipsum amet id non commodo. Nulla tristique turpis tempus sit dictumst nisi condimentum nunc vestibulum."
                    posted-by="Marack Obama" :price-offer=150 posted-at="3h ago" />
                <PostCard title="Radiator wont heat" image="radiator.png"
                    description="Lorem ipsum dolor sit amet consectetur. Sagittis commodo ipsum amet id non commodo. Nulla tristique turpis tempus sit dictumst nisi condimentum nunc vestibulum."
                    posted-by="Chris Tomlin" :price-offer=80 posted-at="30m ago" />
            </div>
        </div>
    </div>
</template>

<style scoped lang="scss">
.wrapper {
    display: flex;
    flex-direction: column;
    margin-top: 1.8rem;
    margin-left: 1.75rem;
    width: 80rem;
    height: 50rem;
    border-radius: 1.25rem;
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
    color: #FFF;
    font-family: Inter;
    font-size: 1.75rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;
    margin-top: 3rem;
    margin-left: 4rem;
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
