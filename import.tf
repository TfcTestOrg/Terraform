#　importしたいときだけ使う
#import {
#  for_each = {
#    for repo in csvdecode(file("repositories/repositories.csv")) :
#    repo.name => repo
#  }
#  to = module.github_repositories.github_repository.Test_repositories[each.key]
#  id = each.value.name
#}
