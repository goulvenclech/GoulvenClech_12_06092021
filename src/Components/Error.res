/**
 * Placeholder navigation.
 */
@react.component
let make = (~userData: string, ~userSessions: string, ~userPerformances: string, ~userActivity: string) => {
    <div className="absolute mx-auto block h-screen w-full bg-black bg-opacity-75 z-10">
        <div className="mx-auto bg-white w-96 p-4 my-56 rounded-lg">
            <p className="pr-1 text-lg font-bold pt-1">
                {React.string(`Nos services ont rencontré un problème`)}
            </p>
            <ul className="text-gray-800 pl-3 list-disc my-3">
                <li>{React.string(`userData : `)}<span className="font-normal">{React.string(userData)}</span></li>
                <li>{React.string(`userActivity : `)}<span className="font-normal">{React.string(userActivity)}</span></li>
                <li>{React.string(`userPerformances : `)}<span className="font-normal">{React.string(userPerformances)}</span></li>
                <li>{React.string(`userSessions : `)}<span className="font-normal">{React.string(userSessions)}</span></li>
            </ul>
            <a onClick={_ => RescriptReactRouter.push("/")} tabIndex={0} className="cursor-pointer underline hover:text-red-600">
                {React.string(`Revenir à l'accueil`)}
            </a>
        </div>
    </div>
}