@react.component
let make = () => {
  <header className="flex px-16 py-2 items-center justify-between font-semibold text-xl text-white bg-black">
      <a onClick={_ => RescriptReactRouter.push("/")} tabIndex={0} className="cursor-pointer"> 
              <img src="/logo.png" className="h-12" />
      </a>
      <a onClick={_ => RescriptReactRouter.push("/")} tabIndex={0} className="cursor-pointer">
        {React.string(`Accueil`)}
      </a>
      <p>
        {React.string(`Profil`)}
      </p>
      <p>
        {React.string(`Réglage`)}
      </p>
      <p>
        {React.string(`Communauté`)}
      </p>
  </header>
}