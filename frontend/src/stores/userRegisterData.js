import { ref } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'


export const useUserRegisterData = defineStore('userRegisterData', {
    state: () => ({
        user: ref(null),
        error: ref(null)
    }),
    actions: {
        async createUser(fullName, email, password) {
            try {
                if (password === undefined || password === null || password === "") {
                    alert("Invalid password. Please check your inputs.")
                    this.error = "Invalid password. Please check your inputs.";
                    return this.error;
                }
                const response = await axios.post('http://127.0.0.1:3000/users', {
                    fullName,
                    password,
                    email
                });
                this.user = response.data;
                this.error = null;
                console.log(`User ${this.user.fullName} created successfully!`);
                console.log(this.user);
                return true;
            } catch (error) {
                console.error('Failed to create user:', error);
                this.error = 'Failed to create user. Please check your inputs.';
                alert(this.error);
            }
        }
    }
});