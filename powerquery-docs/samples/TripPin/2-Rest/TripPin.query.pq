// Use this file to write queries to test your data connector
let
    result = TripPin.Feed("https://services.odata.org/v4/TripPinService/Me")
in
    result