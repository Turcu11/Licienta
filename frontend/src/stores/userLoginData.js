import { ref } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'

export const useUserLoginData = defineStore('userLoginData', {
    state: () => ({
        user: ref(null),
        error: ref(null)
    }),
    actions: {
        async getUser(email, password) { //this is the function used to get the current user who's logged in
            try {
                const response = await axios.get(`http://127.0.0.1:3000/users/email/${email}`);
                this.user = response.data;
                this.error = null;
                if(password === undefined || password === null || password === ""){
                    alert("Password is required.")
                    this.error = "Password is required.";
                    return this.error;
                }  
                else if (this.user.password === password) {
                    this.error = null;
                    console.log(`You are logged in as ${this.user.fullName}!`);
                    console.log(this.user); 
                    return true; 
                } else {
                    alert(`Wrong password. Please try again.`)
                    this.error = 'Wrong password. Please try again.';
                    console.error('Wrong password. Please try again.');
                    return false;
                }
            } catch (error) {
                alert(`Email ${email} not found. Please check the email.`)
                console.error('Failed to get user:', error);
                this.error = 'Failed to get user. Please check the email.';
            }
        },
    }
});