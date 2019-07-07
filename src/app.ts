import Vue from "vue"
import HeaderComponent from './components/Header.vue'
import BlocksTable from './components/BlocksTable.vue'
// const VueGoodTable = require('vue-good-table')
//@ts-ignore
import VueGoodTablePlugin from 'vue-good-table';
 
// import the styles 
import 'vue-good-table/dist/vue-good-table.css'
 
Vue.use(VueGoodTablePlugin)
// import HelloDecoratorComponent from "./components/HelloDecorator.vue"

let v = new Vue({
    el: "#app",
    template: `
    <div>
        <header-component/>
        <blocks-table/>
    </div>
    `,
    data: { name: "World" },
    components: {
        HeaderComponent,
        BlocksTable,
        // HelloDecoratorComponent
    }
})
