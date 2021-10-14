/**
 * ApiHooks contain all the custom hooks we can use to call the back end
 */

// the function used by all the hooks to fetch the back end, need an url of an end point & a decoder
let fetchJson = (url, decoder, errorRespond) =>
  Fetch.fetch(url)
  ->Js.Promise.then_(Fetch.Response.json, _)
  ->Js.Promise.then_(obj => obj->decoder->Js.Promise.resolve, _)
  ->Js.Promise.catch(err => {
      Js.log2("Failure!!", err)
      let test = errorRespond(err)
      Js.Promise.resolve(test)
    }, _)
// call the the UserData end point of SportSee's back end. Return the data or an error.
let useUserData = (userID: string): ApiUserData.respond => {
  let (result, setResult) = React.useState(_ => ApiUserData.emptyRespond)

  React.useEffect0(() => {
    let fetchUserData = userID => fetchJson(`../user/${userID}.json`, ApiUserData.Decode.respond, ApiUserData.errorHandler)
    let _ =
      fetchUserData(userID)->Js.Promise.then_(
        data => setResult(_prev => data)->Js.Promise.resolve,
        _,
      )
    None
  })

  result  
}

// call the the Activity end point of SportSee's back end. Return the data or an error.
let useUserActivity = (userID: string): ApiUserActivity.respond => {
  let (result, setResult) = React.useState(_ => ApiUserActivity.emptyRespond)

  React.useEffect0(() => {
    let fetchUserData = userID =>
      fetchJson(`../user/${userID}/activity.json`, ApiUserActivity.Decode.respond, ApiUserActivity.errorHandler)
    let _ =
      fetchUserData(userID)->Js.Promise.then_(
        data => setResult(_prev => data)->Js.Promise.resolve,
        _,
      )
    None
  })

  result
}

// call the the Average Sessions end point of SportSee's back end. Return the data or an error.
let useUserAverageSessions = (userID: string): ApiUserAverageSessions.respond => {
  let (result, setResult) = React.useState(_ => ApiUserAverageSessions.emptyRespond)

  React.useEffect0(() => {
    let fetchUserData = userID =>
      fetchJson(`../user/${userID}/average-sessions.json`, ApiUserAverageSessions.Decode.respond, ApiUserAverageSessions.errorHandler)
    let _ =
      fetchUserData(userID)->Js.Promise.then_(
        data => setResult(_prev => data)->Js.Promise.resolve,
        _,
      )
    None
  })

  result
}

// call the the Performance end point of SportSee's back end. Return the data or an error.
let useUserPerformance = (userID: string): ApiUserPerformance.respond => {
  let (result, setResult) = React.useState(_ => ApiUserPerformance.emptyRespond)

  React.useEffect0(() => {
    let fetchUserData = userID =>
      fetchJson(`../user/${userID}/performance.json`, ApiUserPerformance.Decode.respond, ApiUserPerformance.errorHandler)
    let _ =
      fetchUserData(userID)->Js.Promise.then_(
        data => setResult(_prev => data)->Js.Promise.resolve,
        _,
      )
    None
  })

  result
}
