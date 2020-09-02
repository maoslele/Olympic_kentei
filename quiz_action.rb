# 受験級の表示
def show_grade
  puts <<-TEXT

        ** 勝手に東京2020オリンピック検定 **

  |------------------------------------------------|
  |検 定| 難易度 | 受けられる認定                  |
  |-----+--------+---------------------------------|
  | 1級 | ***    | 東京オリンピック専門家          |
  | 2級 | **     | 東京オリンピックリポーター      |
  | 3級 | *      | 東京オリンピック応援団員        |
  |------------------------------------------------|
  
  TEXT
end

# 受験級の選択
def select_grade
  print "何級を受験しますか？（1~3を入力）> "
  return check_input_grade()
end

class Quizself
  attr_reader :q, :ans
  def initialize(q:, ans:)
    @q = q
    @ans = ans
  end
end

class Quiz
  attr_reader :selected_quiz

  def initialize(selected_quiz)
    @selected_quiz = []
    set_quiz(selected_quiz)
  end

  def set_quiz(selected_quiz)
    selected_quiz.each do |quiz|
      @selected_quiz << Quizself.new(**quiz)
    end
    @selected_quiz
  end

  # 問題の表示、解答
  def answer_quiz(grade)
    puts "#{grade}級の受験を開始します。全#{@selected_quiz.size}問です。"
    puts "--------------------------------------------------"
    score = 0
    @selected_quiz.shuffle.each.with_index(1) do |quiz, i|
      puts "\nQ#{i}: #{quiz.q}?"
      shuffle_ans = quiz.ans.shuffle.dup
      puts " A: #{shuffle_ans[0]}\n B: #{shuffle_ans[1]}\n C: #{shuffle_ans[2]}"
      ans = check_input_ans()
      score = check_ans(ans, shuffle_ans, quiz.ans, score)
    end
    return score
  end

  # 解答時の正解/不正解の表示
  def check_ans(ans, shuffle_ans, quiz_ans, score)
    ans_num = (ans == "A") ? 0 : (ans == "B" ) ? 1 : 2
    if shuffle_ans[ans_num] == quiz_ans[0]
       puts "正解です。"
       score += 1
    else
      puts "不正解です。正解は#{quiz_ans[0]}です。"
    end
    score
  end

  # 合否発表
  def show_result(score, grade)
    result = "不合格"
    score_ratio = score / @selected_quiz.size.to_f * 100
  
    case score_ratio
    when score_ratio = 10..40
      comment =  "雑学が少し増えましたかね！ 一緒に応援楽しみましょう！"
    when score_ratio = 50..60
      comment = "なかなか物知りですね！素晴らしい！"
    when score_ratio = 70..100
      result = "合格"
      post = (grade == 1 ) ? "東京オリンピック専門家" : (grade == 2) ? "東京オリンピックリポーター" : "東京オリンピック応援団員"
      comment = "あなたを#{post}に任命します"
    else #  正答数0
      comment = "残念です。今度あなたの興味のあることを聞かせてください。"
    end
  
    puts <<~TEXT

      お疲れ様でした。全問題が終了しました。
      --------------------------------------------------
      #{grade}級受験結果： #{result}
      正答数     ： #{score} / #{@selected_quiz.size}
      コメント   ：「#{comment}」
      --------------------------------------------------
    TEXT
    return result
  end

  # 再受験選択  
  def choose_answer_again(grade, quiz, score, result)
      if result == "合格"
        print "他の級を受験しますか（Y / N を入力）> "
        choice = check_input_choice()
        if ["Y"].include?(choice.upcase)
          # → 級選択して再受験
          grade = select_grade()
          quiz = Quiz.new(quiz_contents[grade-1])
          score = quiz.answer_quiz(grade)
          result = quiz.show_result(score, grade)
          quiz.choose_answer_again(grade, quiz, score, result)
        else
          # → 受験終了
          end_msg()
        end
      else # result == "不合格"
        print "もう一度受験しますか（Y / N を入力）> "
        choice = check_input_choice()
        if ["Y"].include?(choice.upcase)
          # → 不合格級を再受験
          quiz = Quiz.new(quiz_contents[grade-1])
          score = quiz.answer_quiz(grade)
          result = quiz.show_result(score, grade)
          quiz.choose_answer_again(grade, quiz, score, result)
        else
          # → 受験終了
          end_msg()
        end
      end
    end

    def end_msg
      puts <<~TEXT
        --------------------------------------------------
        受験ありがとうございました。
        いつかコロナが落ち着いて
        東京オリンピック2020が幻とならずに、開催されることを願います。
        明るい、平和な日常が戻ってくるよう
        あなたと、あなたの大切な人の健康と幸せへの祈りを込めて。
        -------------------------------------------------- 2020.08.13
      TEXT
    end
end




