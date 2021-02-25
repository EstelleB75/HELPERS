// Poser un micro sur le clic
const hideAllQuestions = () => {
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
const handleForm = () => {
  const buttons = document.querySelectorAll("button")
  buttons.forEach((button) => {
    button.addEventListener("click", (event) => {
      const questionNumber = event.target.dataset.target
      displayQuestion(questionNumber)
    })
  })
  
  const buttons2 = document.querySelectorAll(".question-2 button")
  buttons2.forEach((button2) => {
    button2.addEventListener("click", (event) => {
      const questionNumber2 = event.target.id
      const question2 = document.querySelector(".question-3")
      const form2 = document.querySelector(".question-2")
      form2.classList.toggle("hidden")
      question2.classList.toggle("hidden")

    })
  })
}
export {handleForm}
// Enelever la classe "hidden" de la question 