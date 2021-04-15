import React from 'react'

import TasksIndexContainer from "./TasksIndexContainer"

import { BrowserRouter, Route, Switch } from "react-router-dom"

const App = () => {
  return(
    <BrowserRouter>
      <Switch>
        <Route exact path="/tasks" component={TasksIndexContainer}/>
      </Switch>
    </BrowserRouter>
  )
}


export default App
