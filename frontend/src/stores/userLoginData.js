import { ref } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios' 

export const useUserLoginData = defineStore('userLoginData', {
    state: () => ({
        user: ref(null),
        error: ref(null)
    }),
    actions: {
        async getUser(email) {
            try {
                console.log(email);
                const response = await axios.get(`http://127.0.0.1:3000/users/email/${email}`);
                this.user = response.data;
                this.error = null;
            } catch (error) {
                console.error('Failed to get user:', error);
                this.error = 'Failed to get user. Please check the email.';
            }
        }
    }
});