# デプロイ方法
このブランチでは、最初にAppService Plan と、WebAppsを作成し、その後local git deploy の設定をする

# github からコードを持ってくる

```
git clone https://github.com/takekazuomi/arm-websites.git
cd arm-websites
```

# ブランチを切り替える

```
git checkout -b photoapp origin/photoapp
```

# 確認

```
git br -av                                                                                    

  master                    8a73211 add mysql in app test code                                  
* photoapp                  47a0742 update readme                                               
  remotes/origin/HEAD       -> origin/master                                                    
  remotes/origin/localgit   8a343bc add index.php                                               
  remotes/origin/localmysql 9b9f17e Merge branch 'master' into localmysql                       
  remotes/origin/master     8a73211 add mysql in app test code                                  
  remotes/origin/photoapp   47a0742 update readme                                               
```
アスタリスクが付いているのが、現在ブランチ。ハッシュ値がリモートと同じかを確認。git fetch でリモートを持ってこれる。

# AppService Plan と、WebAppsの作成
後でも使うので、$name に任意のユニークな名前を入れる。$name.

```
$name = "ユニークな名前"
.\deploy.ps1 -Name $name -Location japaneast
```

# local git のリモートに WebAppsを登録

```
.\set-gitdeploy.ps1 $name azure
```

リモートのazure が登録されているとエラーになる。上書きするには、-Force を付ける。

# アプリをデプロイ

git push azure photoapp






