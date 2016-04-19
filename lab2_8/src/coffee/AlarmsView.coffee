document.AlarmsView = class AlarmsView 
	el: 'alarmsExist'
	deleteButtonsClass: 'deleteAlarm'
	form: document.alarmForm

	updateView: ()->
		node = document.getElementById(@el)
		while node.hasChildNodes()
			node.removeChild node.firstChild
		self = @
		@collection.models.forEach (el, i)->
			date = new Date()
			date.setTime(el.timestamp)
			date.getTime()
			if date > Date.now()
				div = document.createElement('div');
				div.className = 'alarm panel col-sm-3';
				div.setAttribute 'id', 'alarm_' + i
				div.innerHTML = 'This alarm for <strong>' + date + '</strong> <a href="#" class="deleteAlarm btn btn-danger" >X</a>';
				div.onclick = ()->
					self.removeAlarm(i)
				node.appendChild(div)

				setTimeout () -> 
					alert "ALARM!"
				, date - Date.now()
			else
				self.removeAlarm(i)

	removeAlarm: (i)->
		regular = new RegExp('\\D?' + @collection.models[i].timestamp + '\\D?', 'g')
		cookie = document.getCookie('alarms').replace(regular, '')
		document.setCookie 'alarms', cookie
		@collection.updateCollection()
		@updateView()

	setAlarm: ()->
		newAlarm = new document.Alarm new Date(parseInt(@form.month.value) + ' ' + parseInt(@form.day.value) + ' ' + parseInt(@form.year.value) + ' ' + parseInt(@form.hour.value) + ':' + parseInt(@form.min.value)).getTime()
		@collection.updateCollection()
		@updateView()

	formValidation: ()->
		day = @form.day.value
		month = @form.month.value
		year = @form.year.value
		hour = @form.hour.value
		min = @form.min.value
		if !(day.length == 2 && month.length == 2 && year.length == 4 && hour.length == 2 && min.length == 2)
			alert "Check values of inputs. Values might be only in format XX/XX/XXXX XX:XX"
		else
			@setAlarm()
		return false

	constructor: (@collection)->
		self = @
		@updateView()

		@form.onsubmit = ()-> 
			self.formValidation()

		alarms = document.getElementsByClassName('deleteAlarm')
