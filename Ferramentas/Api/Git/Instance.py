from github import Github
from github import GitRelease


class Git:
    GitToken = ''
    hostName = ''
    # Coleta de repositório do github (só Enterprise?)
    git = Github(base_url=f"https://{hostName}/api/v3", login_or_token=GitToken)

    def getRepository(self):
        # Pegar repositórios pesquisando via query
        repositories = self.git.search_repositories(query='language:python')
        for repo in repositories:
            print(repo)

    def getBranch(self, query):
        #Função destinada para retornar a lista de branches
        #Passar a query, exemplo: "PyGithub/PyGithub"
        #Ele retornará uma lista
        repo = self.git.get_repo(query)
        lista = list(repo.get_branches())
        return lista

    def getReleases(self, query):
        #Função destinada para retornar os releases e retornando uma lista
        repo = self.git.get_repo(query)
        lista = list(repo.get_releases())

        return lista