<!-- src/components/Hello.vue -->
<template>
    <div class="container">
        <div v-if="loading" class="loading">Loading...</div>
        <div v-if="error" class="error">
            {{ error }}
        </div>
        <table v-if="posts" class="table table-striped">
            <thead>
                <tr>
                    <th>Address</th>
                    <th>Public key</th>
                    <th>Voting power</th>
                    <th>Proposer priority</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="post in posts" v-bind:key="post.id">
                    <td class="f-500 c-cyan">{{post.pub_key.value}}</td>
                    <td>{{post.voting_power}}</td>
                    <td class="f-500 c-cyan">{{post.proposer_priority}}</td>
                    <td>{{post.address}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
    props: ['name', 'initialEnthusiasm'],
    data() {
        return {
            enthusiasm: this.initialEnthusiasm,
            loading: false,
            posts: null,
            error: null,
        }
    },
    created () {
        // fetch the data when the view is created and the data is
        // already being observed
        this.fetchData()
    },
    watch: {
        // call again the method if the route changes
        '$route': 'fetchData'
    },
    methods: {
        fetchData () {
            this.error = this.posts = null
            this.loading = true
            fetch('http://localhost:3000/api/v1/validators/')
            .then(response => {
                return response.json();
            })
            .then(data => {
                this.loading = false
                this.posts = data
                console.log(`data`, data)
            })
            .catch(error => {
                this.error = error
            })
        },
    }
})

</script>

<style>
.greeting {
    font-size: 20px;
}
</style>
