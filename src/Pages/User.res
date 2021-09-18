@react.component
let make = (~id: string) => {
    <main className="mx-auto p-4 max-w-screen-xl flex flex-col gap-4">
        <Navigation />
        <Profile id={id} />
        <Sessions id={id} />
        <Average id={id} />
    </main>
}