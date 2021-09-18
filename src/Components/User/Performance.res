@react.component
let make = (~id: string) => {
    
    let userPerformance = ApiHooks.useUserPerformance(id)

    let kind = ["cardio", "energy", "endurance", "strength", "speed", "intensity"]

    let perfCards = Belt.Array.mapWithIndex(userPerformance.data, (index, perf) => {
        <article className="text-sm" key={Belt.Int.toString(index)}> 
            <p>{React.string(`${kind[perf.kind-1]} : ${Belt.Int.toString(perf.value)}`)}</p>
        </article>
    })

    <aside className="grid grid-cols-3 gap-2 ml-auto text-center">
        {React.array(perfCards)}    
    </aside>
}