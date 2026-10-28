ShowPass - Plataforma de Venda de Ingressos, Controle de Arenas e Gestão de Assentos
O ShowPass é uma solução completa de Banco de Dados Relacional desenvolvida para gerenciar a infraestrutura de bilhetagem, precificação por setor, alocação física de assentos e controle de acesso via QR Code em arenas e eventos de grande porte (shows, jogos, peças de teatro e festivais).
<h1>ShowPass - Resumo e Resultados das Consultas SQL</h1>

<h2>Resumo da Estrutura</h2>
<p>O banco de dados relacional <strong>ShowPass</strong> é composto por 8 tabelas normalizadas (até 4FN):</p>
<ul>
    <li><strong>Infraestrutura:</strong> <code>arenas</code> (1) &rarr; <code>setores</code> (N) &rarr; <code>assentos</code> (N)</li>
    <li><strong>Comercial:</strong> <code>eventos</code> (N) &times; <code>setores</code> (M) &rarr; <code>precos_setor</code></li>
    <li><strong>Vendas:</strong> <code>clientes</code> (1) &rarr; <code>vendas</code> (N) &rarr; <code>ingressos</code> (N)</li>
</ul>

<hr>

<h2>Resultados das 15 Consultas SQL</h2>

<h3>1. Eventos no Estado de SP</h3>
<table>
    <thead>
        <tr>
            <th>nome_evento</th>
            <th>categoria</th>
            <th>data_hora</th>
            <th>arena</th>
            <th>cidade</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Rock World Tour 2026</td>
            <td>Show</td>
            <td>2026-11-15 21:00:00</td>
            <td>Allianz Parque</td>
            <td>São Paulo</td>
        </tr>
    </tbody>
</table>

<h3>2. Clientes com e-mail "@email.com"</h3>
<p><strong>Resultado:</strong> 5 registros retornados em ordem alfabética (Carlos Eduardo Silva, Fernanda Costa Rocha, Lucas Pereira Gomez, Mariana Souza Lima, Roberto Alves Mendes).</p>

<h3>3. Faturamento Bruto por Evento</h3>
<table>
    <thead>
        <tr>
            <th>nome_evento</th>
            <th>total_ingressos_vendidos</th>
            <th>faturamento_total</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Rock World Tour 2026</td>
            <td>3</td>
            <td>R$ 1.550,00</td>
        </tr>
        <tr>
            <td>Symphonic Metal Night</td>
            <td>1</td>
            <td>R$ 500,00</td>
        </tr>
        <tr>
            <td>Final da Copa Clássica</td>
            <td>1</td>
            <td>R$ 450,00</td>
        </tr>
        <tr>
            <td>Festival Pop Brasil</td>
            <td>1</td>
            <td>R$ 200,00</td>
        </tr>
    </tbody>
</table>

<h3>4. Vendas Entre 01/10/2026 e 03/10/2026</h3>
<table>
    <thead>
        <tr>
            <th>id_venda</th>
            <th>cliente</th>
            <th>data_venda</th>
            <th>valor_total</th>
            <th>forma_pagamento</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>Carlos Eduardo Silva</td>
            <td>2026-10-01 10:15:00</td>
            <td>R$ 1.200,00</td>
            <td>Cartão de Crédito</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Mariana Souza Lima</td>
            <td>2026-10-02 11:30:00</td>
            <td>R$ 350,00</td>
            <td>PIX</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Roberto Alves Mendes</td>
            <td>2026-10-03 15:45:00</td>
            <td>R$ 450,00</td>
            <td>Cartão de Crédito</td>
        </tr>
    </tbody>
</table>

<h3>5. Top 3 Eventos por Ticket Médio</h3>
<table>
    <thead>
        <tr>
            <th>nome_evento</th>
            <th>preco_medio_ingresso</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Symphonic Metal Night</td>
            <td>R$ 500,00</td>
        </tr>
        <tr>
            <td>Rock World Tour 2026</td>
            <td>R$ 475,00</td>
        </tr>
        <tr>
            <td>Final da Copa Clássica</td>
            <td>R$ 450,00</td>
        </tr>
    </tbody>
</table>

<h3>6. Eventos com Receita &gt; R$ 400,00</h3>
<p><strong>Resultado:</strong> Rock World Tour 2026 (R$ 1.550,00), Symphonic Metal Night (R$ 500,00) e Final da Copa Clássica (R$ 450,00).</p>

<h3>7. Compras com Mais de 1 Ingresso</h3>
<table>
    <thead>
        <tr>
            <th>id_venda</th>
            <th>cliente</th>
            <th>quantidade_ingressos</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>Carlos Eduardo Silva</td>
            <td>2</td>
        </tr>
    </tbody>
</table>

<h3>8. Assentos Vagos (Evento ID 1 - Allianz Parque)</h3>
<p><strong>Resultado:</strong> 0 assentos vagos cadastrados (todos os assentos inseridos para a arena 1 já possuem ingressos associados).</p>

<h3>9. Comprovante da Venda ID 1</h3>
<table>
    <thead>
        <tr>
            <th>cliente</th>
            <th>cpf</th>
            <th>nome_evento</th>
            <th>arena</th>
            <th>setor</th>
            <th>assento</th>
            <th>codigo_qr</th>
            <th>valor</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Carlos Eduardo Silva</td>
            <td>111.222.333-44</td>
            <td>Rock World Tour 2026</td>
            <td>Allianz Parque</td>
            <td>Pista Premium</td>
            <td>PP-A01</td>
            <td>QR-ROCK2026-001</td>
            <td>R$ 600,00</td>
        </tr>
        <tr>
            <td>Carlos Eduardo Silva</td>
            <td>111.222.333-44</td>
            <td>Rock World Tour 2026</td>
            <td>Allianz Parque</td>
            <td>Pista Premium</td>
            <td>PP-A02</td>
            <td>QR-ROCK2026-002</td>
            <td>R$ 600,00</td>
        </tr>
    </tbody>
</table>

<h3>10. Total de Eventos por Categoria</h3>
<table>
    <thead>
        <tr>
            <th>categoria</th>
            <th>total_eventos</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Show</td>
            <td>2</td>
        </tr>
        <tr>
            <td>Futebol</td>
            <td>1</td>
        </tr>
        <tr>
            <td>Festival</td>
            <td>1</td>
        </tr>
        <tr>
            <td>Teatro</td>
            <td>1</td>
        </tr>
    </tbody>
</table>

<h3>11. Arrecadação por Forma de Pagamento</h3>
<table>
    <thead>
        <tr>
            <th>forma_pagamento</th>
            <th>quantidade_vendas</th>
            <th>total_processado</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Cartão de Crédito</td>
            <td>2</td>
            <td>R$ 1.650,00</td>
        </tr>
        <tr>
            <td>PIX</td>
            <td>2</td>
            <td>R$ 550,00</td>
        </tr>
        <tr>
            <td>Boleto Bancário</td>
            <td>1</td>
            <td>R$ 500,00</td>
        </tr>
    </tbody>
</table>

<h3>12. Validação de Catraca (Evento ID 1)</h3>
<table>
    <thead>
        <tr>
            <th>id_ingresso</th>
            <th>codigo_qr</th>
            <th>titular</th>
            <th>assento</th>
            <th>status</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>QR-ROCK2026-001</td>
            <td>Carlos Eduardo Silva</td>
            <td>PP-A01</td>
            <td>Valido</td>
        </tr>
        <tr>
            <td>2</td>
            <td>QR-ROCK2026-002</td>
            <td>Carlos Eduardo Silva</td>
            <td>PP-A02</td>
            <td>Valido</td>
        </tr>
        <tr>
            <td>3</td>
            <td>QR-ROCK2026-003</td>
            <td>Mariana Souza Lima</td>
            <td>CI-B10</td>
            <td>Valido</td>
        </tr>
    </tbody>
</table>

<h3>13. Arenas com Capacidade &ge; 50.000</h3>
<table>
    <thead>
        <tr>
            <th>nome</th>
            <th>cidade</th>
            <th>estado</th>
            <th>capacidade_total</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Maracanã</td>
            <td>Rio de Janeiro</td>
            <td>RJ</td>
            <td>78.000</td>
        </tr>
        <tr>
            <td>Mineirão</td>
            <td>Belo Horizonte</td>
            <td>MG</td>
            <td>62.000</td>
        </tr>
        <tr>
            <td>Arena do Grêmio</td>
            <td>Porto Alegre</td>
            <td>RS</td>
            <td>55.000</td>
        </tr>
    </tbody>
</table>

<h3>14. Estatísticas de Preços dos Ingressos</h3>
<table>
    <thead>
        <tr>
            <th>menor_preco</th>
            <th>maior_preco</th>
            <th>preco_medio_geral</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>R$ 200,00</td>
            <td>R$ 600,00</td>
            <td>R$ 420,00</td>
        </tr>
    </tbody>
</table>

<h3>15. Ingressos Vendidos por Setor</h3>
<table>
    <thead>
        <tr>
            <th>nome_setor</th>
            <th>nome_arena</th>
            <th>ingressos_vendidos</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Pista Premium</td>
            <td>Allianz Parque</td>
            <td>2</td>
        </tr>
        <tr>
            <td>Cadeira Inferior</td>
            <td>Allianz Parque</td>
            <td>1</td>
        </tr>
        <tr>
            <td>Maracanã Mais</td>
            <td>Maracanã</td>
            <td>1</td>
        </tr>
        <tr>
            <td>Arquibancada Amarela</td>
            <td>Mineirão</td>
            <td>1</td>
        </tr>
        <tr>
            <td>Setor VIP Central</td>
            <td>Ligga Arena</td>
            <td>1</td>
        </tr>
    </tbody>
</table>

