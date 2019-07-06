import Vue from "vue"
import HeaderComponent from './components/Header.vue'
import BlocksTable from './components/BlocksTable.vue'
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
