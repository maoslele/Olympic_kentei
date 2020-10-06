require './quiz_action'

grade_selected = false

while true do
  if !grade_selected
    quiz = Quiz.new
    quiz.show_grade
    quiz.select_grade
  end

  quiz.answer_quiz
  quiz.show_result
  if quiz.answer_again?
    quiz.end_msg
    break
  end

  grade_selected = quiz.result == "合格" ?  false : true
end