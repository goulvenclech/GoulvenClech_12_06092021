/**
* ApiHooks contain all the custom hooks we can use to call the back end
*/

// the function used by all the hooks to fetch the back end, need an url of an end point & a decoder
let fetchJson = (url, decoder) =>
    Fetch.fetch(url)
        ->Js.Promise.then_(Fetch.Response.json, _)
        ->Js.Promise.then_(obj => obj->decoder->Js.Promise.resolve, _)

// call the the UserData end point of SportSee's back end. Return the data or an error.
let useUserData = (userID: string): ApiUserData.userData => {

    let (result, setResult) = React.useState(_ => ApiUserData.emptyRespond)
    let (error, setError) = React.useState(_ => "Pas d'erreur")

    React.useEffect0(() => {
        let fetchUserData = (userID) => fetchJson(`http://localhost:3000/user/${userID}`, ApiUserData.Decode.respond)
        let _ = fetchUserData(userID)
            ->Js.Promise.then_(data => setResult(_prev => data)->Js.Promise.resolve, _)
        None
    })

    result.data
}

// call the the Activity end point of SportSee's back end. Return the data or an error.
let useUserActivity = (userID: string): ApiUserActivity.userActivity => {

    let (result, setResult) = React.useState(_ => ApiUserActivity.emptyRespond)
    let (error, setError) = React.useState(_ => "Pas d'erreur")

    React.useEffect0(() => {
        let fetchUserData = (userID) => fetchJson(`http://localhost:3000/user/${userID}/activity`, ApiUserActivity.Decode.respond)
        let _ = fetchUserData(userID)
            ->Js.Promise.then_(data => setResult(_prev => data)->Js.Promise.resolve, _)
        None
    })

    result.data
}
