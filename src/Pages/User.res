/**
 * User page template, fetching the back end and displaying all the user's data with charts.
*/
@react.component
let make = (~id: string) => {
  // fetch userData
  let userDataApi = ApiHooks.useUserData(id)
  let userData = userDataApi.data
  // fetch userSessions
  let userSessionsApi = ApiHooks.useUserAverageSessions(id)
  let userSessions = Belt.Array.map(userSessionsApi.data.sessions, day => {day.sessionLength})
  // fetch userPerformance
  let userPerformancesApi = ApiHooks.useUserPerformance(id)
  let userPerformances = Belt.Array.map(userPerformancesApi.data.data, perf => {perf.value})
  // fetch userActivity
  let userActivityApi = ApiHooks.useUserActivity(id)
  let userWeights = Belt.Array.map(userActivityApi.data.sessions, session => {session.kilogram})
  let userCalories = Belt.Array.map(userActivityApi.data.sessions, session => {session.calories})

  <>
    <Header /> 
    <Aside />
      { // if our fetch failed, display an error
        userDataApi.status !== `✅` || userSessionsApi.status !== `✅` || userPerformancesApi.status !== `✅` || userActivityApi.status !== `✅` ? 
        <Error 
          userData={userDataApi.status} 
          userSessions={userSessionsApi.status} 
          userPerformances={userPerformancesApi.status} 
          userActivity={userActivityApi.status} 
         /> : <></> }
      <main className="mx-auto max-w-screen-xl flex flex-col gap-4">
        <Welcome user={userData.userInfos.firstName} />
        <div className="flex flex-wrap xl:flex-nowrap gap-4 xl:gap-0">
          <div className="flex flex-col gap-4">
            <GraphActivity userWeights={userWeights} userCalories={userCalories} />
            <div className="flex gap-4 mx-4">
              <GraphSessions sessions={userSessions} />
              <GraphPerformances performances={userPerformances} />
              <GraphScore todayScore={userData.todayScore} />
            </div>
          </div>
        <UserData 
          calorieCount={userData.keyData.calorieCount} 
          proteinCount={userData.keyData.proteinCount} 
          carbohydrateCount={userData.keyData.carbohydrateCount} 
          lipidCount={userData.keyData.lipidCount} 
        />
        </div>
        <Footer />
      </main>
  </>
}
