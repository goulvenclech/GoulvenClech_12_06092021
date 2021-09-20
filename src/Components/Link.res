@react.component
let make = (~name: string, ~linkTo: string) => {
  <a onClick={_ => RescriptReactRouter.push(linkTo)} tabIndex={0}
    className="hover:text-red-400 underline cursor-pointer" > 
    {React.string(name)}
  </a>
}