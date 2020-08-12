Rubyのクイズゲームプログラム  

/// 勝手に東京オリンピック検定 ///  
■ 検定1級 ：東京オリンピック専門家認定  
■ 検定2級 ：東京オリンピックリポーター認定  
■ 検定3級 ：東京オリンピック好き認定  

--クイズ仕様概略--  
・各級を選択し、クイズを開始する  
・クイズ回答後、以下が表示される  
  正解であれば「正解です」  
  不正解であれば「正解はXXです」  
・各検定の出題数は1級10問、2級及び3級は5問
・問題の配点は各1点  
・全問解答後、最後に点数が表示される  
・各検定での正答率70％以上で合格  

--クイズ内部仕様--  
・各クイズの正解は各問題の回答配列要素0番目とする(quizes[:ans][0])  
・回答および問題はランダムで表示される  
・合格していれば、続けて受験可能  
