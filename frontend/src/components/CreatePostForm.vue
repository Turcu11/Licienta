<script setup>

</script>

<template>
        <div class="column">
            <div class="row">
                <div class="column">coll 1</div>
                <div class="column">coll 2</div>
                <div class="column">coll 3</div>
            </div>
            <div class="row">
                ROW
            </div>
        </div>
</template>

<style lang="scss" scoped>
    .row
    {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }
    .column
    {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
</style>