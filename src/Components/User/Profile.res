@react.component
let make = (~id: string) => {
    let user = ApiHooks.useUserData(id)

    <section className=" rounded bg-gray-200 p-2">
        <div className="flex gap-4">
            <div className="w-1/2">
                <h1 className="font-bold w-full"> 
                    {React.string(`${user.userInfos.firstName} ${user.userInfos.lastName}`)} 
                </h1>
                <div className="flex gap-4">
                    <p>{React.string(`Age: ${Belt.Int.toString(user.userInfos.age)} ans`)}</p>
                    <p>{React.string(`Score: ${Belt.Float.toString(user.todayScore)}`)}</p>
                    <p>{React.string(`Calories: ${Belt.Int.toString(user.keyData.calorieCount)}`)}</p>
                </div>
            </div>
            <Performance id={id} />
        </div>
    </section>
}