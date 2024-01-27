import { ref } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'

export const usePostsData = defineStore('postsData', {
    state: () => ({
        posts: ref([]),
        error: ref(null)
    }),
    actions: {
        async getAllPosts() {
            try {
                const response = await axios.get('http://127.0.0.1:3000/posts/all');
                this.posts = response.data;
                this.error = null;
                console.log(this.posts);
            }
            catch (error) {
                console.error('Failed to get posts:', error);
                this.error = 'Failed to get posts.';
            }
        },
        async getPostById(id) {
            try {
                const response = await axios.get(`http://127.0.0.1:3000/posts/${id}`);
                this.posts = response.data;
                this.error = null;
                console.log(this.posts);
            }
            catch (error) {
                console.error('Failed to get posts:', error);
                this.error = 'Failed to get posts.';
            }
        },
        async getPostByCategory(category) {
            try {
                const response = await axios.get(`http://127.0.0.1:3000/posts/category/${category}`);
                this.posts = response.data;
                this.error = null;
                console.log(this.posts);
            }
            catch (error) {
                console.error('Failed to get posts:', error);
                this.error = 'Failed to get posts.';
            }
        },
        async createPost(post) {
            try {
                const response = await axios.post('http://127.0.1:3000/posts/create', post);
                this.posts = response.data;
                this.error = null;
                console.log(this.posts);
            }
            catch (error) {
                console.error('Failed to create post:', error);
                this.error = 'Failed to create post.';
            }
        }
    }
});
