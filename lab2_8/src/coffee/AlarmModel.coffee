document.Alarm = class Alarm
	getTimestamp: ->
		@timestamp
	constructor: (@timestamp)->
		if Date.now() > @getTimestamp()
			alert "Check values of inputs. Alarm time will be bigger than current time"
		else 
			if !isNaN(@getTimestamp())
				if document.cookie.indexOf(@getTimestamp()) is -1
					if document.getCookie('alarms') is undefined or document.getCookie('alarms') is ''
						document.setCookie 'alarms', @getTimestamp()
					else
						document.setCookie 'alarms', document.getCookie('alarms') + ',' + @getTimestamp()
