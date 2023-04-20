  # 登録人物
  ## 使用者
  - 書籍を借りる人
  ## 管理者
  - 期限以内に書籍が返却されているのを確認する人
  - 返却されていなかったり返却日が近い場合は使用者に電話したりメールを送ったりして
    書籍の返却を促す人


 # システムへログイン、ログアウト
 - 利用者と管理人は、ログインとログアウトができる

 # 書籍の在庫状態を確認する
  - 利用者は、誰がどの書籍を借りており、返却日がいつなのかを把握することができる
  - 管理者は、誰がどの書籍を借りているのかを把握することができ、それに加えて社員情報に保存されている情報を把握することができる

 # 利用者が書籍を借りる
  1. 利用者がバーコードを読み込んで、対応した書籍の在庫があるのなら借りることができる
  2. 利用者は、自分の名前を書く
 ## 利用者が利用者情報や書籍情報を確認
  3. 利用者が記入した内容が一致するかを確認するためことができる.
  4. 利用者は、返却日を確認でき、貸し出しから二週間以内に返却いなければならない。
  5. 返却日の3日前の場合は、社員に電話をする


 # 利用者が返却をする
  - 利用者が借りた書籍をバーコードで読み込み、情報が一致したら書籍を返却することがでくる。

## 返却日までに書籍を返却していない場合
  - 書籍が期日までに返却されていない場合は、上層部に報告する。


 # 管理人が書籍を購入する
 - 管理人は、書籍テーブルに情報を手動で入力して保存する。

 # 社員から書籍購入のリクエストを受ける
 1. 利用者は、リクエストする書籍内容を入力することができ、その情報保存する。
 2. 管理者は、保存された情報を確認して、上層部に予算と購入許可をとる
