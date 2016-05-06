switchesForActions = (actionName, resultElement, buffer, activeAction)->
    switch activeAction
        when "actPlus" then resultElement.value = parseFloat(buffer) + parseFloat(resultElement.value)
        when "actMinus" then resultElement.value = parseFloat(buffer) - parseFloat(resultElement.value)
        when "actMultiply" then resultElement.value = parseFloat(buffer) * parseFloat(resultElement.value)
        when "actDivision" then resultElement.value = parseFloat(buffer) / parseFloat(resultElement.value)
        when "actDegree" then resultElement.value = Math.pow(parseFloat(buffer), parseFloat(resultElement.value))
        else null
    return

window.onload = ()->
    numbersElements = document.getElementsByClassName 'num'
    actionElements = document.getElementsByClassName 'act'
    resultElement = document.getElementById 'result'
    dotElement = document.getElementById 'dot'
    clearElement = document.getElementById 'clear'
    sqrElement = document.getElementById 'sqr'
    equalElement = document.getElementById 'equal'

    buffer = "0"
    actionFlag = false
    dotFlag = false
    resultFlag = false
    activeAction = null

    clearElement.onclick = ()->
        buffer = "0"
        actionFlag = false
        dotFlag = false
        resultFlag = false
        resultElement.value = 0
        activeAction = null

    dotElement.onclick = ()->
        if !dotFlag
            dotFlag = true
            resultElement.value += '.'

    sqrElement.onclick = ()->
        resultElement.value = Math.pow parseFloat(resultElement.value), 2

    for i in [0..numbersElements.length - 1]
        numbersElements[i].onclick = ()->
            newValue = parseInt @.getAttribute('id').match /\d/g

            if resultElement.value is "0"
                resultElement.value = newValue
            else
                if resultFlag
                    resultElement.value = newValue
                    resultFlag = false
                else 
                    resultElement.value += newValue

    for i in [0..actionElements.length - 1]
        actionElements[i].onclick = ()->
            id = @.getAttribute('id')

            if actionFlag 
                switchesForActions id, resultElement, buffer, activeAction
                buffer = resultElement.value
                resultFlag = true
            else
                buffer = resultElement.value
                resultElement.value = 0

            activeAction = id
            actionFlag = true



    equalElement.onclick = ()->
        switchesForActions activeAction, resultElement, buffer, activeAction
        if activeAction isnt null
            actionFlag = false
            resultFlag = true
    return 
