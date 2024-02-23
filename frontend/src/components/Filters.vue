<script setup>
import FilterLine from './FilterLine.vue';
import { ref, defineEmits } from 'vue';

const activeFilters = ref({
    Electrical: false,
    Pluming: false,
    Doors: false,
    Heating: false,
    Garden: false,
    Furniture: false,
});

const applyFilters = () => {
    // console.log(activeFilters.value);
    emit('applyFilters', activeFilters.value);
}
const emit = defineEmits(['applyFilters']);
</script>
    
<template>
    <div class="wraper">
        <h1 class="filter-title">Filters</h1>
        <hr class="title-under-line">
        <div class="filters">
            <FilterLine filterName="Electrical" v-model="activeFilters.Electrical"/>
            <FilterLine filterName="Pluming" v-model="activeFilters.Pluming"/>
            <FilterLine filterName="Doors" v-model="activeFilters.Doors"/>
            <FilterLine filterName="Heating" v-model="activeFilters.Heating"/>
            <FilterLine filterName="Garden" v-model="activeFilters.Garden"/>
            <FilterLine filterName="Furniture" v-model="activeFilters.Furniture"/>
        </div>
        <button @click="applyFilters"> Apply Filter </button>
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
