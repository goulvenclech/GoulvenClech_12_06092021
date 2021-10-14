/**
* ApiUserData contain all the types & the decoder of the UserData end point 
* of SportSee's back end.
*/
// types of the data
type userInfos = {
    firstName: string,
    lastName: string,
    age: int
}
type keyData = {
    calorieCount: int,
    proteinCount: int, 
    carbohydrateCount: int,
    lipidCount: int
}
type userData = {
    id: int,
    userInfos: userInfos,
    todayScore: float,
    keyData: keyData,
}
// type of the fetching respond
type respond = {status: string, data: userData}
// an empty respond used as placeholder
let emptyData = {
        id: 0,
        userInfos:{
            firstName: "",
            lastName: "",
            age: 0
        },
        todayScore: 0.1,
        keyData:{
            calorieCount: 0,
            proteinCount: 0, 
            carbohydrateCount: 0,
            lipidCount:0
        }
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
    let keyData = (json) => {
        calorieCount: json |> field("calorieCount", int),
        proteinCount: json |> field("proteinCount", int),
        carbohydrateCount: json |> field("carbohydrateCount", int),
        lipidCount: json |> field("lipidCount", int),
    }
    let userInfos = (json) => {
        firstName: json |> field("firstName", string),
        lastName: json |> field("lastName", string),
        age: json |> field("age", int),
    }
    let userData = (json) => {
        id: json |> field("id", int),
        userInfos: json |> field("userInfos", userInfos),
        todayScore: json |> field("todayScore", float),
        keyData: json |> field("keyData", keyData),
    }
    let respond = (json) => {
        status: `✅`,
        data: json |> field("data", userData),
    }
}