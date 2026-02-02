**PowerShell（ps1）を使って MySQL のデータベース／テーブルを自動作成するツール**です。

### 1. MySQL クライアントが使えることを確認

```powershell
mysql --version
```
### 2. ログイン情報の登録
以下のコマンドを PowerShell で実行してください。
※MySQLユーザー名はご自身のユーザ名を入力して下さい。
```powershell
mysql_config_editor set `
  --login-path=term2 `
  --host=localhost `
  --user=ユーザー名 `
  --password
  ```

### 3. 登録情報の確認
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
### 4. データベース作成・テーブル作成・データ挿入
以下のコマンドを PowerShell で実行してください。
```powershell
.\main.ps1
```
