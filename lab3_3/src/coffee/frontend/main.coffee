$(document).ready ->
    $.post '/filesystem', null, (data)->
        tree = new TreeModel()
        root = tree.parse data
        console.log root
        $('#tree').append root