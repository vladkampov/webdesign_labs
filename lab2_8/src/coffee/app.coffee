document.collectionOfAlarms = []
if (document.getCookie('alarms') isnt undefined)
	document.getCookie('alarms').split(',').forEach (item, i)->
		tmp = new document.Alarm item
		document.arrayOfAlarms.push tmp

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
	newAlarm = new document.Alarm new Date(parseInt(document.alarmForm.month.value) + ' ' +
								parseInt(document.alarmForm.day.value) + ' ' +
								parseInt(document.alarmForm.year.value) + ' ' +
								parseInt(document.alarmForm.hour.value) + ':' +
								parseInt(document.alarmForm.min.value)).getTime()

new AlarmsView 