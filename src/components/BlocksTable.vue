<!-- src/components/Hello.vue -->
<template>
    <div class="blocks-table container">
        <div v-if="loading" class="loading">Loading...</div>
        <div v-if="error" class="error">
            {{ error }}
        </div>
        <vue-good-table v-if="rows"
            :columns="columns"
            :rows="rows"
            styleClass="vgt-table striped bordered"
            :sort-options="{
                enabled: true,
                initialSortBy: {field: 'validatorAddress', type: 'desc'}
            }"/>
    </div>
</template>

<script lang="ts">
import Vue from "vue";
//@ts-ignore
import { VueGoodTable } from 'vue-good-table'

interface ApiRecord{
    address: string
    pub_key: {
        type: string
        value: string
    },
    voting_power: number
    proposer_priority: number
}

interface NormalizedRecord{
    validatorAddress: string
    publicKey: string
    votingPower: number
    proposerPriority: number
}

export default Vue.extend({
    props: ['name', 'initialEnthusiasm'],
    data() {
        return {
            columns: [
                {
                    label: 'Address',
                    field: 'validatorAddress'
                },
                {
                    label: 'Public Key',
                    field: 'publicKey'
                },
                {
                    label: 'Voting Power',
                    field: 'votingPower'
                },
                {
                    label: 'Proposer Priority',
                    field: 'proposerPriority'
                }
            ],
            enthusiasm: this.initialEnthusiasm,
            loading: false,
            rows: [] as NormalizedRecord[] | null,
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
        normalizeData(data: ApiRecord[]): NormalizedRecord[]{
            return data.map(record => {
                return {
                    validatorAddress: record.address,
                    publicKey: record.pub_key.value,
                    votingPower: record.voting_power,
                    proposerPriority: record.proposer_priority
                }
            })
        },
        fetchData () {
            this.error = this.rows = null
            this.loading = true
            fetch('http://localhost:3000/api/v1/validators/')
            .then(response => {
                return response.json();
            })
            .then(data => {
                this.loading = false
                this.rows = this.normalizeData(data)
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

.blocks-table thead th{
    cursor:pointer;
}

.blocks-table tbody tr:hover{
    cursor:pointer;
    background-color:#dcdcdc !important;
}
</style>
