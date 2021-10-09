@react.component
let make = () => {
    <div className="py-8 mx-4 w-2/3">
        <p>{React.string(`
            Projet 12 de la formation OpenClassrooms, réalisation d'un tableau de bord avec React et D3.js. Navigation rapide en bas à droite de votre écran. Cliquez sur l'id d'un utilisateur pour voir ses données :
        `)}</p>
        <ul>
            <li><Link name="User 12" linkTo="/user/12" /></li>
            <li><Link name="User 18" linkTo="/user/18" /></li>
        </ul>
    </div>
}
