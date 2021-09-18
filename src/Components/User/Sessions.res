@react.component
let make = (~id: string) => {
    let userActivity = ApiHooks.useUserActivity(id)

    let sessionCards = Belt.Array.mapWithIndex(userActivity.sessions, (index, sessions) => {
        <article className="rounded bg-gray-300 p-2 text-sm" key={Belt.Int.toString(index)}> 
            <p>{React.string(`Session: ${sessions.day}`)}</p>
            <p>{React.string(`Kilograms: ${Belt.Int.toString(sessions.kilogram)}`)}</p>
            <p>{React.string(`Calories: ${Belt.Int.toString(sessions.calories)}`)}</p>
        </article>
    })

    <section className="grid grid-cols-3 gap-4">
        {React.array(sessionCards)}       
    </section>
}

