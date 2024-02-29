<script setup>
import FilterLine from './FilterLine.vue';
import { ref } from 'vue';
import { useFilterData } from '../stores/filterData';

const filterData = useFilterData();

const activeFilters = ref({
    Electrical: false,
    Pluming: false,
    Doors: false,
    Heating: false,
    Garden: false,
    Furniture: false,
    Other: false,
});

const applyFilters = () => {
    filterData.setFilter({...activeFilters.value});
}

const clearFilters = () => {
    filterData.setFilter({
        Electrical: false,
        Pluming: false,
        Doors: false,
        Heating: false,
        Garden: false,
        Furniture: false,
        Other: false,
    });
}
</script>
    
<template>
    <div class="wraper">
        <h1 class="filter-title">Filters</h1>
        <hr class="title-under-line">
        <div class="filters">
            <FilterLine :currentState="filterData.filter.Electrical" :modelValue=filterData.Electrical filterName="Electrical" v-model="activeFilters.Electrical"/>
            <FilterLine :currentState="filterData.filter.Pluming" :modelVale="filterData.Pluming" filterName="Pluming" v-model="activeFilters.Pluming"/>
            <FilterLine :currentState="filterData.filter.Doors" :modelVale="filterData.Doors" filterName="Doors" v-model="activeFilters.Doors"/>
            <FilterLine :currentState="filterData.filter.Heating" :modelVale="filterData.Heating" filterName="Heating" v-model="activeFilters.Heating"/>
            <FilterLine :currentState="filterData.filter.Garden" :modelVale="filterData.Garden" filterName="Garden" v-model="activeFilters.Garden"/>
            <FilterLine :currentState="filterData.filter.Furniture" :modelVale="filterData.Furniture" filterName="Furniture" v-model="activeFilters.Furniture"/>
            <FilterLine :currentState="filterData.filter.Other" :modelVale="filterData.Other" filterName="Other" v-model="activeFilters.Other"/>
        </div>
        <button @click="applyFilters" class="apply-button"> Apply Filter </button>
        <!-- <button @click="clearFilters" class="clear-button"> Clear Filters </button> -->
    </div>
</template>

<style lang="scss" scoped>
.wraper {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 0.5rem;
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

.apply-button, .clear-button {
    margin-top: 1rem;
    width: 10rem;
    height: 2.5rem;
    border-radius: 1.5rem;
    border: none;
    background: #484848;
    color: #FFF;
    font-family: inter;
    text-align: center;
    font-size: .95rem;
    font-style: normal;
    font-weight: 500;
    line-height: normal;

    &:hover {
        border: 2px solid #C12323;
        transform: scale(1.1);
    }
}
</style>