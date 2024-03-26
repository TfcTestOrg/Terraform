
# 第1階層(親チームなし)
resource "github_team" "Test_teams_level_1" {
  for_each = {
    for team in csvdecode(file("teams/teams_level_1.csv")) :
    team.name => team
  }

  name        = each.value.name
  description = each.value.description

  create_default_maintainer = true
  privacy     = "closed"
}

# 第2階層
resource "github_team" "Test_teams_level_2" {
  for_each = {
    for team in csvdecode(file("teams/teams_level_2.csv")) :
    team.name => team
  }

  name        = each.value.name
  description = each.value.description
  parent_team_id = github_team.Test_teams_level_1[each.value.parent_team].id
  
  create_default_maintainer = true
  privacy     = "closed"
}

# 第3階層
resource "github_team" "Test_teams_level_3" {
  for_each = {
    for team in csvdecode(file("teams/teams_level_3.csv")) :
    team.name => team
  }
  name        = each.value.name
  description = each.value.description
  parent_team_id = github_team.Test_teams_level_2[each.value.parent_team].id

  create_default_maintainer = true
  privacy     = "closed"
}

