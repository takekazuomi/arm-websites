# デプロイ方法
このブランチでは、最初にAppService Plan と、WebAppsを作成し、その後local git deploy の設定をする

# github からコードを持ってくる

```
git clone https://github.com/takekazuomi/arm-websites.git
cd arm-websites
```

# ブランチを切り替える

```
git checkout -b photoapp
```

# 確認

```
$ git branch -av
  master                    8a73211 add mysql in app test code
* photoapp                  8a73211 add mysql in app test code
  remotes/origin/HEAD       -> origin/master
  remotes/origin/localgit   8a343bc add index.php
  remotes/origin/localmysql 9b9f17e Merge branch 'master' into localmysql
  remotes/origin/master     8a73211 add mysql in app test code
  remotes/origin/photoapp   8a73211 add mysql in app test code
```

# Step 1 最初にAppService Plan と、WebAppsの作成
後でも使うので、$name に任意のユニークな名前を入れる

```
$name = "ユニークな名前"
.\deploy.ps1 -Name omitechc0628 -Location japaneast
```


