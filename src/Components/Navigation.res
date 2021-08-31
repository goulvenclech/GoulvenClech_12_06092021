@react.component
let make = () => {
  <nav className="py-4 flex gap-4">
      <Link name="Accueil" linkTo="/" />
      <Link name="Article 12" linkTo="/article/12" />
      <Link name="Article 26" linkTo="/article/26" />
      <Link name="Erreur" linkTo="/adad" />
  </nav>
}