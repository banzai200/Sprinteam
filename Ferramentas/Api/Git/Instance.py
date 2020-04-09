from github import Github
from github import GitRelease


class Git():
    TOKKEN = ''
    hostName = ''
    git = Github(TOKKEN)

    def getYourRepository(self):
        """Pegar os seus repositórios
                            Github Enterprise with custom hostname
                            """

        self.git = Github(base_url=f"https://{self.hostName}/api/v3", login_or_token=self.TOKKEN)

    def getRepository(self):
        """Pegar repositórios pesquisando via  query"""
        repositories = self.git.search_repositories(query='language:python')
        for repo in repositories:
            print(repo)

    def getBranch(self, query):
        '''Função destinada para retornar a lista de branchs

         Passar a query, exemplo: "PyGithub/PyGithub"

        Ele retornará uma lista

        '''
        repo = self.git.get_repo(query)
        lista = list(repo.get_branches())

        return lista

    def getReleases(self, query):
        '''Função destinada para retornar os realeses e retornando uma lista'''
        repo = self.git.get_repo(query)
        lista = list(repo.get_releases())

        return lista





