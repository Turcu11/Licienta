import { ref } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'

export const usePostDetailsData = defineStore('postDetailsData', {
    state: () => ({
        post: ref([]),
        error: ref(null)
    }),
    actions: {
        async getPostById(id) {
            try {
                const response = await axios.get(`http://127.0.0.1:3000/posts/${id}`);
                this.post = response.data;
                this.error = null;
                console.log(this.post);
                return this.post;
            }
            catch (error) {
                console.error('Failed to get posts:', error);
                this.error = 'Failed to get posts.';
            }
        },
    }
});
