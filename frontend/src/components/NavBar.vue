<script setup>
import { RouterLink } from 'vue-router'
import { useUserLoginData } from '../stores/userLoginData';
import { onMounted } from 'vue';
const userData = useUserLoginData();

onMounted(() => {
    const storedUser = localStorage.getItem('user');
    if (storedUser) {
        userData.user = JSON.parse(storedUser);
    }
});

const logout = () => {
    userData.user = undefined;
    localStorage.removeItem('user');
}

</script>

<template>
    <div>
        <nav class="nav-bar">
            <RouterLink :to="{ name: 'landing' }">
                <img @click="logout" class="nav-bar-logo" src="/Logo white.png" alt="" srcset="">
            </RouterLink>

            <div class="user-welcome">
                <div v-if="!userData.error && userData.user != undefined">
                    Hello <b>{{ userData.user.fullName }}</b>
                    <RouterLink :to="{ name: 'mainView' }">
                        <button class="logout-button-red" @click="logout">Logout</button>
                    </RouterLink>
                </div>
                <RouterLink v-if="!userData.user" :to="{ name: 'login' }">
                    <button class="logout-button-red">Login</button>
                </RouterLink>
            </div>
        </nav>
    </div>
</template>

<style lang="scss" scoped>
.logout-button-red {
    width: 5rem;
    height: 2rem;
    margin-left: 2rem;
    background-color: #C12323;
    border-radius: 2.5rem;
    border: none;
    color: #FFF;
    text-align: center;
    font-size: .9rem;
    font-style: normal;
    font-weight: 600;
    line-height: normal;

    &:hover {
        transform: scale(1.1);
    }
}

.user-welcome {
    color: white;
    font-size: .9rem;
    font-family: inter;
    margin-right: 4rem;
}

.nav-bar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    height: 3.75rem;
    background-color: #272727;
}

.nav-bar-logo {
    margin: 0 0 0 3.75rem;
    width: 9.1875rem;
    height: 2.625rem;
}

@media (max-width: 600px) {

    .nav-bar-logo {
        margin: 0 0 0 1.75rem;
        width: 9.1875rem;
        height: 2.625rem;
    }

    .user-welcome {
        margin-right: 1rem;
    }

}

@media (max-width: 480px) {

    .nav-bar {
        height: 6rem;
    }

    .nav-bar-logo {
        margin: 0 0 0 1.75rem;
        width: 9.1875rem;
        height: 2.625rem;
    }

    .user-welcome {
        display: flex;
        flex-direction: column;
        text-align: end;
        margin-right: 1rem;
    }

    .logout-button-red {
        margin-top: .5rem;
        margin-left: 0rem;
    }

}
</style>