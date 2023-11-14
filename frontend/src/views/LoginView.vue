<script setup>
import LoginContent from '../components/LoginContent.vue';
</script>

<template>
    <div>
        <div class="login-card-position">
            <LoginContent/>
        </div>
    </div>
</template>

<style scoped>
.login-card-position {
    margin-top: 8rem;
    margin-left: 13rem;
    position: absolute;
    background-color: #343434;
    border-radius: 2.5rem;
    width: 42.8125rem;
    height: 36rem;
}
</style>