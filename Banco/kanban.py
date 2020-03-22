import Banco.Connection as Post

post = Post.Conectar()


def cardcreate(name, description, topic, responsible, deadline, complexity):
    post.manipular('insert into cards values(\''+name +
                   '\',\''+description +
                   '\',\''+topic +
                   '\',\''+responsible +
                   '\',\''+deadline +
                   '\','+complexity+')')