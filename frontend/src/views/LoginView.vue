<script setup>
import LoginContent from '../components/LoginContent.vue';

</script>

<template>
    <div>
        <div class="login-card-position">
            <LoginContent />
        </div>
    </div>
</template>

<style lang="scss" scoped>
.login-card-position {
    margin-top: 8rem;
    margin-left: 13rem;
    position: absolute;
    background-color: #343434;
    border-radius: 2.5rem;
    width: 42.8125rem;
    height: 36rem;
}

@media (max-width: 1200px) {
    .login-card-position {
        margin-left: 10rem;
    }
}

@media (max-width: 992px) {
    .login-card-position {
        margin-top: 8rem;
        margin-left: 6rem;
        width: 38rem;
        height: 36rem;
    }
}
@media (max-width: 768px) {
    .login-card-position {
        margin-top: 8rem;
        margin-left: 4rem;
        width: 30rem;
        height: 36rem;
    }
}
@media (max-width: 600px) {
    .login-card-position {
        margin-top: 8rem;
        margin-left: 2rem;
        width: 26rem;
        height: 36rem;
    }
}
@media (max-width: 480px) {
    .login-card-position {
        margin-top: 8rem;
        margin-left: 2rem;
        width: 23rem;
        height: 36rem;
    }
}
@media (max-width: 440px) {
    .login-card-position {
        margin-top: 8rem;
        margin-left: 2rem;
        width: 20rem;
        height: 36rem;
    }
}
</style>