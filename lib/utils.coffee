module.exports =
  isInt: (n) ->
    typeof n is "number" and n % 1 is 0

  getDayName: (date) ->
    days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    days[date.getDay()]

  formatDay: (date) ->
    day = (if (date.getDate() < 10) then "" + "0" + date.getDate() else date.getDate())
    month = (if ((date.getMonth() + 1) < 10) then "" + "0" + (date.getMonth() + 1) else (date.getMonth() + 1))
    year = date.getFullYear()
    "" + year + month + day

  timeToSeconds: (time) ->
    if time instanceof Date
      timeParts = [time.getHours(), time.getMinutes(), time.getSeconds()]
    else
      timeParts = time.split(":")
      return null  unless timeParts.length is 3
    parseInt(timeParts[0], 10) * 60 * 60 + parseInt(timeParts[1], 10) * 60 + parseInt(timeParts[2], 10)

  secondsToTime: (seconds) ->

    #check if seconds are already in HH:MM:SS format
    return seconds  if seconds.match(/\d+:\d+:\d+/)[0]
    hour = Math.floor(seconds / (60 * 60))
    minute = Math.floor((seconds - hour * (60 * 60)) / 60)
    second = seconds - hour * (60 * 60) - minute * 60
    ((if (hour < 10) then "" + "0" + hour else hour)) + ":" + ((if (minute < 10) then "" + "0" + minute else minute)) + ":" + ((if (second < 10) then "" + "0" + second else second))
