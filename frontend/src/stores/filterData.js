import {ref} from 'vue'
import {defineStore} from 'pinia'
import axios from 'axios'

export const useFilterData = defineStore('filterData', {
    state: () => ({
        filter: ref([]),
        posts: ref([]),
        myPosts: ref(null),
        doneByMe: ref(null),
        error: ref(null)
    }),
    actions: {
        getFilter() {
            return this.filter;
        },
        setFilter(filter) {
            this.filter = filter;
        },
        setPosts(posts) {
            this.posts = posts;
        },
        getPosts() {
            return this.posts;
        },
        setMyPosts(myPosts) {
            this.myPosts = myPosts;
        },
        getMyPosts() {
            return this.myPosts;
        },
        setDoneByMe(doneByMe) {
            this.doneByMe = doneByMe;
        },
        getDoneByMe() {
            return this.doneByMe;
        },
        async getAllPostsDoneByMe(id) {
            try {
                const response = await axios.get(`http://127.0.0.1:3000/posts/all-done-posts/${id}`);
                this.posts = response.data;
                this.error = null;
            }
            catch (error) {
                console.error('Failed to get done posts:', error);
                this.error = 'Failed to get done posts.';
            }
        },
    },
    getters: {
        allFiltersOff() {
            return Object.values(this.filter).every(value => value === false);
        }
    }
});
