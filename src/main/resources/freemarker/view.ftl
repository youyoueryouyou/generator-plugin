<template>
    <base-table ref="baseTable" :setting="setting">
    </base-table>
</template>

<script>
    import baseTable from '@base/base-table';

    export default {
        components: {
            baseTable
        },
        data() {
            return {
                setting: {
                    qryUrl: '${config.moduleName}/${root.modelLowerName}/page',
                    columns: [
                        <#list root.fields as p>
                        <#if p.javaType == 'String'>
                        {key: '${p.javaName}', title: '${p.javaName}', search:'text',form:'text'},
                        <#elseif p.javaType == 'Date'>
                        {key: '${p.javaName}', title: '${p.javaName}', search:'date'},
                        <#else>
                        {key: '${p.javaName}', title: '${p.javaName}', search:'text',form:'text',format:function(row){return row.${p.javaName}}},
                        </#if>
                        </#list>
                    ],
                },
            };
        },
        methods : {

        }
    };
</script>

<style scoped>

</style>