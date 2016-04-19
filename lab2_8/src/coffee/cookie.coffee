document.getCookie = (name)->
  matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ))
  if matches 
    return decodeURIComponent(matches[1]) 
  else
    return undefined;

document.setCookie = (name, value, options)->
  options = options || {}
  expires = options.expires

  if typeof expires == "number" && expires
    d = new Date()
    d.setTime(d.getTime() + expires * 1000)
    expires = options.expires = d

  if (expires && expires.toUTCString) 
    options.expires = expires.toUTCString()
  
  value = encodeURIComponent(value);
  updatedCookie = name + "=" + value
  for propName in options
    updatedCookie += "; " + propName
    propValue = options[propName]
    if (propValue isnt true) 
      updatedCookie += "=" + propValue
    
  
  document.cookie = updatedCookie;

document.deleteCookie = (name)->
  setCookie name, "", 
    expires: -1
