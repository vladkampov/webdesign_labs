$(document).ready ->
    $.post '/filesystem', null, (data)->
        $('#tree').tree data: data, autoOpen: true, onCreateLi: (node, $li)->
            filelink = node.path[0].split('/lab3_3')[1]
            $li.find('.jqtree-toggler').addClass 'btn'
            $li.find('.jqtree-element').addClass 'clearfix'
            $li.find('.jqtree-element span').attr 'data-path': filelink
            link = $('<a>', {
                class: 'show_link btn btn-info pull-right',
                'data-link': filelink,
                href: '#'
            }).text 'show'
            $li.find('.jqtree-element span').after link

        $('.show_link').click (e)->
            e.preventDefault()
            $this = $(@)
            $.post '/showfile', {link: $this.attr 'data-link'}, (data)->
                $('#view').html data
