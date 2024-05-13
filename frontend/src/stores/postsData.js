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
                const response = await axios.get('http://127.0.0.1:3000/posts/all-open-posts');
                this.posts = response.data;
                this.error = null;
                // console.log(this.posts);
            }
            catch (error) {
                console.error('Failed to get posts:', error);
                this.error = 'Failed to get posts.';
            }
        },

        async getAllDonePosts() {

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
                const response = await axios.post('http://127.0.0.1:3000/posts/create', post);
                this.posts = response.data;
                this.error = null;
                console.log(this.posts);
            }
            catch (error) {
                console.error('Failed to create post:', error);
                this.error = 'Failed to create post.';
            }
        },

        async markPostAsDone(id, userId) {
            try {
                const response = await axios.put(`http://127.0.0.1:3000/posts/mark-post-as-done/${id}/${userId}`);
                this.error = null;
            }
            catch (error) {
                console.error('Failed to mark post as done:', error);
                this.error = 'Failed to mark post as done.';
            }
        },
        
        async deletePost(id) {
            try {
                const response = await axios.delete(`http://127.0.0.1:3000/posts/${id}`);
                this.error = null;
            }
            catch {
                console.error('Failed to delete post:', error);
                this.error = 'Failed to delete post.';
            }
        }
    }
});
