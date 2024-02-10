<script setup>
const props = defineProps({
    filterName: String,
    filterIsChecked: Boolean,
    default: false
})
</script>

<template>
    <div>
        <label class="container" :for="filterName">{{ filterName }}
            <input class="checkbox" type="checkbox" :checked="filterIsChecked" :id="filterName" :name="filterName"
                :value="filterName">
            <span class="checkmark"></span>
        </label>
    </div>
</template>


<style lang="scss" scoped>
.container {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    color: #ffffff;
    font-family: inter;
    font-size: 1.15rem;
}

/* Hide the browser's default checkbox */
.container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
    height: 0;
    width: 0;
}

.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    border-radius: 30%;
    vertical-align: middle;
    border: 2px solid #C12323;
    vertical-align: middle;
}


.container input:checked~.checkmark {
    background-color: #C12323;
}

.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

.container input:checked~.checkmark:after {
    display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}


// aaaaaaaaaaa

// .filter-title{
//     color: #FFF;
//     margin: 1rem;
//     font-family: inter;
//     font-size: 1rem;
//     font-style: normal;
//     font-weight: 400;
//     line-height: normal;
//     margin-left: 0.5rem;
// }

// .checkbox {
//     width: 1.125rem;
//     height: 1.125rem;
//     border-radius: 0.4375rem;
//     border-radius: 30%;
//     vertical-align: middle;
//     border: 2px solid #C12323;
//     appearance: none;
//     // -webkit-appearance: none;
//     // outline: none;
//     cursor: pointer;
// }
</style>
