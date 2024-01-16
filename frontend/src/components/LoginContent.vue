<script setup>
import { ref } from 'vue';
import { RouterLink, useRouter } from 'vue-router';
import { useUserLoginData } from '../stores/userLoginData';
import bcrypt from 'bcryptjs';

const router = useRouter();
const email = ref('');
const password = ref('');
const userData = useUserLoginData();

const getUserByEmail = async (email, password) => {
    if (email == '' || email === undefined || email === null || password == '' || password === undefined || password === null) {
        alert('Please enter your email and password');
        return;
    }
    else{
        await userData.getUser(email, password);
        if (!userData.error) {
            router.push('/mainView');
            localStorage.setItem('user', JSON.stringify(userData.user));
        }
    }
}

</script>

<template>
    <div class="login-wraper">
        <h1 class="login-title">Log in to see al the posts, <br> or to post a new request</h1>
        <div class="login-credentials">
            <p class="login-paragraph">Mail goes gere</p>
            <input v-model="email" class="login-inputs" type="text" placeholder="somebody@gmail.com">
            <p class="login-paragraph">Password goes here</p>
            <input v-model="password" class="login-inputs" type="password" placeholder="*************">
        </div>
        <div class="login-options">
            <p class="login-option-line">
                Forgot password?
                <RouterLink to="">
                    <span class="login-options-links">
                        Click here
                    </span>
                </RouterLink>
            </p>
            <p class="login-option-line">
                Don't have an account?
                <RouterLink :to="{ name: 'register' }">
                    <span class="login-options-links">
                        Register now
                    </span>
                </RouterLink>
            </p>
        </div>
        <div class="login-button">
            <button class="login-button-red" @click="getUserByEmail(email, password)">Login</button>
        </div>
    </div>
</template>

<style scoped>
* {
    font-family: inter;
}

.login-options-links {
    color: #C12323;
    text-decoration: underline;
}

.login-option-line {
    margin-top: 1rem;
    text-align: center;
    color: #FFF;
    font-family: sans-serif;
    font-size: .8rem;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
}

.login-button {
    display: flex;
    justify-content: center;

}

.login-button-red {
    width: 29rem;
    height: 3.125rem;
    background-color: #C12323;
    border-radius: 2.5rem;
    border: none;
    margin-top: 1.5rem;
    color: #FFF;
    text-align: center;
    font-size: 1rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;
}

input,
select,
textarea {
    color: #ffffff;
}

::placeholder {
    color: rgba(255, 255, 255, 0.60);
}

.login-inputs {
    width: 29rem;
    height: 3rem;
    border-radius: 2.5rem;
    border: none;
    background-color: #272727;
    padding-left: 1.5rem;
}

.login-credentials {
    margin: 0 auto;
    margin-top: 1.3rem;
}

.login-paragraph {
    color: #FFF;
    font-family: sans-serif;
    padding-left: 1.5rem;
    font-size: 1.125rem;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
}

.login-title {
    margin-top: 3.5rem;
    color: #FFF;
    text-align: center;
    font-family: sans-serif;
    font-size: 1.75rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;
}

.login-wraper {
    display: flex;
    flex-direction: column;
    align-items: center;
}

@media (max-width: 768px) {
    .login-inputs {
        width: 23rem;
        height: 3rem;
    }

    .login-button-red {
        width: 23rem;
        height: 3.125rem;
    }
}

@media (max-width: 600px) {
    .login-inputs {
        width: 18rem;
        height: 3rem;
    }

    .login-button-red {
        width: 18rem;
        height: 3.125rem;
    }
}

@media (max-width: 480px) {
    .login-title {
        font-size: 1.5rem;
    }

    .login-inputs {
        width: 15rem;
        height: 3rem;
    }

    .login-button-red {
        width: 15rem;
        height: 3.125rem;
    }
}

@media (max-width: 440px) {
    .login-title {
        font-size: 1.3rem;
    }

    .login-inputs {
        width: 13rem;
        height: 3rem;
    }

    .login-button-red {
        width: 13rem;
        height: 3.125rem;
    }
}</style>