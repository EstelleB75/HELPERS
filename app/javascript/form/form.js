// Poser un micro sur le clic
/* const hideAllQuestions = () => {
  const hide = document.querySelectorAll(".question")
  hide.forEach((question) => {
    question.classList.add("hidden")
  }) 
}

const displayQuestion = (idQuestion) => {
  hideAllQuestions()
  const question = document.querySelector(`.question[data-question='${idQuestion}'`)
  question.classList.remove("hidden")
}

const back = () => {
  const container = document.querySelector("#question-container")
  const history =  JSON.parse(container.dataset.questions)
  const questionId = history.pop()
  container.dataset.questions = JSON.stringify(history)
  console.log(questionId)
  displayQuestion(history[history.length - 1])
}

const handleForm = () => {
  const buttons = document.querySelectorAll(".btn-question")
  buttons.forEach((button) => {
    button.addEventListener("click", (event) => {
      const questionNumber = event.target.dataset.target
      console.log(event.target.dataset.id)
      const container = document.querySelector("#question-container")
      const history =  JSON.parse(container.dataset.questions)
      history.push(questionNumber)
      console.log(questionNumber)
      container.dataset.questions = JSON.stringify(history)
      displayQuestion(questionNumber)
    })
  })
  
  const backButtons = document.querySelectorAll(".btn-back")
  backButtons.forEach((button) => {
    button.addEventListener("click", (event) => {
      back()
    })
  })
}
export {handleForm} */
// Enelever la classe "hidden" de la question 
