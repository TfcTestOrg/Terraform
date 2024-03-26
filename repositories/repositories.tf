
resource "github_repository" "Test_repositories" {
  for_each = {
    for repo in csvdecode(file("repositories/repositories.csv")) :
    repo.name => repo
  }

  name        = each.value.name
  visibility = each.value.visibility
}