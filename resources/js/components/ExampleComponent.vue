<template>
    <div class="container">
        <div class="card">
            <div class="card-header bg-primary text-white">
                Example Component
            </div>
            <div class="card-body">
                <p>I'm an example Vue componkkkent in your Laravel application!</p>
                <button @click="incrementCount" class="btn btn-primary">Count: {{ count }}</button>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            count: 0
        };
    },
    methods: {
        incrementCount() {
            this.count++;
        }
    }
}
</script> 