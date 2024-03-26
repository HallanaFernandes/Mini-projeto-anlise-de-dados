import mysql.connector #para conectar com sql
import pandas as pd #para manipular as tabelas
import matplotlib.pyplot as plt

# Dados para a conexão
dados_conexao = {
    'host': 'localhost',
    'user': 'HALLANA',
    'password': 'HALLANA',
    'database': 'HALLANA'
}

# Conectar ao banco de dados
conexao = mysql.connector.connect(**dados_conexao) # estabelecendo uma conexão com o banco

# Consulta SQL para obter os dados (substitua pela sua consulta real)
consulta_sql = "SELECT * FROM view_clientes_por_sexo"
# Ler os dados usando pandas
df = pd.read_sql(consulta_sql, conexao)

print(df)

# Fechar a conexão
conexao.close()

# Agora você tem seus dados em um DataFrame pandas (df)

# Plotagem do gráfico de pizza
cores = ['#d8e2dc','#ffcad4']
plt.pie(df['total_clientes_sexo'], labels=df['sexo'], autopct='%1.1f%%')
plt.axis('equal')  # Garante que o gráfico de pizza seja desenhado como um círculo
plt.title('Distribuição de Clientes por Sexo')
plt.show()


