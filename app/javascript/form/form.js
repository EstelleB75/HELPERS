// Poser un micro sur le clic
const handleForm = () => {
  const buttons = document.querySelectorAll(".question-1 button")
  buttons.forEach((button) => {
    button.addEventListener("click", (event) => {
      const questionNumber = event.target.id
      const question = document.querySelector(`.${questionNumber}`)
      question.classList.toggle("hidden")
      
      
    })
  })
  
  const buttons2 = document.querySelectorAll(".question-2 button")
  buttons2.forEach((button2) => {
    button2.addEventListener("click", (event) => {
      const questionNumber2 = event.target.id
      const question2 = document.querySelector(".question-3")
      question2.classList.toggle("hidden")
    })
  })
}
export {handleForm}
// Enelever la classe "hidden" de la question 