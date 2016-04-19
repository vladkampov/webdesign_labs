document.AlarmView = class AlarmsView 
	el: 'alarmsExist'
	collection: document.collectionOfAlarms
	constructor: ()->
		self = @
		@collection.forEach (el, i)->
			div = document.createElement('div');
			div.className = 'alarm bg-success col-sm-3';
			div.setAttribute 'id', 'alarm_' + i
			div.innerHTML = 'This alarm for <strong>' + Date(el.timestamp) + '</strong> <a href="#" class="btn btn-danger">delete</a>';
			document.getElementById(self.el).appendChild(div)