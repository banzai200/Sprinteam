from github import Github

git = Github('tairoria@gmail.com', '5ce1a5e9f2df76d45948adccc5cd9024ade99830')


def getrepos():
    repos = []
    for repo in git.get_user().get_repos():
        repos.append(repo.full_name)
    return repos


def getcommits(repo):
    com = []
    commits = git.get_repo(repo).get_commits()
    for commit in commits:
        com.append(commit.commit.message)
    return com


def getissues(repo):
    issue = []
    issues = git.get_repo(repo).get_issues(state='open')
    for iss in issues:
        issue.append(iss)
    return issues


def createissue(repo, titulo, descricao):
    return git.get_repo(repo).create_issue(title=titulo, body=descricao)


def commentissue(repo, issue, comment):
    return git.get_repo(repo).get_issues()[issue].create_comment(comment)