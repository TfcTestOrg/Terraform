# Terraform
TerraformCloudでのGithub管理の実験用

--------------------
### メモ
アカウント用意はしんどいので、メンバーは自アカ1つ

実際メンテする際に直接 TF ファイルを編集されるのは嫌なので、とりあえず CSVファイルを使う

ディレクトリ分けても呼び出せるようにmain.tfでそれぞれをmoduleで呼び出す感じ  

一括でリソースを登録するのは
[Importブロックでfor_Each](/Import_Block.md)
するのが楽かも