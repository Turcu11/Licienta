<script setup>
defineProps({
    text: String,
    color: String,
    isTrue: Boolean,
})

</script>

<template>
    <div class="wraper" :style="{
        borderColor: isTrue ? '#C12323' : 'transparent',
        borderWidth: isTrue ? '2px' : '0',
        borderStyle: isTrue ? 'solid' : 'none',
        color: isTrue ? `#fff` : `grey`,
        cursor: isTrue ? `auto` : `not-allowed`
    }">
        <div class="text">{{ text }}</div>
    </div>
</template>

<style lang="scss" scoped>
.wraper {
    margin-top: 1rem;
    background-color: #343434;
    border-radius: .5rem;
    width: 8rem;
    height: 2rem;
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>