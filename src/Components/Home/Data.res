@react.component
let make = () => {

    let user = ApiHooks.useUserData("12")

    <p>{React.string(user.userInfos.firstName)}</p>
}


