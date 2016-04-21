window.onload = ()->
    numbersElements = document.getElementsByClassName 'num'
    actionElements = document.getElementsByClassName 'act'
    resultElement = document.getElementById 'result'
    dotElement = document.getElementById 'dot'
    buffer = "0"
    actionFlag = false
    dotFlag = false
    
    dotElement.onclick = ()->
        if !dotFlag
            dotFlag = true
            resultElement.value += '.'

    for i in [0..numbersElements.length - 1]
        numbersElements[i].onclick = ()->
            newValue = parseInt @.getAttribute('id').match /\d/g

            if resultElement.value is "0"
                resultElement.value = newValue
            else
                if actionFlag
                    buffer = resultElement.value
                    if resultElement.value is "0"
                        resultElement.value = newValue
                    else
                        resultElement.value += newValue
                else
                    resultElement.value += newValue

    for i in [0..actionElements.length - 1]
        actionElements[i].onclick = ()->
            console.log buffer, actionFlag
            dotFlag = false
            buffer = resultElement.value
            currentId = @.getAttribute 'id'
            if actionFlag 
                switch currentId
                    when "actPlus" then resultElement.value = parseFloat(buffer) + parseFloat(resultElement.value)
                        # console.log parseFloat(buffer) + parseFloat(resultElement.value)
                    else console.log "else"
            else
                resultElement.value = "0"
                actionFlag = true

            console.log buffer, actionFlag
    return 
