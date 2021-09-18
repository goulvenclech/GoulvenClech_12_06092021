/**
* ApiUserAverageSessions contain all the types & the decoder of the average sessions end point 
* of SportSee's back end.
*/

// types of the data
type userSession = {
    day: int,
    sessionLength: int,
}
type userActivity = {
    userId: int,
    sessions: array<userSession>,
}
// type of the fetching respond
type respond = {
    data: userActivity
}
// an empty respond used as placeholder
let emptyRespond: respond = {data:{
    userId: 0,
    sessions:[
        {day: 1, sessionLength: 0}
    ]
}}
// a decoder to transform the JSON respond into a proper ReScript record
module Decode = {
    open Json.Decode
    let userSession = (json) => {
        day: json |> field("day", int),
        sessionLength: json |> field("sessionLength", int),
    }
    let userActivity = (json) => {
        userId: json |> field("userId", int),
        sessions: json |> field("sessions", array(userSession))
    }
    let respond = (json) => {
        data: json |> field("data", userActivity),
    }
}