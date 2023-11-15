<script setup>
import { RouterLink } from 'vue-router';
</script>

<template>
    <div class="landing-buttons">
        <Router-Link to="login">
            <button class="landing-button-red">Log In</button>
        </Router-Link>
        <Router-Link to="register">
            <button class="landing-button-outline">Register</button>
        </Router-Link>
    </div>
</template>

<style scoped>
.landing-buttons {
    margin-left: 10.13rem;
    margin-top: 5rem;
}

.landing-button-red {
    width: 10rem;
    height: 3.125rem;
    background-color: #C12323;
    border-radius: 2.5rem;
    border: none;
    color: #FFF;
    text-align: center;
    font-size: 1rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;
}

.landing-button-outline {
    width: 10rem;
    height: 3.125rem;
    margin-left: 2.5rem;
    border: 3px solid #C12323;
    border-radius: 2.5rem;
    background-color: transparent;
    color: #FFF;
    text-align: center;
    font-size: 1rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;
}
</style>