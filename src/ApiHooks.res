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

type respond = {
    data: userData
}

let emptyUserData: userData = {
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
}

module Decoder = {
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

let useUserData = (userID: string): userData => {

    let (result, setResult) = React.useState(_ => emptyUserData)

    React.useEffect0(() => {
        let fetchJson = () =>
            Fetch.fetch(`http://localhost:3000/user/${userID}`)
                ->Js.Promise.then_(Fetch.Response.json, _)
                ->Js.Promise.then_(obj => obj->Decoder.respond->Js.Promise.resolve, _)

        let _ = fetchJson()
            ->Js.Promise.then_(data => setResult(_prev => data.data)->Js.Promise.resolve, _)

        None
    })

    result
}