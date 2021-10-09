@react.component
let make = () => {
  <nav className="flex px-16 py-2 items-center justify-between font-semibold text-xl text-white bg-black">
      <img src="./logo.png" className="h-12">
      </img>
      <p>
        {React.string(`Accueil`)}
      </p>
      <p>
        {React.string(`Profil`)}
      </p>
      <p>
        {React.string(`Réglage`)}
      </p>
      <p>
        {React.string(`Communauté`)}
      </p>
  </nav>
}