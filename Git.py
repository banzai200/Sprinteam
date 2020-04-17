from github import Github

"""Está classe foi criada para retornar valores da Api e anexar no projeto, exemplo: 
    listar as repos do usuário, listar as commits, branches e releases dessa repo e 
    atrelar isso a cada tarefa e no caso, a gente atrela uma só repo na board inteira
    
"""

class Git:

    def __init__(self, TOKEN):
        """Método construtor"""

        self.TOKEN = TOKEN

    def git(self):
        git = Github(self.TOKEN)
        return git

    def getRepository(self):
        # Pegar repositórios pesquisando via query
        repositories = self.git().search_repositories(query='language:python')
        for repo in repositories:
            print(repo)

    def getBranch(self, query):
        #Função destinada para retornar a lista de branches
        #Passar a query, exemplo: "PyGithub/PyGithub"
        #Ele retornará uma lista
        repo = self.git().get_repo(query)
        lista = list(repo.get_branches())
        return lista

    def getReleases(self, query):
        #Função destinada para retornar os releases e retornando uma lista
        repo = self.git().get_repo(query)
        lista = list(repo.get_releases())

        return lista


if __name__ == '__main__':
    TOKEN = '7d5b3c8143c58995e4e32bbd45ea643fbf4887f9'

    git = Git(TOKEN)

    branch = git.getBranch('PyGithub/PyGithub')

    for i in branch:

        print(i)
