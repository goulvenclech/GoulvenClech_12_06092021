/**
 * Placeholder.
 */
@react.component
let make = () => {
  <aside className="hidden xl:sticky xl:block float-left h-screen w-28 bg-black top-0 z-30">
    <nav className="flex flex-col text-white">
      <img src="/aside.svg" className="w-1/2 mx-auto mb-40 my-36" />
      <p className="block writing-vertical rotate-180 mr-11 flex-grow">
        {React.string(`Copyright, SportSee 2020`)}
      </p>
    </nav>
  </aside>
}