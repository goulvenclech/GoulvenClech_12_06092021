@react.component
let make = (~id: string) => {
  // fetch userData
  let userData = ApiHooks.useUserData(id)
  // fetch userSessions
  let apiResult = ApiHooks.useUserAverageSessions(id)
  let userSessions = Belt.Array.map(apiResult.sessions, day => {day.sessionLength})
  // fetch userPerformance
  let apiResult = ApiHooks.useUserPerformance(id)
  let userPerformances = Belt.Array.map(apiResult.data, perf => {perf.value})
  // fetch userActivity
  let userActivity = ApiHooks.useUserActivity(id)
  let userWeights = Belt.Array.map(userActivity.sessions, session => {session.kilogram})
  let userCalories = Belt.Array.map(userActivity.sessions, session => {session.calories})

  <>
    <Navigation /> 
    <Aside />
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
