<script setup>
import FilterLine from './FilterLine.vue';
</script>
    
<template>
    <div class="wraper">
        <h1 class="filter-title">Filters</h1>
        <hr class="title-under-line">
        <div class="filters">
            <FilterLine filterName="Electrical"/>
            <FilterLine filterName="Pluming"/>
            <FilterLine filterName="Doors"/>
            <FilterLine filterName="Heating"/>
            <FilterLine filterName="Garden"/>
            <FilterLine filterName="Furniture"/>
        </div>
    </div>
</template>


<style lang="scss" scoped>
.wraper {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 2rem;
}
.filters{
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.title-under-line {
    width: 7.5rem;
    height: 0.0625rem;
    background: #C12323;
    border: none;
}

.filter-title {
    color: #FFF;
    margin-bottom: 0px;
    font-family: inter;
    font-size: 1.375rem;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
}
</style>
