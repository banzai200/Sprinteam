class Pessoa():

    '''Esta classe é obrigatória chamar o pacote de conexões com o banco, só assim altera o usuário'''

    def __init__(self, tipo, funcao, cargo):
        '''Construtor do usuário'''
        self.tipo = tipo
        self.funcao = funcao
        self.cargo = cargo

    '''Métodos Getter e setter para pegar o valor de usuário ou alterar'''

    def CadastraPessoa(self):
        '''Cadastrar um usuário, aqui obrigatóriamente você irá chamar a conexão com o banco'''

    def exluirPessoa(self):
        pass

    def alterarPessoa(self):
        pass

    '''Métodos Getter e setter para pegar o valor de usuário ou alterar'''

    def getTipo(self):
        return self.tipo

    def getFuncap(self):
        return self.funcao

    def getCargo(self):
        return self.cargo

    def setTipo(self, tipo):
        self.tipo = tipo

    def setTipo(self, funcao):
        self.funcao = funcao

    def setTipo(self, cargo):
        self.cargo = cargo

    def toString(self):

        dic = {'Tipo': self.getTipo(),'Funçao':self.getFuncap(),'Cargo':self.getCargo()}








