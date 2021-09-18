@react.component
let make = () => {
  <nav className="flex gap-4">
      <Link name="Accueil" linkTo="/" />
      <Link name="User 12" linkTo="/user/12" />
      <Link name="User 18" linkTo="/user/18" />
      <Link name="Erreur" linkTo="/adad" />
  </nav>
}