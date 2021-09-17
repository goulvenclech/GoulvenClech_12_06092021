type catData = {file: string};

module Decode = {
  open Json.Decode
  let catData = (data: Js.Json.t) => {
    file: field("file", string, data),
  }
}

let useUserImage = (): string => {

    let (result, setResult) = React.useState(_ => "https://lh3.googleusercontent.com/proxy/usXOb9ToLP7Dn3PIB78Zoi4gkjLJZXPxpYGm_ggViOe_Dx3PyT1slNtAEDWXU2xHYAc8h2d86tOJdGacD8Wue1CPlspQ3MmB695bFPn2nztXx7XPJnby2onhKLEhZiBw1IM")

    React.useEffect0(() => {
        let fetchJson = (url, decoder) =>
            Fetch.fetch(url)
                ->Js.Promise.then_(Fetch.Response.json, _)
                ->Js.Promise.then_(obj => obj->decoder->Js.Promise.resolve, _)

        let fetchCat = () => fetchJson("https://aws.random.cat/meow", Decode.catData)

        let _ = fetchCat()
            ->Js.Promise.then_(data => setResult(_prev => data.file)->Js.Promise.resolve, _)

        None
    })

    result
}


/**

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

*/