import React, { useState, useEffect } from "react"

import TaskFormContainer from "./TaskFormContainer.js"

const TasksIndexContainer = (props) => {
  const [tasks, setTasks] = useState([])

  const fetchTasks = async () => {
    const response = await fetch("/api/v1/tasks")
    const parsedTasks = await response.json()
    setTasks(parsedTasks)
  }

  useEffect(() => {
    fetchTasks()
  }, [])

  const postTask = async (taskFieldData) => {
    const response = await fetch("/api/v1/tasks", {
      method: "POST",
      body: JSON.stringify(taskFieldData),
      credentials: "same-origin",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    })

    const persistedTask = await response.json()
    setTasks([...tasks, persistedTask])
  }

  const tasktiles = tasks.map((task) => {
    return(
      <li key={task.id}>
        {task.name}
      </li>
    )
  })

  return(
    <div>
      <TaskFormContainer postTask={postTask}/>

      <h3> Task Index Container </h3>
      {tasktiles}
    </div>
  )
}

export default TasksIndexContainer
