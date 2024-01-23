<script setup>
import { ref, watch } from 'vue';
import { usePostsData } from '../stores/postsData.js';
import PostCard from './PostCard.vue'

const postsData = usePostsData();

const title = ref('');
const description = ref('');
const address = ref('');
const category = ref('');
const specialRequirements = ref('');
const prefferedInterval = ref('');
const prefferedDay = ref('');
const payCard = ref(Boolean);
const payCash = ref(Boolean);
const offer = ref(Number);
const isNegotiable = ref(Boolean);
const images = ref([]);

watch(offer, (value) => {
    if (value <= 1) {
        offer.value = Number
    } else if (value == null || value == undefined) {
        offer.value = Number;
    }
});

</script>

<template>
    <div class="create-post-container">
        <div class="column-top">
            <div class="row">
                <div class="column">
                    <input type="text" v-model="title" placeholder="Title" />
                    <textarea class="description" v-model="description" placeholder="Description"></textarea>
                    <input type="text" v-model="address" placeholder="Address" />
                    <input type="text" v-model="category" placeholder="Category" />
                </div>
                <div class="column">
                    <input type="text" v-model="specialRequirements" placeholder="Special Requirements" />
                    <input type="text" v-model="prefferedInterval" placeholder="Preffered Interval" />
                    <input type="text" v-model="prefferedDay" placeholder="Preffered Day" />
                    <input type="checkbox" v-model="payCard" /> Pay Card
                    <input type="checkbox" v-model="payCash" /> Pay Cash
                    <input type="number" v-model="offer" placeholder="Offer" min="1" class="number-input" />
                    Open to negotiation
                    <input type="checkbox" v-model="isNegotiable" />
                </div>
                <div class="column">
                    <div class="image-upload">
                        <input type="file" id="file" @change="onFileChange" style="display: none" />
                        <label for="file" class="custom-file-upload">Upload an Image</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <PostCard :title="title" :description="description" :image="images" :priceOffer="offer"
                    :postedAt="'Just now'" :category="category" />
            </div>
        </div>
    </div>
</template>
1
<style lang="scss" scoped>
.number-input::-webkit-inner-spin-button,
.number-input::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.image-upload {
    background-color: #484848;
    border-radius: 0.5rem;
    border: none;
    margin-bottom: 1rem;
    padding: 0.5rem;
    height: 20rem;
    width: 18rem;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    font-family: inter;
    resize: none;

    .custom-file-upload {
        border: 1px solid #ccc;
        border-radius: 0.5rem;
        display: inline-block;
        padding: 6px 12px;
        cursor: pointer;

        &:hover {
            border: 2px solid #c12323;
        }
    }
}

.description {
    height: 8rem;
    margin-bottom: 1rem;
}

* {
    color: white;

    &::placeholder {
        color: white;
        text-align: center;
    }

    textarea {
        background-color: #484848;
        border-radius: 0.5rem;
        border: none;
        margin-bottom: 1rem;
        padding: 0.5rem;
        width: 18rem;
        text-align: center;
        font-family: inter;
        overflow-wrap: break-word;
        resize: none;
    }

    input {
        background-color: #484848;
        border-radius: 0.5rem;
        border: none;
        margin-bottom: 1rem;
        padding: 0.5rem;
        width: 18rem;
        text-align: center;
        overflow-wrap: break-word;
    }
}

.create-post-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 1.8rem;
    width: 80rem;
    border-radius: 1.25rem;
    background: #343434;

}

.row {
    display: flex;
    flex-direction: row;
    /* justify-content: space-between; */
}

.column {
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-left: 2.5rem;
    margin-right: 2.5rem;
    align-items: center;
}

.column-top {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}
</style>