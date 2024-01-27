<script setup>
import { ref, watch } from 'vue'
import { usePostsData } from '../stores/postsData.js'
import { storage } from '../../utils/dbFirebase.js'
import { ref as  firebaseRef, uploadBytesResumable, getDownloadURL, listAll } from "@firebase/storage"
import PostCard from './PostCard.vue'

const postsData = usePostsData();
const currentUser = JSON.parse(localStorage.getItem('user'));
const imgUrl = ref('');
const tempImg = ref('');

const title = ref('Title');
const description = ref('Description');
const address = ref('Address');
const category = ref('');
const specialRequirements = ref('');
const prefferedInterval = ref('');
const prefferedDay = ref('');
const payCard = ref(false);
const payCash = ref(false);
const offer = ref(0);
const isNegotiable = ref(Boolean);
const images = ref('');

const onFileChange = (e) => {
    const file = e.target.files[0];
    const reader = new FileReader();

    reader.onloadend = () => {
        images.value = reader.result;
        tempImg.value = reader.result;
    };

    if(file){
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
    const uploadTask = uploadBytesResumable(firebaseRef(storage, "images/"+file.name), file);

    uploadTask.on('state_changed',
        (snapshot) => {
            // You can use this function to monitor the upload progress
        },
        (error) => {
            // Handle unsuccessful uploads
            console.error(error);
        },
        () => {
            // Handle successful uploads on complete
            getDownloadURL(uploadTask.snapshot.ref).then((downloadURL) => {
                images.value = downloadURL;
                imgUrl.value = downloadURL;
            });
        }
    );
};

const createPost = () => {
    if( title.value == '' || 
        description.value == '' || 
        address.value == '' || 
        category.value == '' || 
        offer.value <= 0 || 
        images.value == '')
        {
            if(payCard.value == false && payCash.value == false){
                alert('Please select a payment method!');
                return;
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
        isNegotiable: isNegotiable.value,
        image: imgUrl.value,
        isDone: false,
        userID: currentUser.id,
        postedBy: currentUser.fullName,
        serviceProviderID: 0,
        postedAt: new Date().toLocaleString(),
    };
    if(imgUrl.value){
        uploadImage(imgUrl.value)
    }

    postsData.posts.push(post);
    postsData.createPost(post);
    // localStorage.setItem('posts', JSON.stringify(postsData.posts));
};

</script>

<template>
    <div class="create-post-container">
        <div class="column-top">
            <div class="row">
                <div class="column">
                    <input type="text" v-model="title" placeholder="Title" />
                    <textarea class="description" v-model="description" placeholder="Description"></textarea>
                    <input type="text" v-model="address" placeholder="Address" />
                    <select v-model="category" class="select-input">
                        <option value="" disabled selected>Select category</option>
                        <option value="Electrical">Electrical</option>
                        <option value="Pluming">Pluming</option>
                        <option value="Doors">Doors</option>
                        <option value="Heating">Heating</option>
                        <option value="Garden">Garden</option>
                        <option value="Furniture">Furniture</option>
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
                    <input type="checkbox" v-model="payCard" /> Pay Card
                    <input type="checkbox" v-model="payCash" /> Pay Cash
                    <input type="number" v-model="offer" placeholder="Offer" min="1" class="number-input" />
                    Open to negotiation
                    <input type="checkbox" v-model="isNegotiable" />
                </div>
                <div class="column">
                    <div class="image-upload">
                        <input type="file" id="file" @change="onFileChange" style="display: none" >
                        <label for="file" class="custom-file-upload">Upload an Image</label>
                    </div>
                    <button class="create-post-button" @click="createPost">Create Post</button>
                </div>
            </div>
            <div class="row">
                <PostCard :title="title" :description="description" :image="images" :priceOffer="offer"
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

.create-post-button{
    width: 10rem;
    height: 2rem;
    background-color: #C12323;
    border-radius: 2.5rem;
    border: none;
    color: #FFF;
    text-align: center;
    font-size: .9rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;

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