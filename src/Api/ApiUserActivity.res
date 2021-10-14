/**
* ApiUserActivity contain all the types & the decoder of the activity end point 
* of SportSee's back end.
*/

// types of the data
type userSession = {
    day: string,
    kilogram: int,
    calories: int
}
type userActivity = {
    userId: int,
    sessions: array<userSession>,
}
// type of the fetching respond
type respond = {status: string, data: userActivity}
// an empty respond used as placeholder
let emptyData = {
    userId: 0,
    sessions:[{day: "2001-01-01", kilogram: 0, calories: 0}]
}
let emptyRespond: respond = {
    status: `✅`,
    data: emptyData
}
// let's handle API errors
let errorHandler = (err: Js.Promise.error): respond => {
    switch err {
    | exception error => {
        let optError: option<Js.Exn.t> = Js.Exn.asJsExn(error)
        switch optError {
        | Some(error) => {
                switch Js.Exn.name(error) {
                | Some(errorNum) => 
                    switch Js.Exn.message(error) {
                    | Some(errorMessage) => {{status: `⛔ ${errorNum} : ${errorMessage}`,data:emptyData}}
                    | None => {{status: `⛔ ${errorNum} : no error message`,data:emptyData}}
                    }
                | None => {{status: `🤒 invalid error`,data:emptyData}}
                }
            }
        | None => {{status: `⚠️ Not a Js.Exn.t`,data:emptyData}}
        }}
    | _ => {{status: `⚠️ Not an exn`,data:emptyData}}
    }
}
// a decoder to transform the JSON respond into a proper ReScript record
module Decode = {
    open Json.Decode
    let userSession = (json) => {
        day: json |> field("day", string),
        kilogram: json |> field("kilogram", int),
        calories: json |> field("calories", int),
    }
    let userActivity = (json) => {
        userId: json |> field("userId", int),
        sessions: json |> field("sessions", array(userSession))
    }
    let respond = (json) => {
        status: `✅`,
        data: json |> field("data", userActivity),
    }
}