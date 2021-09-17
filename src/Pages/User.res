@react.component
let make = (~id: string) => {
  let user = ApiHooks.useUserData(id)

  <main className="mx-auto p-4 max-w-screen-xl">
    <Navigation />
    <h1 className="font-bold"> 
      {React.string(`${user.userInfos.firstName} ${user.userInfos.lastName}`)} 
    </h1>
    <p>{React.string(`Age: ${Belt.Int.toString(user.userInfos.age)} ans`)}</p>
    <p>{React.string(`Score: ${Belt.Float.toString(user.todayScore)}`)}</p>
    <p>{React.string(`Calories: ${Belt.Int.toString(user.keyData.calorieCount)}`)}</p>
  </main>
}