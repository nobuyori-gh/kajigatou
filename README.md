# アプリ名:かじがとう（家事ありがとう）

## サイト概要
- 家事を誰が何をやったか記録。「ありがとう」を送りあい、面と向かって伝えにくい感謝の気持ちを伝えよう。

### サイトテーマ
- 感謝の気持ちを伝えること
- 家事の効率化

### テーマを選んだ理由
- 誰もが一人暮らしを経験してから気づく、家事をしてくれた人への感謝の気持ち。
  - 感謝の気持ちを忘れずに伝え続ける。
  - 大変さを知ったからこそ少しでも手伝う。
  - もっと自分の時間を作ってあげたい
- この気持ちを忘れないためアプリ製作を考えた。

### ターゲットユーザ
- 家族や同居者のいる世帯者

### 主な利用シーン
- 家事のタスク管理表
- 子どもへの教育
- コミュニケーションツール

## 設計書
- 感謝を伝える方法
  1. 投稿されたタスク(内容・投稿者・担当者・完了ステータス)を確認
  2. ありがとうボタンを押すことやコメントをすることで感謝を伝える

- ユーザー認証（gem devise）
- グループ機能
  - グループメンバーの許可がないと入会不可にする
- 投稿機能
  - タスク管理（登録・編集・削除）
- ありがとう機能
  - ありがとうボタン設置し、押すことで感謝の気持ちを伝える
- コメント機能
  - ありがとうボタンだけでは伝えられない気持ちを伝える
  - タスク進める上でのメモ
- メール配信機能（未実装）
  - タスク期日に連絡
