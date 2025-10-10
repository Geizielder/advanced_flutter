  # Próximo Evento
  - Obtem dados de evento (nome dp grupo, data do evento e uma lista de jogadores)
  - Os jogadores que não confirmaram presença devem ser exibidos em ordem alfabética
  - Os jogadores que confirmaram presença devem se exibidos por ordem alfabética de confirmação
  - Separa quem confirmou dentro e fora
  - Separar quem confirmou dentro poseição (goleiro e jogador de linha)

  # Jogador
  - Cada jogador tem: nome Foto, posição, status de confirmação e data de confirmação
  - Caso o jogador não tenha foto exbir as iniciais dele no,local da foto
  - As inicias em nomes com sobrenome devem sempre ser a primeira letra do primeiro e do último nome
  - Caso não tenha sobrenome, mostrar as 2 primeiras letras na inicial
  - Se o nome tiver 1 letra, mostrar essa letra na inicial
  - Se o nome estuiver vazio, mostrar um hífem (-) nas inicias
  - Ignorar espaçoes em branco, no final do iniciao ou entre os nomes
  - Sempre mostrar as iniciais maiúsculo

  # API
  - GET para rota https://dominio.com/api/groups/:groupId/next_event
  - Enviar headers "content-type" e "accesp", ambos com valor "application/json"
  - Retornar Unexpeted Error em caso de 400, 403, 404 e 500 não necessita explicar para o cliente
  - Retornar Session Expired Error em caso de 401
  - Retornar dados do evento em caso de 200