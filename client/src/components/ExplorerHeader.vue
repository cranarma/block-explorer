<template>
    <div class="header-top-area">
        <router-link to="/">
            <div class="logo-area">
                <h1>Block Explorer</h1>
            </div>
        </router-link>
    </div>
</template>

<style lang="scss">
//TODO: add scoped attribute to style
.header-top-area{

    .logo-area{
        background-color:#305f72;
        padding:10px;
        h1{
            color:white;
            font-size:25px;
            margin:0;
            padding:0;
        }

    }

    a{
        color:white;
    }
}


</style>
