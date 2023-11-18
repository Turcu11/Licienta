<script setup>
import { RouterLink } from 'vue-router'
</script>

<template>
    <div>
        <nav class="nav-bar">
            <RouterLink :to="{name: 'landing'}">
                <img class="nav-bar-logo" src="Logo white.png" alt="" srcset="">
            </RouterLink>
        </nav>
    </div>
</template>

<style lang="scss" scoped>
.nav-bar {
    display: flex;
    align-items: center;
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