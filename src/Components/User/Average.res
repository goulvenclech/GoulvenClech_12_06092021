@react.component
let make = (~id: string) => {
    let userAverage = ApiHooks.useUserAverageSessions(id)

    let sessionCards = Belt.Array.mapWithIndex(userAverage.sessions, (index, sessions) => {
        <article className="rounded bg-gray-400 p-2 text-sm" key={Belt.Int.toString(index)}> 
            <p>{React.string(`Session: ${Belt.Int.toString(sessions.day)}`)}</p>
            <p>{React.string(`Longeur: ${Belt.Int.toString(sessions.sessionLength)}`)}</p>
        </article>
    })

    <section className="grid grid-cols-3 gap-4">
        {React.array(sessionCards)}       
    </section>
}