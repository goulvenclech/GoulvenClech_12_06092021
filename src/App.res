// Import JS dependencies
%%raw("import 'tailwindcss/tailwind.css'")
/**
 * Router logic of our React app.
 */
@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
    | list{"user", id} => <User key={id} id />
    | list{} => <Home />
    | _ => <NotFound />
  }
}