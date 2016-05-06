class window.barChartView extends Backbone.View
	el: "#view"
	template: _.template '<div style="width: <%=value %>%"><%=title %> <span><%=value %>%</span></div>'

	render: ()->
		console.log @model

	initialize: ()->
        @render()

    render: ()->
    	@$el.empty()
    	@collection.models.map (model)=>
    		@$el.append(@template value: model.get('value'), title: model.get('title'))
    	return @