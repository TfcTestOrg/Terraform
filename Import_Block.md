# Terrafomのimportブロックでfor_eachを使う

[Terraform 1.7.0](https://github.com/hashicorp/terraform/releases/tag/v1.7.0)で使えるようになってたので、Githubのリポジトリのimportで実験したやつ
一括でimportするのに便利だった


---
`repositories.tf`  
リポジトリのリソース  

```js
resource "github_repository" "Test_repositories" {
  for_each = {
    for repo in csvdecode(file("repositories/repositories.csv")) :
    repo.name => repo
  }

  name        = each.value.name
  visibility = "private"
}
```
---

`main.tf`  
repositoriesをモジュールで呼び出したっかため

```js
module "github_repositories" {
  source = "./repositories"
}
```
---
`import.tf`  
for_eachはresourceと同じものにする

```js
import {
  for_each = {
    for repo in csvdecode(file("repositories/repositories.csv")) :
    repo.name => repo
  }
  to = module.github_repositories.github_repository.Test_repositories[each.key]
  id = each.value.name
}
```
---