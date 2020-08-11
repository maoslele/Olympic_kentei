puts "** 勝手に東京2020オリンピック検定 **"
puts "-------------------------------------"

quizes = [
#級ごとに分けて問題を作りたい
  {q:"2020年の東京オリンピック開催が延期になった起因の病気はどれ",
   ans:{a:"コロナ", b: "結核", c: "スペイン風邪"}},
  {q:"東京オリンピックの開催競技ではない種目はどれ",
   ans:{a: "ボウリング", b: "サーフィン", c: "空手"}},
  {q:"東京オリンピックの2021年の開催開始日はいつ",
   ans:{a: "2021年7月23日", b: "2021年6月23日", c: "2021年8月23日"}},
   {q:"東京オリンピックの2021年の開催日数は何日",
   ans:{a: 17, b:13, c:15}},
   {q:"東京オリンピックの公式キャラクターの名前は",
   ans:{a: "ミライトワ", b:"ソメイティ", c:"パワフルくん"}},
   {q:"東京オリンピックの公式キャラクターのデザイン決定は誰が投票した",
   ans:{a: "小学生", b:"知事", c:"組織委員会"}},
   {q:"聖火リレートーチに利用された廃材とは",
   ans:{a: "東日本大震災の仮設住宅のアルミ建築", b:"小型家電等のリサイクル金属", c:"タイヤ"}},
   {q:"選手村で使用されるベッドフレームは何でできている",
   ans:{a: "ダンボール", b:"ステンレス", c:"木材"}},
   {q:"東京オリンピックで一番人気だったチケットは",
   ans:{a: "陸上", b:"水泳", c:"サッカー"}},
   {q:"東京オリンピックの最も高額な観戦チケットはいくら",
   ans:{a: "635万円", b:"975万円", c:"725万円"}},
]

num = 0
score = 0

def check_input()
  print = "→ "#ここがなぜか表示されない
  ans = gets.chomp
  while ans
    if ans == "A" || ans == "B" || ans == "C"
      break
    else
      puts "A,B,Cのいずれかを入力してください"
      print = "→ "
      ans = gets.chomp
    end
  end
  return ans
end

def check_ans(ans, score)
  if ans == "A"
    puts "正解です。"
    score += 1
  else ans == "B" || ans == "C"
    puts "不正解です。正解はAです"
  end
  return score
end

quizes.each do |quiz|
  num += 1
  puts "Q#{num}: #{quiz[:q]}?"
  puts " A: #{quiz[:ans][:a]}\n B: #{quiz[:ans][:b]}\n C: #{quiz[:ans][:c]}"

  ans = check_input()
  score = check_ans(ans,score)
  puts ""
end

def cnt_comment(score)
  result = "不合格"
case score
when score = 1..3
  comment = "あまり興味がなさそうです"
when score = 4..6
  comment =  "オリンピックに興味がありますね！"
when score = 7..8
  result = "合格"
  comment = "東京五輪公式リポーターになれそうです"
when score = 8..10
  result = "合格"
  comment = "東京五輪専門家ですね"
else #正答数0
  comment = "今度あなたの興味のあることを聞かせてください"
end
puts "受験結果：#{result} 「#{comment}」"
end

puts "-------------------------------------"
puts "レベル#{}の問題が終了しました。"
puts "正答数 #{score}/#{num}"
cnt_comment(score)
