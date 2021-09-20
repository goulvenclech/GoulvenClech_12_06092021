@react.component
let make = () => {
    <p>
        {React.string(`Merci de cloner et exécuter ce `)}
        <a href="" className="underline hover:text-red-400">
            {React.string(`back end`)}
        </a>
        {React.string(` pour que l'application fonctionne correctement. Malheuresement, il y a actuellement une 
        erreur à corriger, vous pouvez lire ma `)}
        <a href="" className="underline hover:text-red-400">
            {React.string(`pull request`)}
        </a>
        {React.string(` sur le sujet ou attendre que j'intégre directement
        les données à cette application.`)}
    </p>
}
