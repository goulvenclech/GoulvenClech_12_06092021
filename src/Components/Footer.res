@react.component
let make = () => {
  <nav className="absolute flex right-0 bottom-0 gap-4 p-2 opacity-50">
      <Link name="Accueil" linkTo="/" />
      <Link name="User 12" linkTo="/user/12" />
      <Link name="User 18" linkTo="/user/18" />
      <Link name="Erreur" linkTo="/adad" />
  </nav>
}