@react.component
let make = () => {
    let emptyData = {"data":{
        "id": 0,
        "userInfos":{
            "firstName": "",
            "lastName": "",
            "age": 0},
        "todayScore": 0.1,
        "keyData":{
            "calorieCount": 0,
            "proteinCount": 0, 
            "carbohydrateCount": 0,
            "lipidCount":0}
        }
    }
    let (data, setData) = React.useState(_ => emptyData)
    let _ =
    Fetch.fetch("http://localhost:3000/user/12")
    ->Js.Promise.then_(Fetch.Response.json, _)
    ->Js.Promise.then_(json => Js.log(json)->Js.Promise.resolve, _)

    <p className="text-red-500"> {React.string("Bonjour")} </p>
}

type data = {"data":{
    "id": int,
    "userInfos":{
        "firstName": string,
        "lastName": string,
        "age": int
        },
    "todayScore": float,
    "keyData":{
        "calorieCount": int,
        "proteinCount": int, 
        "carbohydrateCount": int,
        "lipidCount": int
        }
    }
}
