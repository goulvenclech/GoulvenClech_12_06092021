@react.component
let make = () => {
    <div>
        <h2>
            {React.string("Cliquez sur un utilisateur pour voir ces stats :")}
        </h2>
        <ul>
            <li><Link name="User 12" linkTo="/user/12" /></li>
            <li><Link name="User 18" linkTo="/user/18" /></li>
        </ul>
    </div>
}
