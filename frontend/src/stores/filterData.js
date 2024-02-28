import {ref} from 'vue'
import {defineStore} from 'pinia'

export const useFilterData = defineStore('filterData', {
    state: () => ({
        filter: ref([]),
        posts: ref([]),
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
        }
    },
    getters: {
        allFiltersOff() {
            return Object.values(this.filter).every(value => value === false);
        }
    }
});
