document.collectionOfAlarms = class AlarmsCollection
	updateCollection: ()->
		self = @
		self.models = []
		if (document.getCookie('alarms') isnt undefined and document.getCookie('alarms') isnt "")
			document.getCookie('alarms').split(',').forEach (item, i)->
				tmp = new document.Alarm item
				self.models.push tmp

	constructor: (@models)->
		@models = []
		@updateCollection()
