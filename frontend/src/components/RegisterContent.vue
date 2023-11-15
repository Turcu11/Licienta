<script setup>
import { RouterLink } from 'vue-router';
</script>

<template>
    <div class="register-wraper">
        <h1 class="register-title">Create an account</h1>
        <div class="register-credentials">
            <p class="register-paragraph">Full name goes gere</p>
            <input class="register-inputs" type="text" placeholder="John Doe">
            <p class="register-paragraph">Mail goes gere</p>
            <input class="register-inputs" type="text" placeholder="somebody@gmail.com">
            <p class="register-paragraph">Password goes here</p>
            <input class="register-inputs" type="password" placeholder="*************">
            <p class="register-paragraph">Confirm the password</p>
            <input class="register-inputs" type="password" placeholder="*************">
        </div>
        <div class="register-options">
            <p class="register-option-line">
                Already have an account ?
                <RouterLink to="login">
                    <span class="register-options-links">
                        Click here
                    </span>
                </RouterLink>
            </p>
        </div>
        <div class="register-button">
            <button class="register-button-red">Create account</button>
        </div>
    </div>
</template>

<style scoped>
.register-options-links {
    color: #C12323;
    text-decoration: underline;
}

.register-option-line {
    margin-top: 2rem;
    text-align: center;
    color: #FFF;
    font-family: sans-serif;
    font-size: .8rem;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
}

.register-button {
    display: flex;
    justify-content: center;

}

.register-button-red {
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

.register-inputs {
    width: 29rem;
    height: 3rem;
    border-radius: 2.5rem;
    border: none;
    background-color: #272727;
    padding-left: 1.5rem;
}

.register-credentials {
    margin: 0 auto;
}

.register-paragraph {
    color: #FFF;
    font-family: sans-serif;
    padding-left: 1.5rem;
    font-size: 1.125rem;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
}

.register-title {
    margin-top: 3rem;
    color: #FFF;
    text-align: center;
    font-family: sans-serif;
    font-size: 1.75rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;
}

.register-wraper {
    display: flex;
    flex-direction: column;
    align-items: center;
}</style>
