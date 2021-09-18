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
    data: userPerformance
}
// an empty respond used as placeholder
let emptyRespond: respond = {data:{
    userId:0,
    kind:{
        "1": "cardio",
        "2": "energy",
        "3": "endurance",
        "4": "strength",
        "5": "speed",
        "6": "intensity",
    },
    data:[{
        value:0,
        kind:1
    }]
}}
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
        data: json |> field("data", userPerformance),
    }
}