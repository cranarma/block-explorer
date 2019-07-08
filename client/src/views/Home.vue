<template>
  <div class="home">
    <explorer-header/>
    <blocks-table/>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import BlocksTable from '@/components/BlocksTable.vue'; // @ is an alias to /src
import ExplorerHeader from '@/components/ExplorerHeader.vue'; // @ is an alias to /src

@Component({
  components: {
    ExplorerHeader,
    BlocksTable,
  },
})
export default class Home extends Vue {}
</script>
