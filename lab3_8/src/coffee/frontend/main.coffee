Backbone.emulateJSON = true

$('form').on 'submit', (e)->
    e.preventDefault()
    $.post @action, {title: @title.value, value: @val.value}
    collection.fetch type: 'POST', reset: true

$(document).ready ->
    window.collection = new barChartCollection
    collection.fetch type: 'POST', success: ()->
        view = new barChartView collection: collection
