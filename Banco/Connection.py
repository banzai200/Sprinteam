import psycopg2


class Conectar(object):
    _db = None

    def __init__(self, mhost='localhost',
                 db='sprinteam',
                 usr='postgres',
                 pwd='6337313a8554b899d5edc8f9ec10471204ed2398'):
        self._db = psycopg2.connect(host=mhost, database=db, user=usr, password=pwd)

    def manipular(self, sql):
        try:
            cur = self._db.cursor()
            cur.execute(sql)
            print(sql)
            cur.close()
            self._db.commit()
        except:
            return False
        return True


    def consultar(self, sql):
        rs = None
        try:
            cur = self._db.cursor()
            cur.execute(sql)
            rs = cur.fetchall()
        except:
            return None
        return rs

'''Cria uma consulta ao banco e retornar o numero máximo de keys, para assim inserir a próxima key'''
def proximaPK(self, tabela, chave):
    sql = 'select max(' + chave + ') from ' + tabela
    rs = self.consultar(sql)
    pk = rs[0][0]
    return pk + 1


def fechar(self):
    self._db.close()


