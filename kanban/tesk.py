from datetime import date
"""
[5/10, 1:46 PM] Fernando Rhs: Mas então, a "receita" é meio que essa:

1. Separar as tarefas por ponto
2. Tirar a média de prazo de cada tarefa concluída (total de dias para concluir as tarefas de
determinada pontuação/ total de tarefas de determinada pontuação)
3. Colocar as tarefas em fila (FIFO)
4. A previsão vai ser: média de dias para conclusão de tarefas
daquela pontuação + dias para conclusão da tarefa que está acima na fila
[5/10, 1:48 PM] Fernando Rhs: Vamos supor que a média de dias para concluir tarefas de 3 pontos é 5 dias.

Se eu tenho 3 tarefas de 5 pontos na fila, a previsão de conclusão será:

1. 5 dias
2. 10 dias (5 dias da média + 5 dias da tarefa anterior)
3. 15 dias (5 dias da média + 10 dias da tarefa anterior)
[5/10, 1:49 PM] Fernando Rhs: Isso, claro, pensando num fila atendida por uma única pessoa.
[5/10, 1:50 PM] Fernando Rhs: Se eu for fazer essa fila em paralelo, o prazo poderia ser:

1. 5 dias
2. 5 dias
3. 10 dias
[5/10, 1:50 PM] Fernando Rhs: Isso porque, nesse exemplo, eu usaria duas pessoas
[5/10, 1:51 PM] Fernando Rhs: Então, não preciso esperar a primeira tarefa
terminar para fazer a segunda, pode fazer a primeira e segunda ao mesmo tempo.

"""

class Task:



    def __init__(self, id_kanban, type, date, status):
        self._id_kanban= id_kanban
        self._tipo = type
        self._date = date
        self._status = status

    @property
    def id_kanban(self):

        return self._id_kanban
    @property
    def tipo (self):

        return self._tipo

    @property
    def date(self):
        return self._date

    @property
    def status(self):
        return self._status

    @tipo.setter
    def tipo(self, value):
        self._tipo = value

    @date.setter
    def date(self, value):
        self._date = value

    @status.setter
    def status(self, value):
        self._status = value

    @id_kanban.setter
    def id_kanban(self, value):
        self._id_kanban = value


class Row:

    def insert_queue(self, user):
        dic = {
           user:{
            "Id: ": Task.id_kanban,
            "Tipo: ": Task.tipo,
            "Data: ": Task.date,
            "Status: ":Task.status
           }
        }
        Task.tipo =''




    def update_queue(self):
        pass

    def delete_queue(self):
        pass

    def point_queue(self):
        pass

    def list_queue(self):
        pass



