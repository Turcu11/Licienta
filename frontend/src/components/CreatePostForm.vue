<script setup>
import { ref, watch, computed } from 'vue'
import { useRouter } from 'vue-router'
import { usePostsData } from '../stores/postsData.js'
import { storage } from '../../utils/dbFirebase.js'
import { ref as firebaseRef, uploadBytesResumable, getDownloadURL, listAll } from "@firebase/storage"
import PostCardPreview from './PostCardPreview.vue'

const router = useRouter();
const postsData = usePostsData();
const currentUser = JSON.parse(localStorage.getItem('user'));
const imgUrl = ref('');
const tempImg = ref('');

const title = ref('*Title');
const description = ref('*Description');
const address = ref('*Address');
const category = ref('');
const specialRequirements = ref('');
const prefferedInterval = ref('');
const prefferedDay = ref('');
const payCard = ref(false);
const payCash = ref(false);
const offer = ref(0);
const isNegotiable = ref(false);
const images = ref('');

const onFileChange = (e) => {
    const file = e.target.files[0];
    const reader = new FileReader();

    reader.onloadend = () => {
        images.value = reader.result;
        tempImg.value = reader.result;
    };

    if (file) {
        reader.readAsDataURL(file);
        uploadImage(file);
    }
};

watch(offer, (value) => {
    if (value <= 1 || value == null || value == undefined) {
        offer.value = 1;
    }
});

const uploadImage = (img) => {
    const file = img;
    const uploadTask = uploadBytesResumable(firebaseRef(storage, "images/" + file.name), file);

    uploadTask.on('state_changed',
        (snapshot) => {
            // monitor the upload progress
        },
        (error) => {
            console.error(error);
        },
        () => {
            getDownloadURL(uploadTask.snapshot.ref).then((downloadURL) => {
                images.value = downloadURL;
                imgUrl.value = downloadURL;
                console.log('File available at', downloadURL);
            });
        }
    );
};

const createPost = () => {
    if (title.value == '' ||
        description.value == '' ||
        address.value == '' ||
        category.value == '' ||
        offer.value <= 0 ||
        payCard.value == false &&
        payCash.value == false ||
        images.value == '') {
        if (payCard.value == false && payCash.value == false) {
            alert('Please select a payment method!');
            return;
        }
        else
            if (imgUrl.value == '') {
                alert('Please upload an image!');
            }

        alert('Please fill all fields!');
        return;
    }

    const post = {
        title: title.value,
        description: description.value,
        address: address.value,
        category: category.value,
        specialRequirments: specialRequirements.value,
        preferredInterval: prefferedInterval.value,
        preferredDays: prefferedDay.value,
        payCash: payCard.value,
        payCard: payCash.value,
        price: offer.value,
        isNegotiable: isNegotiable.value ? true : false,
        image: imgUrl.value,
        isDone: false,
        userID: currentUser ? currentUser.id : 1,
        postedBy: currentUser.fullName,
        serviceProviderID: 0,
    }

    if (imgUrl.value) {
        uploadImage(imgUrl.value)
    }

    postsData.createPost(post);
    emptyFields();
    router.push({ name: "mainView" });
};

const emptyFields = () => {
    title.value = '';
    description.value = '';
    address.value = '';
    category.value = '';
    specialRequirements.value = '';
    prefferedInterval.value = '';
    prefferedDay.value = '';
    payCard.value = false;
    payCash.value = false;
    offer.value = 0;
    isNegotiable.value = false;
    images.value = '';
    imgUrl.value = '';
};

const imageLoaded = computed(() => imgUrl.value !== null && imgUrl.value !== undefined && imgUrl.value !== '');

</script>

<template>
    <div class="create-post-container">
        <div class="column-top">
            <div class="row">
                <div class="column">
                    <input type="text" class="title" v-model="title" placeholder="Title" />
                    <textarea class="description" v-model="description" placeholder="Description"></textarea>
                    <input type="text" class="address" v-model="address" placeholder="Address" />
                    <select v-model="category" class="select-input">
                        <option value="" disabled selected>*Select category</option>
                        <option value="Electrical">Electrical</option>
                        <option value="Pluming">Pluming</option>
                        <option value="Doors">Doors</option>
                        <option value="Heating">Heating</option>
                        <option value="Garden">Garden</option>
                        <option value="Furniture">Furniture</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="column">
                    <input type="text" v-model="specialRequirements" placeholder="Special Requirements" />
                    <select v-model="prefferedInterval" class="select-input">
                        <option value="" disabled selected>Select interval</option>
                        <option value="10-12">10-12</option>
                        <option value="12-14">12-14</option>
                        <option value="14-16">14-16</option>
                        <option value="16-18">16-18</option>
                        <option value="18-20">18-20</option>
                        <option value="All day">All day (10-20)</option>
                    </select>
                    <select v-model="prefferedDay" class="select-input">
                        <option value="" disabled selected>Select day</option>
                        <option value="Monday">Monday</option>
                        <option value="Tuesday">Tuesday</option>
                        <option value="Wednesday">Wednesday</option>
                        <option value="Thursday">Thursday</option>
                        <option value="Friday">Friday</option>
                        <option value="Saturday">Saturday</option>
                        <option value="Sunday">Sunday</option>
                        <option value="Week days">Week days (Mo-Fr)</option>
                    </select>
                    <div class="row-for-payment">
                        <span class="payment-text">Pay Card</span>
                        <input type="checkbox" v-model="payCard" />
                    </div>
                    <div class="row-for-payment">
                        <span class="payment-text">Pay Cash</span>
                        <input type="checkbox" v-model="payCash" />
                    </div>
                    <div class="offer-container">
                        <span>Offer €</span>
                        <input type="number" v-model="offer" placeholder="Offer" min="1" class="number-input" />
                    </div>
                    <div class="row-for-payment">
                        <span class="payment-text">Open to negotiation</span>
                        <input type="checkbox" v-model="isNegotiable" />
                    </div>
                </div>
                <div class="column">
                    <div class="image-upload">
                        <input type="file" id="file" @change="onFileChange" style="display: none">
                        <label for="file" class="custom-file-upload">Upload an Image</label>
                    </div>
                    <button class="create-post-button" :class="{'imageLoaded': imageLoaded }" :disabled="!imageLoaded" @click="createPost">Create Post</button>
                </div>
            </div>
            <div class="row-preview">
                <PostCardPreview :title="title" :description="description" :image="images" :priceOffer="offer"
                    :postedAt="'Just now'" :category="category" />
                <img :src="{ imgUrl }" alt="" srcset="">
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
.number-input::-webkit-inner-spin-button,
.number-input::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
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

.title {
    width: 18rem;
    height: 1.5rem;
    margin-bottom: 1rem;
}

.address {
    width: 18rem;
    height: 1.5rem;
    margin-bottom: 1rem;

}

.create-post-button {
    width: 10rem;
    height: 2rem;
    background-color: #484848;
    border-radius: 2.5rem;
    border: none;
    color: #FFF;
    text-align: center;
    font-size: .9rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;

    &:hover {
        scale: 1.1;
    }
}
.create-post-button:disabled {
    background-color: #484848;
    cursor: not-allowed;
    opacity: 0.7;
    scale: 1;
}

.imageLoaded{
    background-color: #C12323;

}

.select-input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    background-color: #484848;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;

    option {
        color: #fff;
        text-align: center;

        &:hover {
            background-color: #343434;
        }
    }
}

.image-upload {
    background-color: #484848;
    border-radius: 0.5rem;
    border: none;
    margin-bottom: 1rem;
    padding: 0.5rem;
    height: 18rem;
    width: 18rem;
    display: flex;
    flex-direction: column;
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
    height: 9rem;
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

    input:not([type="checkbox"]) {
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
    border-radius: 1.25rem;
    background: #343434;

}

.row {
    display: flex;
    flex-direction: row;
}

.row-preview {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;

    @media (max-width: 768px) {
        display: none;
    }
}

.row-for-payment {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    margin-bottom: 1rem;

    .payment-text {
        font-family: inter;
        font-size: .9rem;
        margin-right: 1rem;
    }
}

.offer-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-bottom: 1rem;

    span {
        font-family: inter;
        margin-right: 1rem;
        margin-bottom: 1rem;
    }

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

@media (max-width: 1350px) {
    .title {
        width: 13rem;
    }

    .address {
        width: 13rem;
    }

    .image-upload {
        width: 13rem;
    }

    textarea {
        width: 13rem;
    }

    input:not([type="checkbox"]) {
        width: 13rem;
    }
}

@media (max-width: 1000px) {
    .title {
        width: 10rem;
    }

    .address {
        width: 10rem;
    }

    .image-upload {
        width: 10rem;
    }

    textarea {
        width: 10rem;
    }

    input:not([type="checkbox"]) {
        width: 10rem;
    }
}

@media (max-width: 850px) {
    .title {
        width: 8rem;
    }

    .address {
        width: 8rem;
    }

    .image-upload {
        width: 8rem;
    }

    textarea {
        width: 8rem;
    }

    input:not([type="checkbox"]) {
        width: 8rem;
    }
}

@media (max-width: 768px) {
    .row {
        max-height: 40rem;
        overflow: auto;
        flex-direction: column;
        align-items: center;
    }

    .create-post-container {
        width: 100%;
        height: 100%;
        overflow: auto;
    }

    .title {
        width: 17rem;
    }

    .address {
        width: 17rem;
    }

    .image-upload {
        width: 17rem;
    }

    textarea {
        width: 17rem;
    }

    input:not([type="checkbox"]) {
        width: 17rem;
    }

    .create-post-button {
        margin-bottom: 1.5rem;
        margin-top: .8rem;
    }
}

@media (max-width: 480px) {
    .title {
        width: 13rem;
    }

    .address {
        width: 13rem;
    }

    .image-upload {
        width: 13rem;
    }

    textarea {
        width: 13rem;
    }

    input:not([type="checkbox"]) {
        width: 13rem;
    }
}
</style>