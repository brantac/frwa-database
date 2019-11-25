# Banco de dados da Aplicação de Reconhecimento de Alimentos
A Aplicação de Reconhecimento de Alimentos tem, como uma de suas responsabilidades, que registrar os usuários e suas refeições, guardar as relações entre os usuários - que inicialmente suporta apenas a relação entre um usuário comum e um usuário instrutor - e ter o um catálogo de vários alimentos e as suas composições nutricionais.

O catálogo de alimentos foi importado de uma tabela denomidada TACO, ou Tabela Brasileira de Composição de alimentos. Essa tabela foi construída e atualizada ao logo do tempo, desde 2004, quando ela teve a sua primeira versão lançada, com 198 alimentos. Atualmente, a tabela possui 597 alimentos. [Clique aqui](http://www.nepa.unicamp.br/taco/tabela.php?ativo=tabela) para ir para a página oficial da tabela TACO.

No banco de dados desta aplicação, temos as seguintes tabelas:
- appuser
- common
- instructor
- food
- meal
- meal_food
- relationship
- relationship_type

## appuser
Tabela com todos os usuários cadastrados.

## common
Tabela subtipo da tabela appuser. Atualmente, ela guarda apenas o ID do instrutor de um usuário. (Há dúvidas quanto a relevância dessa tabela)

## instructor
Tabela subtipo da tabela appuser, que guarda a profissão de um usuário instrutor.

## food
Tabela com o catálogo de comidas da tabela TACO.

## meal
Tabela com todas as refeições dos usuários.

## meal_food
Tabela com os alimentos de cada refeição.

## relationship
Tabela que guarda o relacionamento entre os usuários. Quem conhece quem e qual é o tipo de relação.

## relationship_type
Tabela que guarda os tipos de relacionamentos que pode existir entre os usuários (por exemplo: amigos; instrutor; cliente).

# O que há nesse repositório?
Nesse repositório temos os scripts de criação do banco de dados, as tabelas, as inserções iniciais e algumas funções importantes para a aplicação, como a *stored procedure* salvarRefeicao(), que salva uma refeição quando o usuário confirma que acabou de adicionar os alimentos.

## Passo a passo
1. Execute o script **initial_script.sql** para criar o Banco de Dados e criar as tabelas
2. Execute **initial_insertions.sql** para inserir criar um usuário comum e um instrutor.
3.Execute o script **import_taco.sql** para importar a tabela TACO para a tabela **food**.
4. As tabelas já estão prontas para serem utilizadas.