-- TABELA CLIENTES
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome_completo VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

INSERT INTO clientes (id_cliente, nome_completo, email, telefone) VALUES
(1, 'João Silva', 'joao@example.com', '(11) 1234-5678', 16, 'M'),
(2, 'Maria Santos', 'maria@example.com', '(22) 2345-6789', 33, 'F'),
(3, 'Carlos Oliveira', 'carlos@example.com', '(33) 3456-7890', 15, 'M'),
(4, 'Ana Rodrigues', 'ana@example.com', '(44) 4567-8901', 31, 'F'),
(5, 'Pedro Almeida', 'pedro@example.com', '(55) 5678-9012', 31, 'M'),
(6, 'Mariana Costa', 'mariana@example.com', '(66) 6789-0123', 25, 'F'),
(7, 'José Pereira', 'jose@example.com', '(77) 7890-1234', 20, 'M'),
(8, 'Camila Martins', 'camila@example.com', '(88) 8901-2345', 14, 'F'),
(9, 'Fernando Sousa', 'fernando@example.com', '(99) 9012-3456', 21, 'M'),
(10, 'Aline Lima', 'aline@example.com', '(10) 0123-4567', 29, 'F'),
(11, 'Rafaela Mendes', 'rafaela@example.com', '(20) 1234-5678', 25, 'F'),
(12, 'Luiz Gomes', 'luiz@example.com', '(30) 2345-6789', 25, 'M'),
(13, 'Paula Carvalho', 'paula@example.com', '(40) 3456-7890', 13, 'F'),
(14, 'Gustavo Ferreira', 'gustavo@example.com', '(50) 4567-8901', 24, 'M'),
(15, 'Patrícia Oliveira', 'patricia@example.com', '(60) 5678-9012', 26, 'F'),
(16, 'Lucas Vieira', 'lucas@example.com', '(70) 6789-0123', 20, 'M'),
(17, 'Beatriz Silva', 'beatriz@example.com', '(80) 7890-1234', 18, 'F'),
(18, 'Roberto Costa', 'roberto@example.com', '(90) 8901-2345', 26, 'M'),
(19, 'Carolina Santos', 'carolina@example.com', '(21) 9012-3456', 17, 'F'),
(20, 'Diego Martins', 'diego@example.com', '(31) 0123-4567', 19, 'M'),
(21, 'Lucas Almeida', 'lucas@example.com', '(41) 1234-5678', 12, 'M'),
(22, 'Felipe Pereira', 'felipe@example.com', '(51) 2345-6789', 24, 'M'),
(23, 'Larissa Oliveira', 'larissa@example.com', '(61) 3456-7890', 21, 'F'),
(24, 'Vinícius Rodrigues', 'vinicius@example.com', '(71) 4567-8901', 14, 'M'),
(25, 'Tatiane Silva', 'tatiane@example.com', '(81) 5678-9012', 28, 'F'),
(26, 'André Souza', 'andre@example.com', '(91) 6789-0123', 17, 'M'),
(27, 'Marcela Santos', 'marcela@example.com', '(22) 7890-1234', 33, 'F'),
(28, 'Bruno Lima', 'bruno@example.com', '(33) 8901-2345', 13, 'M'),
(29, 'Priscila Fernandes', 'priscila@example.com', '(44) 9012-3456', 21, 'F'),
(30, 'Daniel Costa', 'daniel@example.com', '(55) 0123-4567', 30, 'M'),
(31, 'Ramon Alves', 'ramon@example.com', '(66) 1234-5678', 32, 'M'),
(32, 'Ricardo Pereira', 'ricardo@example.com', '(77) 2345-6789', 26, 'M'),
(33, 'Carla Oliveira', 'carla@example.com', '(88) 3456-7890', 16, 'F'),
(34, 'Renan Silva', 'renan@example.com', '(99) 4567-8901', 28, 'M'),
(35, 'Marcos Lima', 'marcos@example.com', '(10) 5678-9012', 24, 'M');

-- TABELA ENDEREÇO

CREATE TABLE endereco (
    id_endereco INT PRIMARY KEY,
    pais VARCHAR(50),
    estado VARCHAR(50),
    cidade VARCHAR(50),
    bairro VARCHAR(50),
    rua VARCHAR(100),
    numero VARCHAR(20),
    cep VARCHAR(20),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


INSERT INTO endereco (id_endereco, pais, estado, cidade, bairro, rua, numero, cep, id_cliente) VALUES
(1, 'Brasil', 'São Paulo', 'São Paulo', 'Centro', 'Rua A', '123', '01000-000', 1),
(2, 'Brasil', 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', 'Rua B', '456', '02000-000', 2),
(3, 'Brasil', 'Minas Gerais', 'Belo Horizonte', 'Savassi', 'Rua C', '789', '03000-000', 3),
(4, 'Brasil', 'Bahia', 'Salvador', 'Barra', 'Rua D', '101', '04000-000', 4),
(5, 'Brasil', 'Paraná', 'Curitiba', 'Batel', 'Rua E', '202', '05000-000', 5),
(6, 'Brasil', 'Santa Catarina', 'Florianópolis', 'Centro', 'Rua F', '303', '06000-000', 6),
(7, 'Brasil', 'Rio Grande do Sul', 'Porto Alegre', 'Moinhos de Vento', 'Rua G', '404', '07000-000', 7),
(8, 'Brasil', 'Ceará', 'Fortaleza', 'Meireles', 'Rua H', '505', '08000-000', 8),
(9, 'Brasil', 'Pernambuco', 'Recife', 'Boa Viagem', 'Rua I', '606', '09000-000', 9),
(10, 'Brasil', 'Goiás', 'Goiânia', 'Setor Bueno', 'Rua J', '707', '10000-000', 10),
(11, 'Brasil', 'Espírito Santo', 'Vitória', 'Jardim da Penha', 'Rua K', '808', '11000-000', 11),
(12, 'Brasil', 'Pará', 'Belém', 'Batista Campos', 'Rua L', '909', '12000-000', 12),
(13, 'Brasil', 'Paraíba', 'João Pessoa', 'Tambaú', 'Rua M', '1010', '13000-000', 13),
(14, 'Brasil', 'Rio Grande do Norte', 'Natal', 'Ponta Negra', 'Rua N', '1111', '14000-000', 14),
(15, 'Brasil', 'Alagoas', 'Maceió', 'Ponta Verde', 'Rua O', '1212', '15000-000', 15),
(16, 'Brasil', 'Amapá', 'Macapá', 'Centro', 'Rua P', '1313', '16000-000', 16),
(17, 'Brasil', 'Amazonas', 'Manaus', 'Adrianópolis', 'Rua Q', '1414', '17000-000', 17),
(18, 'Brasil', 'Rondônia', 'Porto Velho', 'Centro', 'Rua R', '1515', '18000-000', 18),
(19, 'Brasil', 'Roraima', 'Boa Vista', 'Centro', 'Rua S', '1616', '19000-000', 19),
(20, 'Brasil', 'Tocantins', 'Palmas', 'Plano Diretor Sul', 'Rua T', '1717', '20000-000', 20),
(21, 'Brasil', 'Mato Grosso', 'Cuiabá', 'Centro Norte', 'Rua U', '1818', '21000-000', 21),
(22, 'Brasil', 'Mato Grosso do Sul', 'Campo Grande', 'Centro', 'Rua V', '1919', '22000-000', 22),
(23, 'Brasil', 'Maranhão', 'São Luís', 'Calhau', 'Rua W', '2020', '23000-000', 23),
(24, 'Brasil', 'Acre', 'Rio Branco', 'Centro', 'Rua X', '2121', '24000-000', 24),
(25, 'Brasil', 'Sergipe', 'Aracaju', 'Atalaia', 'Rua Y', '2222', '25000-000', 25),
(26, 'Brasil', 'Acre', 'Rio Branco', 'Bosque', 'Rua Z', '2323', '26000-000', 26),
(27, 'Brasil', 'São Paulo', 'São Paulo', 'Moema', 'Avenida A', '2424', '27000-000', 27),
(28, 'Brasil', 'Rio de Janeiro', 'Rio de Janeiro', 'Leblon', 'Avenida B', '2525', '28000-000', 28),
(29, 'Brasil', 'Minas Gerais', 'Belo Horizonte', 'Lourdes', 'Avenida C', '2626', '29000-000', 29),
(30, 'Brasil', 'Bahia', 'Salvador', 'Pituba', 'Avenida D', '2727', '30000-000', 30),
(31, 'Brasil', 'Paraná', 'Curitiba', 'Bigorrilho', 'Avenida E', '2828', '31000-000', 31),
(32, 'Brasil', 'Santa Catarina', 'Florianópolis', 'Itacorubi', 'Avenida F', '2929', '32000-000', 32),
(33, 'Brasil', 'Rio Grande do Sul', 'Porto Alegre', 'Três Figueiras', 'Avenida G', '3030', '33000-000', 33),
(34, 'Brasil', 'Ceará', 'Fortaleza', 'Aldeota', 'Avenida H', '3131', '34000-000', 34),
(35, 'Brasil', 'Ceará', 'Fortaleza', 'Boa Viagem', 'Avenida y', '3231', '34520-000', 35);

-- TABELA PRODUTOS

CREATE TABLE Produtos (
    ID_produto INT PRIMARY KEY,
    QTD_em_estoque INT,
    valor_unitario DECIMAL(10, 2),
    total DECIMAL(10, 2),
    nome_produto VARCHAR(100),
    descricao TEXT
);


INSERT INTO Produtos (ID_produto, QTD_em_estoque, valor_unitario, total, nome_produto, descricao)
VALUES
    (1, 10, 100.00, 1000.00, 'Teclado', 'Teclado USB padrão'),
    (2, 15, 50.00, 750.00, 'Mouse', 'Mouse óptico sem fio'),
    (3, 20, 200.00, 4000.00, 'Monitor', 'Monitor LED 24 polegadas'),
    (4, 5, 1500.00, 7500.00, 'Notebook', 'Notebook Core i7, 16GB RAM, 512GB SSD'),
    (5, 30, 20.00, 600.00, 'Cabo HDMI', 'Cabo HDMI de alta velocidade'),
    (6, 25, 170.00, 4250.00, 'Impressora', 'Impressora multifuncional jato de tinta'),
    (7, 12, 300.00, 3600.00, 'Roteador', 'Roteador Wi-Fi dual-band'),
    (8, 8, 400.00, 3200.00, 'Switch', 'Switch Gigabit 8 portas'),
    (9, 18, 150.00, 2700.00, 'HD Externo', 'HD Externo 1TB USB 3.0'),
    (10, 3, 10000.00, 30000.00, 'Macbook Pro', 'Macbook Pro 13 polegadas, Touch Bar'),
    (11, 40, 10.00, 400.00, 'Pen Drive', 'Pen Drive 32GB USB 3.0'),
    (12, 6, 4000.00, 24000.00, 'Servidor', 'Servidor rackmount, Xeon, 32GB RAM, 4TB HDD'),
    (13, 22, 70.00, 1540.00, 'Webcam', 'Webcam HD 1080p'),
    (14, 17, 120.00, 2040.00, 'Caixa de Som', 'Caixa de Som Bluetooth'),
    (15, 9, 1000.00, 9000.00, 'Tablet', 'Tablet Android 10 polegadas, 64GB armazenamento'),
    (16, 35, 15.00, 525.00, 'Adaptador VGA', 'Adaptador VGA para HDMI'),
    (17, 2, 18000, 36000.00, 'iMac', 'iMac 27 polegadas, 5K Retina display'),
    (18, 14, 90.00, 1260.00, 'Hub USB', 'Hub USB 3.0 de 4 portas'),
    (19, 11, 2000.00, 22000.00, 'Placa de Vídeo', 'Placa de Vídeo GeForce RTX 3080'),
    (20, 28, 25.00, 700.00, 'Cartão de Memória', 'Cartão de Memória 128GB Classe 10'),
    (21, 1, 5000.00, 5000.00, 'Workstation', 'Workstation Intel Xeon, 64GB RAM, 1TB SSD'),
    (22, 16, 150.00, 2400.00, 'Teclado Gamer', 'Teclado Mecânico RGB'),
    (23, 7, 4000, 28000.00, 'Notebook Gamer', 'Notebook Gamer Core i9, RTX 3080, 32GB RAM'),
    (24, 4, 10000.00, 40000.00, 'Servidor de Banco de Dados', 'Servidor de Banco de Dados empresarial'),
    (25, 13, 110.00, 1430.00, 'Mousepad', 'Mousepad de grande tamanho')
    (26, 50, 30.00, 1500.00, 'Fone de Ouvido', 'Fone de Ouvido com fio padrão'),
    (27, 40, 40.00, 1600.00, 'Teclado USB', 'Teclado USB padrão'),
    (28, 60, 20.00, 1200.00, 'Mouse Óptico', 'Mouse óptico com fio padrão'),
    (29, 30, 25.00, 750.00, 'Mouse Sem Fio', 'Mouse sem fio básico'),
    (30, 45, 35.00, 1575.00, 'Fone de Ouvido Bluetooth', 'Fone de Ouvido Bluetooth sem fio');


-- TABELA PEDIDOS

CREATE TABLE PEDIDO (
    ID_PEDIDO INT PRIMARY KEY,
    TOTAL DECIMAL(10, 2),
    ID_CLIENTE INT,
    DATA_PEDIDO DATE,
    STATUS VARCHAR(50)
);

INSERT INTO PEDIDO (ID_PEDIDO, TOTAL, ID_CLIENTE, DATA_PEDIDO, STATUS)
VALUES
(1, 35.00, 1, '2023-01-20', 'entregue'),
(2, 25.00, 2, '2023-02-15', 'entregue'),
(3, 50.00, 3, '2023-03-10', 'entregue'),
(4, 40.00, 4, '2023-04-05', 'entregue'),
(5, 30.00, 5, '2023-05-25', 'entregue'),
(6, 110.00, 6, '2023-06-18', 'entregue'),
(7, 10000.00, 7, '2023-07-23', 'entregue'),
(8, 4000.00, 8, '2023-08-30', 'entregue'),
(9, 150.00, 9, '2023-09-12', 'entregue'),
(10, 5000.00, 10, '2023-10-05', 'entregue'),
(11, 50.00, 11, '2023-11-10', 'entregue'),
(12, 2000.00, 12, '2023-12-25', 'entregue'),
(13, 90.00, 13, '2023-12-01', 'entregue'),
(14, 18000.00, 14, '2023-12-12', 'entregue'),
(15, 30.00, 15, '2023-12-28', 'entregue'),
(16, 1000.00, 16, '2023-12-17', 'entregue'),
(17, 120.00, 17, '2023-12-03', 'entregue'),
(18, 70.00, 18, '2023-12-20', 'entregue'),
(19, 4000.00, 19, '2023-12-07', 'entregue'),
(20, 30.00, 20, '2023-12-24', 'entregue'),
(21, 10000.00, 21, '2023-09-25', 'entregue'),
(22, 150.00, 22, '2023-12-05', 'entregue'),
(23, 400.00, 23, '2023-12-15', 'entregue'),
(24, 300.00, 24, '2023-12-08', 'entregue'),
(25, 170.00, 25, '2023-02-11', 'entregue'),
(26, 20.00, 26, '2023-12-22', 'entregue'),
(27, 1500.00, 27, '2023-12-29', 'entregue'),
(28, 200.00, 28, '2023-12-04', 'entregue'),
(29, 50.00, 29, '2023-08-26', 'entregue'),
(30, 100.00, 30, '2023-12-18', 'entregue'),
(31, 200.00, 31, '2023-06-14', 'entregue'),
(32, 100.00, 32, '2023-12-21', 'entregue'),
(33, 60.00, 33, '2023-05-27', 'entregue'),
(34, 160.00, 34, '2023-12-16', 'entregue'),
(35, 280.00, 35, '2023-12-02', 'entregue'),
(36, 70.00, 9, '2023-10-15', 'entregue'),
(37, 50.00, 5, '2023-07-08', 'entregue'),
(38, 30.00, 6, '2023-03-07', 'entregue'),
(39, 25.00, 10, '2023-01-08', 'entregue'),
(40, 170.00, 22, '2023-05-07', 'entregue'),
(41, 120.00, 17, '2023-08-09', 'entregue');

-- TABELA ITENS PEDIDO

CREATE TABLE ITENS_PEDIDO (
    ID_PEDIDO INT,
    ID_PRODUTO INT,
    TOTAL DECIMAL(10, 2),
    QTD INT,
    FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
    FOREIGN KEY (ID_PRODUTO) REFERENCES Produtos(ID_produto)
);

INSERT INTO ITENS_PEDIDO (ID_PEDIDO, ID_PRODUTO, TOTAL, QTD)
VALUES
(1, 30, 35.00),
(2, 29, 25.00),
(3, 28, 20.00),
(3, 11, 10.00),
(4, 27, 40.00),
(5, 26, 30.00),
(6, 25, 110.00),
(7, 24, 10000.00),
(8, 23, 4000.00),
(9, 22, 150.00),
(10, 21, 5000.00),
(11, 20, 25.00),
(12, 19, 2000.00),
(13, 18, 90.00),
(14, 17, 18000.00),
(15, 16, 15.00),
(16, 15, 1000.00),
(17, 14, 120.00),
(18, 13, 70.00),
(19, 12, 4000.00),
(20, 11, 10.00),
(21, 10, 10000.00),
(22, 9, 150.00),
(23, 8, 400.00),
(24, 7, 300.00),
(25, 6, 170.00),
(26, 5, 20.00),
(27, 4, 1500.00),
(28, 3, 200.00),
(29, 2, 50.00),
(30, 1, 100.00),
(31, 3, 200.00),
(32, 1, 100.00),
(33, 27, 40.00),
(33, 28, 20.00),
(34, 1, 100.00),
(34, 30, 35.00),
(34, 29, 25.00),
(35, 28, 20.00),
(35, 25, 110.00),
(35, 22, 150.00),
(36, 13, 70.00),
(37, 2, 50.00),
(38, 26, 30.00),
(39, 29, 25.00),
(40, 6, 170.00),
(41, 14, 120.00);    


-- TABELA CUSTO DO PRODUTO

CREATE TABLE custo_do_produto (
    id_custo INT PRIMARY KEY,
    id_produto INT,
    custo_unitario DECIMAL(10, 2),
    quantidade_adquirida INT,
    data DATE,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

INSERT INTO custo_do_produto (id_custo, id_produto, custo_unitario, quantidade_adquirida, data) 
VALUES 
    (1, 1, 60, 10, '2022-09-15'),
    (2, 2, 30, 15, '2022-09-01'),
    (3, 3, 120, 20, '2022-09-17'),
    (4, 4, 1000, 5, '2022-09-18'),
    (5, 5, 9, 30, '2022-09-25'),
    (6, 6, 110, 25, '2022-09-28'),
    (7, 7, 220, 12, '2022-09-25'),
    (8, 8, 330, 8, '2022-09-24'),
    (9, 9, 115, 18, '2022-10-25'),
    (10, 10, 6500, 3, '2022-10-18'),
    (11, 11, 5, 40, '2022-10-19'),
    (12, 12, 2600, 6, '2022-10-27'),
    (13, 13, 35, 22, '2022-10-28'),
    (14, 14, 60, 17, '2022-10-27'),
    (15, 15, 650, 9, '2022-10-12'),
    (16, 16, 8, 35, '2022-11-20'),
    (17, 17, 12000, 2, '2022-11-28'),
    (18, 18, 50, 14, '2022-10-11'),
    (19, 19, 1100, 11, '2022-10-15'),
    (20, 20, 13, 28, '2022-11-15'),
    (21, 21, 3200, 1, '2022-11-18'),
    (22, 22, 80, 16, '2022-11-27'),
    (23, 23, 2800, 7, '2022-11-03'),
    (24, 24, 7500, 4, '2022-11-05'),
    (25, 25, 77, 13, '2022-12-05'),
    (26, 26, 15, 50, '2022-12-25'),
    (27, 27, 20, 40, '2022-12-07'),
    (28, 28, 10, 60, '2022-12-28'),
    (29, 29, 12, 30, '2022-12-08'),
    (30, 30, 13, 45, '2022-12-04');
    

    