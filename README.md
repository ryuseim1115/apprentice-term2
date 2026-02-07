**PowerShell（ps1）を使って MySQL のデータベース／テーブルを自動作成するツール**です。
### 1. PowerSellのバージョンが7であることを確認
以下のコマンドをPowershellで実行して、PSVersionが7.××.××であることを確認して下さい。
※PSVersionが7.××.××でないと文字化けする可能性があります。
```powershell
$PSVersionTable
```

### 2. MySQL クライアントが使えることを確認

```powershell
mysql --version
```
### 3. ログイン情報の登録
以下のコマンドを PowerShell で実行してください。
※MySQLユーザー名はご自身のユーザ名を入力して下さい。
```powershell
mysql_config_editor set `
  --login-path=term2 `
  --host=localhost `
  --user=ユーザー名 `
  --password
  ```

### 4. 登録情報の確認
以下のコマンドを PowerShell で実行してください。
```powershell
mysql_config_editor print --all
```
以下のように表示されれば OK です（パスワードは表示されません）。
```powershell
[term2]
user = ユーザー名
password = *****
```
### 5. データベース作成・テーブル作成・データ挿入
以下のコマンドを PowerShell で実行してください。
```powershell
.\main.ps1
```
### 6. クエリ
課題のクエリは、queryフォルダに格納しています。