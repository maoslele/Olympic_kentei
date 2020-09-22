class Quizself
  attr_reader :q, :ans
  def initialize(q:, ans:)
    @q = q
    @ans = ans
  end
end

class Quiz
  attr_reader :selected_quiz
  attr_accessor :grade, :score, :result

    def initialize
    @selected_quiz = []
    @grade = 0
    @score = 0
    @result = "不合格"
  end

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
    @grade = check_input_grade
  end

 # 受験級のクイズを設定
  def set_quiz
      # 全クイズ内容
    quiz_contents = [
      [  # 1級の出題内容(全10問)
        {q:"東京オリンピックの開催競技ではない種目はどれ",
          ans:["ボウリング", "サーフィン", "空手"]},
        {q:"オリンピック聖火リレーの国内スタート地点となる都道府県は",
          ans:["福島県", "沖縄県", "鳥取県"]},
        {q:"今大会で世界初の試みとして注目されている、メダルのある特徴とは？",
          ans:["リサイクル率100％のメダル", "選手の名前を刻印できるメダル", "職人によるハンドメイドのメダル"]},
        {q:"表彰台に使われる素材は",
          ans:["使用済みプラスチック", "特殊加工したダンボール", "新聞紙"]},
        {q:"東京オリンピックの開会式チケットの最高額は",
          ans:["30万円", "20万円", "10万円"]},
        {q:"東京2020聖火リレー公式アンバサダーは誰",
          ans:["石原さとみ", "沢尻エリカ", "芦田愛菜"]},
        {q:"東京オリンピックの公式キャラクターの名前は",
          ans:["ミライトワ", "ソメイティ", "パワフルくん"]},
        {q:"東京オリンピックの最も高額な観戦チケットはいくら",
          ans:["635万円", "975万円", "725万円"]},
        {q:"選手村で使用されるベッドフレームは何でできている",
          ans:["ダンボール", "ステンレス", "木材"]},
        {q:"聖火リレートーチに利用された廃材とは",
          ans:["東日本大震災の仮設住宅のアルミ建築", "小型家電等のリサイクル金属", "タイヤ"]},
      ],
      [  # 2級の出題内容(全5問)
        {q:"東京オリンピックの公式キャラクターのデザイン決定は誰が投票した",
          ans:["小学生", "知事", "組織委員会"]},
        {q:"東京オリンピックの2021年の開催日数は何日",
          ans:[17, 10, 13]},
        {q:"東京オリンピックのマラソンの開催地はどこ",
          ans:["北海道", "長野", "岩手"]},
        {q:"東京オリンピックの競技数は",
          ans:["全33競技339種目", "全52競技602種目", "全46競技412種目"]},
        {q:"東京オリンピック2020の応援ソングは",
          ans:["米津玄師「パプリカ」", "サザン「東京VICTORY」", "ゆず「栄光の架け橋」"]}
      ],
      [  # 3級の出題内容(全5問)
        {q:"2020年の東京オリンピック開催が延期になった起因の病気はどれ",
          ans:["コロナ", "結核", "スペイン風邪"]},
        {q:"東京オリンピックの2021年の開催開始日はいつ",
          ans:["2021年7月23日", "2021年6月23日", "2021年8月23日"]},
        {q:"東京オリンピック2020は日本で何回目のオリンピック",
          ans:[2, 1, 3]},
        {q:"東京オリンピックで一番人気だったチケットは",
          ans:["陸上", "水泳", "サッカー"]},
        {q:"東京オリンピックの開会式はどこ",
          ans:["新国立競技場", "武道館", "東京ドーム"]},
      ]
    ]
    quiz_contents[@grade-1].each do |quiz|
      @selected_quiz << Quizself.new(**quiz)
    end
    @selected_quiz
  end

  # 問題の表示、解答
  def answer_quiz
    puts <<~TEXT
    --------------------------------------------------
    #{@grade}級の受験を開始します。
    全#{@selected_quiz.size}問です。正答率70%以上で合格です。
    --------------------------------------------------
    TEXT
    @score = 0
    @selected_quiz.shuffle.each.with_index(1) do |quiz, i|
      puts "\nQ#{i}: #{quiz.q}?"
      shuffle_ans = quiz.ans.shuffle.dup
      puts " A: #{shuffle_ans[0]}\n B: #{shuffle_ans[1]}\n C: #{shuffle_ans[2]}"
      @score = check_ans(check_input_ans, shuffle_ans, quiz.ans)
    end
    @score
  end

  # 解答時の正解/不正解の表示
  def check_ans(ans, shuffle_ans, quiz_ans)
    ans_num = (ans == "A") ? 0 : (ans == "B" ) ? 1 : 2
    if shuffle_ans[ans_num] == quiz_ans[0]
       puts "正解です。"
       @score += 1
    else
      puts "不正解です。正解は#{quiz_ans[0]}です。"
    end
    @score
  end

  # 合否発表
  def show_result
    score_ratio = score / @selected_quiz.size.to_f * 100
  
    case score_ratio
    when score_ratio = 10..40
      comment =  "雑学が少し増えましたかね！ 一緒に応援楽しみましょう！"
    when score_ratio = 50..60
      comment = "なかなか物知りですね！素晴らしい！"
    when score_ratio = 70..100
      @result = "合格"
      post = (grade == 1 ) ? "東京オリンピック専門家" : (grade == 2) ? "東京オリンピックリポーター" : "東京オリンピック応援団員"
      comment = "あなたを#{post}に任命します"
    else #  正答数0
      comment = "残念です。今度あなたの興味のあることを聞かせてください。"
    end
  
    puts <<~TEXT

      お疲れ様でした。全問題が終了しました。
      --------------------------------------------------
      #{@grade}級受験結果： #{@result}
      正答数     ： #{@score} / #{@selected_quiz.size}
      コメント   ：「#{comment}」
      --------------------------------------------------
    TEXT
  end

  # 再受験選択  
  def choose_answer_again
      if @result == "合格"
        print "他の級を受験しますか（Y / N を入力）> "
        choice = check_input_choice()
      else # @result == "不合格"
        print "もう一度受験しますか（Y / N を入力）> "
        choice = check_input_choice
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