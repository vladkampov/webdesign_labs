Backbone.emulateJSON = true

$(document).ready ->
    collection = new barChartCollection
    collection.fetch type: 'POST', success: ()->
        view = new barChartView collection: collection
