if (document.getCookie('alarms') is undefined)
	document.arrayOfAlarms = []
else
	document.arrayOfAlarms = document.getCookie('alarms').split(',')

class Alarm
	_iter: 0
	getCount: ->
		@_iter
	getTimestamp: ->
		new Date(document.alarmForm.month.value + ' ' +
		document.alarmForm.day.value + ' ' +
		document.alarmForm.year.value + ' ' +
		document.alarmForm.hour.value + ':' + 
		document.alarmForm.min.value).getTime()
	constructor: (@day, @month, @year, @hour, @min)->
		@_iter++

document.formValidation = ()->
	day = document.alarmForm.day.value
	month = document.alarmForm.month.value
	year = document.alarmForm.year.value
	hour = document.alarmForm.hour.value
	min = document.alarmForm.min.value
	if !(day.length == 2 && month.length == 2 && year.length == 4 && hour.length == 2 && min.length == 2)
		alert "Check values of inputs. Values might be only in format XX/XX/XXXX XX:XX"
		return false

document.setAlarm = ()->
	newAlarm = new Alarm parseInt(document.alarmForm.day.value), 
						parseInt(document.alarmForm.month.value), 
						parseInt(document.alarmForm.year.value), 
						parseInt(document.alarmForm.hour.value),
						parseInt(document.alarmForm.min.value)

	if Date.now() > newAlarm.getTimestamp()
		alert "Check values of inputs. Alarm time will be bigger than current time"
		return false
	else
		if document.getCookie('alarms') is undefined
			document.setCookie 'alarms', newAlarm.getTimestamp() + ','
		else
			document.setCookie 'alarms', document.getCookie('alarms') + newAlarm.getTimestamp() + ','
		return true