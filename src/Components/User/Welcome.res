@react.component
let make = (~id: string) => {
    let user = ApiHooks.useUserData(id)

    <section className="py-8 mx-4">
        <h2 className="text-5xl font-bold w-full leading-relaxed"> 
            {React.string(`Bonjour `)}
            <span className="text-red-600">
            {React.string(`${user.userInfos.firstName}`)}
            </span>
        </h2>
        <p>
            {React.string(`Félicitation ! Vous avez explosé vos objectifs hier 👏`)}
        </p>
    </section>
}