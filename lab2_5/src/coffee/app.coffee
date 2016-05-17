window.i = 0
window.timeInterval = 1500
window.slides = [document.getElementById('slide1_1'), document.getElementById('slide1_2'), document.getElementById('slide1_3')]

window.saveState = (form)->
    window.timeInterval = form.time.value
    clearInterval window.interval
    window.interval = setInterval window.AutoSlideshow, window.timeInterval

window.AutoSlideshow = ()->
    if window.i is 2
        window.i = 0
    else
        window.i++
    slides[i].click()

window.interval = setInterval window.AutoSlideshow, window.timeInterval

window.checkInput = (e)->
    if not (e.keyCode == 46 or e.keyCode == 8)
        if e.keyCode < 48 or e.keyCode > 57
            e.preventDefault()
            return false