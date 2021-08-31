%%raw("import 'tailwindcss/tailwind.css'")

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
    | list{"article", id} => <Article id />
    | list{} => <Home />
    | _ => <NotFound />
  }
}