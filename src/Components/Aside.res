@react.component
let make = () => {
  <aside className=" hidden xl:block xl:sticky float-left h-screen w-32 bg-black top-0">
    <nav className="flex flex-col justify-between h-72 my-36 text-white font-semibold">
      <a onClick={_ => RescriptReactRouter.push("/")} tabIndex={0} className="cursor-pointer">
        {React.string(`Test`)}
      </a>
      <p>
        {React.string(`Test`)}
      </p>
      <p>
        {React.string(`Test`)}
      </p>
      <p>
        {React.string(`Test`)}
      </p>
    </nav>
  </aside>
}