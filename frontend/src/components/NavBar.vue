<script setup>
import { RouterLink } from 'vue-router'
import { useUserLoginData } from '../stores/userLoginData';
const userData = useUserLoginData();

const logout = () => {
    userData.user = undefined;
    localStorage.removeItem('user');
}
</script>

<template>
    <div>
        <nav class="nav-bar">
            <RouterLink :to="{name: 'landing'}">
                <img @click="logout" class="nav-bar-logo" src="Logo white.png" alt="" srcset="">
            </RouterLink>
            <div class="user-welcome" v-if="!userData.error && userData.user != undefined">Hello <b>{{ userData.user.fullName }}</b>
                <RouterLink v-if="!userData.error && userData.user != undefined" :to="{name: 'mainView'}">
                    <button class="logout-button-red" @click="logout">Logout</button>
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
}
.user-welcome{
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
</style>