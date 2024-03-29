import {ref} from 'vue'
import {defineStore} from 'pinia'

export const useFilterData = defineStore('filterData', {
    state: () => ({
        filter: ref([]),
        posts: ref([]),
        myPosts: ref(null),
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
    },
    getters: {
        allFiltersOff() {
            return Object.values(this.filter).every(value => value === false);
        }
    }
});
