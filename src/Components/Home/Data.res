@react.component
let make = () => {

    let image = ApiHooks.useUserImage()

    <img src={image} />
}


