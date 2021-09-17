%%raw("import 'tailwindcss/tailwind.css'")

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
    | list{"user", id} => <User key={id} id />
    | list{} => <Home />
    | _ => <NotFound />
  }
}