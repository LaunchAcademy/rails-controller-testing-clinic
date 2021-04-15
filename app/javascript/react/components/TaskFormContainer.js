import React, { useState } from "react"

const TaskFormContainer = ({ postTask }) => {
  const [taskFieldData, setTaskFieldData] = useState({
    name: "",
    description: ""
  })

  const inputFieldChange = (event) => {
    setTaskFieldData({
      ...taskFieldData,
      [event.currentTarget.name]: event.currentTarget.value
    })
  }

  const submitForm = (event) => {
    event.preventDefault()
    postTask({ task: taskFieldData })
  }

  return(
    <div>
      <h2>Well hey kids! Im a form, and I want to eat TASKS </h2>

      <form onSubmit={submitForm}>
        
        <label> Name: 
          <input type="text" name="name" onChange={inputFieldChange} />
        </label>

        <label> Description
          <input type="text" name="description" onChange={inputFieldChange} />
        </label>

        <input type="submit" />
      </form>
    </div>
  )
}

export default TaskFormContainer
