<template>
    <div class="blocks-table">
        <h2 v-if="validatorAddress" class="address">
            Validator {{ validatorAddress }}
        </h2>
        <h2 v-else>
            Active validators
        </h2>
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
            }">
            <template slot="table-row" slot-scope="props">
                <span v-if="validatorAddress">
                    {{props.formattedRow[props.column.field]}}
                </span>
                <router-link v-else :to="'/validator/' + props.formattedRow.validatorAddress">
                    <span>
                        {{props.formattedRow[props.column.field]}}
                    </span>
                </router-link>
            </template>
        </vue-good-table>
    </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'
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

@Component
export default class BlocksTable extends Vue {
    error: string | null = null
    loading = true
    rows: null | NormalizedRecord[] = null
    validatorAddress: string | null = null
    data() {
        return {
            columns: [
                {
                    label: '',
                    field: 'rowIndex',
                    type: 'number'
                },
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
            loading: false,
            rows: [] as NormalizedRecord[] | null,
            error: null,
        }
    }

    created () {
        // fetch the data when the view is created and the data is
        // already being observed
        this.validatorAddress = this.$route.params.address
        if(typeof this.validatorAddress != 'string'){
            this.validatorAddress = ''
        }
        this.fetchData()
    }

    normalizeData(data: ApiRecord[]): NormalizedRecord[]{
            return data.map((record, index) => {
                return {
                    rowIndex: index + 1,
                    validatorAddress: record.address,
                    publicKey: record.pub_key.value,
                    votingPower: record.voting_power,
                    proposerPriority: record.proposer_priority
                }
            })
    }

    fetchData () {
        this.error = this.rows = null
        this.loading = true
        fetch(`http://localhost:3000/api/v1/validators/${this.validatorAddress}`)
        .then(response => {
            return response.json();
        })
        .then(data => {
            this.loading = false
            this.rows = this.normalizeData(data)
            console.log(`data`, data)
        })
        .catch(error => {
            this.error = `Couldn't fetch data :(`
        })
    }
}

</script>

<style lang="scss">
//TODO: add scoped attribute to style
.blocks-table{
    margin: 0 12px 12px 12px;
    table{
        thead{
            th{
                cursor:pointer;
                padding:4px 10px;
            }
        }
    
        tr{
            cursor:pointer;
            &:hover{
                  background-color:#dcdcdc !important;
            }
        }

        tbody{
            td{
                padding: 4px 10px;
                span{
                    font-size:14px;
                }

                a{
                    color:inherit;
                }
            }
        }
    }

    h2{
        font-size:18px;
        margin:0;
        padding:10px;
    }
}

</style>