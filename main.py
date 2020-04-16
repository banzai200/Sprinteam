from Sprinteam.Api.Git import Git
TOKEN = '7d5b3c8143c58995e4e32bbd45ea643fbf4887f9'
hostName = 'Sprinteam'

git = Git(TOKEN, hostName)

b = git.getBranch('PyGithub/PyGithub')

for i in b:

    print(i)
