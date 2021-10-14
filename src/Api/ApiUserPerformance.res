/**
* ApiUserPerformancecontain all the types & the decoder of the user performance sessions end point 
* of SportSee's back end.
*/

// types of the data
type performanceKind = {
    "1": string,
    "2": string,
    "3": string,
    "4": string,
    "5": string,
    "6": string,
}
type performanceData = {
    value: int,
    kind: int,
}
type userPerformance = {
    userId: int,
    kind: performanceKind,
    data: array<performanceData>,
}
// type of the fetching respond
type respond = {
    status: string,
    data: userPerformance
}
// an empty respond used as placeholder
let emptyData = {
        userId:0,
        kind:{
            "1": "cardio",
            "2": "energy",
            "3": "endurance",
            "4": "strength",
            "5": "speed",
            "6": "intensity",
        },
        data:[]
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
    let performanceKind = (json) => {
        "1": json |> field("1", string),
        "2": json |> field("2", string),
        "3": json |> field("3", string),
        "4": json |> field("4", string),
        "5": json |> field("5", string),
        "6": json |> field("6", string),
    }
    let performanceData = (json) => {
        value: json |> field("value", int),
        kind: json |> field("kind", int)
    }
    let userPerformance = (json) => {
        userId: json |> field("userId", int),
        kind: json |> field("kind", performanceKind),
        data: json |> field("data", array(performanceData))
    }
    let respond = (json) => {
        status: `✅`,
        data: json |> field("data", userPerformance),
    }
}