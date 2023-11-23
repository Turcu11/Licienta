<script setup>
import RegisterContent from '../components/RegisterContent.vue';
</script>
    
<template>
        <div class="register-card-position">
            <RegisterContent/>
        </div>
</template>

<style scoped>
.register-card-position {
    margin-top: 5rem;
    margin-left: 13rem;
    position: absolute;
    background-color: #343434;
    border-radius: 2.5rem;
    width: 42.8125rem;
    height: 45rem;
}

@media (max-width: 1200px) {
    .register-card-position {
        margin-left: 10rem;
    }
}

@media (max-width: 992px) {
    .register-card-position {
        margin-left: 6rem;
        width: 38rem;
        height: 45rem;
    }
}
@media (max-width: 768px) {
    .register-card-position {
        margin-left: 4rem;
        width: 30rem;
        height: 44rem;
    }
}
@media (max-width: 600px) {
    .register-card-position {
        margin-left: 2rem;
        width: 26rem;
        height: 44rem;
    }
}
@media (max-width: 480px) {
    .register-card-position {
        margin-left: 2rem;
        width: 23rem;
        height: 44rem;
    }
}
@media (max-width: 440px) {
    .register-card-position {
        margin-left: 2rem;
        width: 20rem;
        height: 44rem;
    }
}

</style>
