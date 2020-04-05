from github import Github
#Usando um token de acesso
TOKKEN = ''
hostName = ''

git = Github(TOKKEN)

class Repository():


    def getYourRepository(self):
        #Pegar o seu repositórios'''
        # Github Enterprise with custom hostname
        self.git = Github(base_url=f"https://{hostName}/api/v3", login_or_token=TOKKEN)

    def getRepository(self):
        #Pegar repositórios pesquisando via  query
        repositories = git.search_repositories(query='language:python')
        rep = list
        for repo in repositories:
            print(repo)

    def getFile(self):
        pass











