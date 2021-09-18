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
type respond = {
    data: userData
}
// an empty respond used as placeholder
let emptyRespond: respond = {data:{
    id: 0,
    userInfos:{
        firstName: "",
        lastName: "",
        age: 0},
    todayScore: 0.1,
    keyData:{
        calorieCount: 0,
        proteinCount: 0, 
        carbohydrateCount: 0,
        lipidCount:0}
}}
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
        data: json |> field("data", userData),
    }
}