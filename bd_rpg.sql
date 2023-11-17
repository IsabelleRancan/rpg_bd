--\set QUIET ON
--\c ps
DROP TABLE IF EXISTS Multiclasse;
DROP TABLE IF EXISTS Personagem;
DROP TABLE IF EXISTS Racas;
DROP TABLE IF EXISTS Hab_Raca;
DROP TABLE IF EXISTS Origens;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Hab_Classes;
DROP TABLE IF EXISTS Poderes_Classes;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Hab_Raca
(
	nomeRacaPertence varchar(60) not null,
	nomeHabRaca varchar(60) not null primary key,
	descricaoHabRaca varchar(600) not null
);

CREATE TABLE Racas
(
	nomeRaca varchar(40) not null primary key,
	modAtributo varchar(100) not null,
	nomeHabRaca varchar(60) not null  references Hab_Raca (nomeHabRaca)
);

CREATE TABLE Origens
(
	nomeOrigem varchar(40) not null primary key,
	itens varchar(200) not null,
	beneficios varchar(200) not null,
	nomeHabOrigem varchar (60) not null,
	descricaoHabOrigem varchar (600) not null
);

CREATE TABLE Hab_Classes
(
	nomeHabClasse varchar(40) not null primary key,
	nomeClassePertence varchar(60) not null,
	preRequisito varchar(100),
	descricaoHabClasse varchar (1200) not null
);

CREATE TABLE Poderes_Classes
(
	nomePoderClasse varchar(40) not null primary key,
	nomeClassePertence varchar(60) not null,
	preRequisito varchar(100),
	descricaoPoderClasse varchar (1000) not null
);

CREATE TABLE Classes
(
	nomeClasse varchar(40) not null primary key,
	pontosVida varchar(120) not null,
	pontosMana varchar(20) not null,
	pericias varchar(450) not null,
	proeficiencias varchar(45) not null,
	nomeHabClasse varchar(60) not null references Hab_classes(nomeHabClasse),
	nomePoderClasse varchar(60) not null references Poderes_classes(nomePoderClasse)
);

CREATE TABLE Personagem
(
	nomePersonagem varchar(40) not null primary key,
	nivelPersonagem  varchar(2) not null,
	atrFor int not null,
	atrDes int not null,
	atrCons int not null,
	atrInt int not null,
	atrSab int not null,
	atrCar int not null,
	nomeRaca varchar(40) not null references Racas (nomeRaca),
	nomeOrigem varchar(40) not null references Origens (nomeOrigem)
);

CREATE TABLE Multiclasse 
(
	nomePersonagem varchar(40) not null references Personagem (nomePersonagem),
	nomeClasse varchar(40) not null references Classes (nomeClasse)
);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Hab_Raca (nomeRacaPertence, nomeHabRaca, descricaoHabRaca)
VALUES 
	('Humano','Versátil','Você se torna treinado em duas perícias a sua escolha (não precisam ser da sua classe). Você pode trocar uma dessas perícias por um poder geral a sua escolha.'),
	('Anão','Conhecimento das Rochas','Você recebe visão no escuro e +2 em testes de Percepção e Sobrevivência realizados no subterrâneo.'),
	('Anão','Devagar e Sempre','Seu deslocamento é 6m (em vez de 9m). Porém, seu deslocamento não é reduzido por uso de armadura ou excesso de carga'),
	('Anão','Duro como Pedra','Você recebe +3 pontos de vida no 1° nível e +1 por nível seguinte.'),
	('Anão','Tradição de Heredrimm','Você é perito nas armas tradicionais anãs, seja por ter treinado com elas, seja por usá-las como ferramentas de ofício. Para você, todos os machados, martelos, marretas e picaretas são armas simples. Você recebe +2 em ataques com essas armas.'),
	('Dahllan','Amiga das Plantas','Você pode lançar a magia Controlar Plantas (atributo-chave Sabedoria). Caso aprenda novamente essa magia, seu custo diminui em -1 PM.'),
	('Dahllan','Armadura de Allihanna','Você pode gastar uma ação de movimento e 1 PM para transformar sua pele   em casca de árvore, recebendo +2 na Defesa até o fim da cena.'),
	('Dahllan','Empatia Selvagem','Você pode se comunicar com animais por meios de linguagem corporal e colaização. Você pode usar Adestramento para mudar a atitude e pedir favores de animais (veja Diplomacia). Caso receba esta habilidade novamente, recebe +2 em Adestramento'),
	('Elfo','Graça de Glórienn','Seu deslocamento é 12m (em vez de 9m).'),
	('Elfo','Herança Feérica','Você recebe +1 ponto de mana por nível'),
	('Elfo','Sentidos Élficos','Você recebe visão na penumbra e +2 em Misticismo e Percepção'),
	('Goblin','Engenhoso','Você não sofre penalidades em testes de perícia por não usar kits, Se usar o kit, você recebe +2 no teste de perícia.'),
	('Goblin','Espelunqueiro','Você recebe visão no escuro e deslocamento de escalada igual ao seu deslocamento terrestre.'),
	('Goblin','Peste Esguia','Seu tamanho é Pequeno, mas seu deslocamento se mantém 9m.Apesar de pequenos, goblins são rápidos'),
	('Goblin','Rato das Ruas','Você recebe +2 em Fortitude e sua recuperação de PV e PM nunca é inferior ao seu nível.'),
	('Lefou','Cria da Tormenta','Você é uma criatura do tipo Monstro e recebe +5 em testes de resistência contra efeitos causados por lefeu e pela Tormenta'),
	('Lefou','Deformidade','Todo lefou possui defeitos físicos que, embora desagradáveis, conferem certas vantagens. Você recebe +2 em duas perícias a sua escolha. Cada um desses bônus conta como um poder da Tormenta. Você pode trocar um desses bônus por um poder da Tormenta a sua escolha. Esta habilidade não causa perda de Carisma.'),
	('Minotauro','Chifres','Você possui uma arma natural de chifres (dano 1d6, crítico x2, perfuração). Quando    usa a ação atacar, pode gastar 1 PM para fazer um ataque corpo a corpo extra com os chifres.'),
	('Minotauro','Couro Rígido','Sua pele é dura como a de um touro. Você recebe +1 na Defesa'),
	('Minotauro','Faro','Você tem olfato apurado. Você não fica desprevenido e sofre apenas camuflagem (em vez de camuflagem total) contra inimigos em alcance curto que não possa ver.'),
	('Minotauro','Medode Altura','Se estiver adjacente a uma queda de 3m ou mais de altura (como um buraco ou penhasco), você fica abalado'),
	('Qareen','Desejos','Se lançar uma magia que alguém tenha pedido desde seu último turno, o custo da magia diminui em –1 PM. Fazer um desejo ao qareen é uma ação livre.'),
	('Qareen','Resistência Elemental','Conforme sua ascendência, você recebe resistência 10 a um tipo de dano. Escolha uma: frio (qareen da água), eletricidade (do ar), fogo (do fogo), ácido (da terra), luz (da luz) ou trevas (qareen das trevas).'),
	('Qareen','Tatuagem Mística','Você pode lançar uma magia de 1º círculo a sua escolha (atributo-chave Carisma). Caso aprenda novamente essa magia, seu custo diminui em –1 PM.');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Racas (nomeRaca, modAtributo, nomeHabRaca)
VALUES
    ('Humano', '+2 em Três Atributos Diferentes.', 'Versátil'),
    ('Anão', 'Constituição +4, Sabedoria +2, Destreza –2.', 'Conhecimento das Rochas'),
    ('Dahllan', 'Sabedoria +4, Destreza +2, Inteligência –2.', 'Amiga das Plantas'),
    ('Elfo', 'Inteligência +4, Destreza +2, Constituição -2', 'Graça de Glórienn'),
    ('Goblin', 'Destreza +4, Inteligência +2, Carisma –2.', 'Engenhoso'),
    ('Lefou', '+2 em Três Atributos Diferentes (exceto Carisma), Carisma –2.', 'Cria da Tormenta'),
    ('Minotauro', 'Força +4, Constituição +2, Sabedoria –2.', 'Chifres'),
    ('Qareen', 'Carisma +4, Inteligência +2, Sabedoria –2.', 'Desejos');


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Origens (nomeOrigem, itens, beneficios, nomeHabOrigem, descricaoHabOrigem)
VALUES
    ('Acólito', 'Símbolo Sagrado, traje de sacerdote', 'Cura, Religião, Vontade (perícias); Medicina, Membro da Igreja, Vontade de Ferro (poderes).', 'Membro da Igreja', 'Você consegue hospedagem e informação em qualquer templo de sua divindade, para você e seus aliados.'),
    ('Amigo dos Animais', 'Cão de guarda, cavalo, pônei ou trobo (escolha um).', 'Adestramento, Cavalgar (perícias); Amigo Especial (poder).', 'Amigo Especial', 'Você recebe +5 em testes de Adestramento com animais comuns. Além disso, possui um animal de estimação que o auxilia e o acompanha em suas aventuras. Em termos de jogo, é um aliado que fornece +2 em uma perícia a sua escolha (exceto Luta ou Pontaria e aprovada pelo mestre) e não conta em seu limite de aliados.'),
    ('Amnésico', 'Um ou mais itens (somando até T$ 100), que podem ser uma pista misteriosa da sua vida antiga.', 'Em vez de dois benefícios de uma lista, você recebe uma perícia e um poder escolhidos pelo mestre e o poder Lembranças Graduais.', 'Lembranças Graduais', 'Durante suas aventuras, em determinados momentos a critério do mestre, você pode fazer um teste de Sabedoria (CD 10) para reconhecer pessoas, criaturas ou lugares que tenha encontrado antes de perder a memória.'),
    ('Aristocrata', 'Joia de família no valor de T$ 100, traje da corte.', 'Diplomacia, Enganação, Nobreza (perícias); Comandar, Sangue Azul (poderes).', 'Sangue Azul', 'Você tem alguma influência política, suficiente para ser tratado com mais leniência pela guarda, conseguir uma audiência com o nobre local etc.'),
    ('Artesão', 'Kit de ofício (qualquer), um item que você possa fabricar de até T$ 50.', 'Ofício, Vontade (perícias); Frutos do Trabalho, Sortudo (poderes).', 'Fruto do Trabalho', 'Quando passa em um teste de Ofício para sustento, você recebe o dobro do dinheiro.'),
    ('Assistente de Laboratório', 'Kit de Ofício (alquimia).', 'Ofício (alquimia), Misticismo (perícias); Esse Cheiro..., Venefício, um poder da Tormenta a sua escolha (poderes).', 'Esse Cheiro...', 'Você recebe +2 em Fortitude e passa automaticamente em testes de Ofício (alquimia) para identificar itens alquímicos.'),
    ('Batedor', 'Barraca, uma arma simples ou marcial de ataque à distância.', 'Furtividade, Percepção, Sobrevivência (perícias); À Prova de Tudo, Estilo de Disparo, Sentidos Aguçados (poderes).', 'A Prova de Tudo', 'Você não sofre penalidade em deslocamento e Sobrevivência por clima ruim e por terreno difícil natural.'),
    ('Capanga', 'Tatuagem ou outro adereço de sua gangue aprimorado (+2 em Intimidação), uma arma simples corpo a corpo.', 'Luta, Intimidação (perícias); Confissão, um poder de combate a sua escolha (poderes).', 'Confissão', 'Você pode usar Intimidação para obter informação sem custo (Veja Investigação)'),
    ('Charlatão', 'Joia falsificada (valor aparente de T$ 100, sem valor real), kit de disfarces (esse é de verdade).', 'Enganação, Jogatina (perícias); Alpinista Social, Aparência Inofensiva, Sortudo (poderes).', 'Alpinista Social', 'Você pode substituir testes de Diplomacia por testes de Enganação.'),
    ('Circense', 'Traje de artista, três bolas coloridas para malabarismo, um baralho.', 'Acrobacia, Atuação, Reflexos (perícias); Acrobático, Torcida, Truque de Mágica (poderes).', 'Truque de Mágica', 'Você pode lançar Explosão de Chamas, Hipnotismo e Transmutar Objetos, mas apenas com o aprimoramento Truque. Esta não é uma habilidade mágica — os efeitos provêm de truques e prestidigitação.'),
    ('Criminoso', 'Kit de ladrão ou kit de disfarces.', 'Enganação, Furtividade, Ladinagem (perícias); Punguista, Venefício (poderes).', 'Punguista', 'Você pode fazer testes de Ladinagem para sustento, como a perícia Ofício.'),
    ('Curandeiro', 'Bálsamo restaurador, kit de medicamentos.', 'Cura, Vontade (perícias); Medicina, Médico de Campo, Venefício (poderes).', 'Médico de Campo', 'Quando você faz primeiros socorros em um personagem com 0 ou menos PV, ele recupera 1d6 PV.'),
    ('Eremita', 'Barraca, kit de medicamentos.', 'Misticismo, Religião, Sobrevivência (perícias); Busca Interior, Lobo Solitário (poderes).', 'Busca Interior', 'Quando você e seus companheiros estão diante de um mistério, incapazes de prosseguir, você pode gastar 1 PM para meditar sozinho durante algum tempo e receber uma dica do mestre.'),
    ('Estudioso', 'Um livro aprimorado (+2 em Conhecimento, Guerra ou Misticismo), outros três livros comuns a sua escolha.', 'Conhecimento, Guerra, Misticismo (perícias); Aparência Inofensiva, Palpite Fundamentado (poderes).', 'Palpite Fundamentado', 'Você pode gastar 2 PM para substituir um teste de qualquer perícia originalmente baseada em Inteligência ou Sabedoria por um teste de Conhecimento.'),
    ('Fazendeiro', 'Uma ferramenta agrícola (mesmas estatísticas de uma lança), 10 rações de viagem, um animal não combativo (como uma galinha, porco ou ovelha).', 'Adestramento, Cavalgar, Ofício (fazendeiro), Sobrevivência (perícias); Água no Feijão, Ginete (poderes).', 'Água no Feijão', 'Você gasta apenas metade da matéria-prima para testes de Ofício (cozinheiro).'),
    ('Forasteiro', 'Um diário de viagens, um traje de viagem estrangeiro, um instrumento musical exótico.', 'Cavalgar, Pilotagem, Sobrevivência (perícias); Cultura Exótica, Lobo Solitário (poderes).', 'Cultura Exótica', 'Por sua diferente visão de mundo, você encontra soluções inesperadas. Você pode gastar 1 PM para fazer um teste de perícia somente treinada, mesmo sem ser treinado na perícia.'),
    ('Guarda', 'Apito, insígnia da milícia, uma arma marcial.', 'Investigação, Luta, Percepção (perícias); Detetive, Investigador, um poder de combate a sua escolha (poderes).', 'Detetive', 'Você pode substituir testes de Percepção e Intuição por testes de Investigação.'),
    ('Herdeiro', 'Um símbolo de sua herança, como um anel de sinete ou manto cerimonial. Enquanto estiver com esse item, você pode ser reconhecido por sua descendência, o que pode ser bom... ou não!', 'Misticismo, Nobreza, Ofício (perícias); Comandar, Herança (poderes).', 'Herança', 'Você herdou um item de preço de até T$ 1.000. Você pode escolher este poder duas vezes, para um item de até T$ 2.000.'),
    ('Herói Camponês', 'Kit de ofício ou uma arma simples, traje de plebeu.', 'Adestramento, Ofício (perícias); Amigo dos Plebeus, Sortudo, Surto Heroico, Torcida (poderes).', 'Amigo dos Plebeus', 'Você consegue hospedagem gratuita, para você e seus aliados, em famílias ou comunidades plebeias.'),
    ('Marujo', 'T$ 2d6 (seu último salário), corda.', 'Atletismo, Jogatina, Pilotagem (perícias); Acrobático, Passagem de Navio (poderes).', 'Passagem de Navio', 'Você consegue transporte marítimo para você e seus companheiros, sem custos, desde que todos paguem com trabalho (passar em pelo menos um teste de perícia adequado durante a viagem).'),
    ('Soldado', 'Uma arma marcial, um uniforme militar, uma insígnia de seu exército.', 'Fortitude, Guerra, Luta, Pontaria (perícias); Influência Militar, um poder de combate a sua escolha (poderes).', 'Influência Militar', 'Você fez amigos nas forças armadas. Onde houver acampamentos ou bases militares, você pode conseguir hospedagem e informações para você e seus aliados.');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Hab_Classes (nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES 
	('Caminho do Arcanista: Bruxo','Arcanista','','A magia é um poder incrível, capaz de alterar a realidade. Esse poder tem fontes distintas e cada uma opera conforme suas próprias regras. Escolha uma das opções a seguir. Uma vez feita, essa escolha não pode ser mudada./n • Bruxo. Você lança magias através de um foco — uma varinha, cajado, chapéu... Para lançar uma magia, você precisa segurar o foco com uma mão (e gesticular com a outra) ou fazer um teste de Misticismo (CD 20 + o custo em PM da magia; se falhar, a magia não funciona, mas você gasta os PM mesmo assim). O foco tem resistência a dano 10 e PV iguais à metade dos seus, independentemente de seu material ou forma. Se for danificado, é totalmente restaurado na próxima vez que você recuperar seus PM. Se for destruído (reduzido a 0 PV), você fica atordoado por uma rodada. Você pode recuperar um foco destruído ou perdido com uma semana de trabalho e T$ 100. Seu atributo-chave para magias é Inteligência.'),
	('Caminho do Arcanista: Feiticeiro','Arcanista','','• Feiticeiro. Você lança magias através de um poder inato que corre em seu sangue. Escolha uma linhagem como origem de seus poderes. Você recebe a herança básica da linhagem escolhida. Você não depende de nenhum item ou estudo, mas sua capacidade de aprender magias é limitada — você aprende uma magia nova a cada nível ímpar (3º, 5º, 7º etc.), em vez de a cada nível. Seu atributo-chave para magias é Carisma.'),
	('Caminho do Arcanista: Mago','Arcanista','','• Mago. Você lança magias através de estudo e memorização de fórmulas arcanas. Você só pode lançar magias memorizadas; suas outras magias não podem ser lançadas, mesmo que você tenha pontos de mana para tal. Para memorizar magias, você precisa estudar seu grimório por uma hora. Quando faz isso, escolhe metade das magias que conhece (por exemplo, se conhece 7 magias, escolhe 3). Essas serão suas magias memorizadas. Você pode memorizar magias uma vez por dia. Caso não possa estudar (por não ter tempo, por ter perdido o grimório...), não poderá trocar suas magias memorizadas. Um grimório tem as mesmas estatísticas de um foco (veja acima) e pode ser recuperado da mesma forma. Você começa com uma magia adicional (para um total de 4) e, sempre que ganha acesso a um novo círculo de magias, aprende uma magia adicional daquele círculo. Seu atributo-chave para magias é Inteligência.'),
	('Magias - Arcanista','Arcanista','','Você pode lançar magias arcanas de 1º círculo. A cada quatro níveis, pode lançar magias de um círculo maior (2º círculo no 5º nível, 3º círculo no 9º nível e assim por diante). /nVocê começa com três magias de 1º círculo. A cada nível, aprende uma magia de qualquer círculo que possa lançar. /nSeu atributo-chave para lançar magias é definido pelo seu Caminho (veja acima) e você soma o bônus do atributo-chave no seu total de PM. Veja o Capítulo 4 do Livro para as regras de magia.'),
	('Alta Arcana','Arcanista','Nível 20','No 20º nível, seu domínio das artes arcanas é total. O custo em PM de suas magias arcanas é reduzido à metade (após aplicar aprimoramentos e quaisquer outros efeitos que reduzam custo).'),
	('Linhagem Sobrenatural: Dracônica', 'Arcanista', 'Feiticeiro', 'Um de seus antepassados foi um majestoso dragão. Escolha um tipo de dano entre ácido, eletricidade, fogo ou frio. /n• Básica. Você soma seu modificador de Carisma em seus pontos de vida iniciais e recebe resistência ao tipo de dano escolhido 5. /n• Aprimorada. Suas magias do tipo escolhido custam –1 PM e causam +1 ponto de dano por dado. /n• Superior. Você passa a somar o dobro do seu modificador de Carisma em seus pontos de vida iniciais e se torna imune a dano do tipo escolhido. Além disso, sempre que reduz um ou mais inimigos a 0 PV ou menos com uma magia do tipo escolhido, você recebe uma quantidade de PM temporários igual ao círculo da magia.'),
	('Linhagem Sobrenatural: Feérica', 'Arcanista', 'Feiticeiro', 'Seu sangue foi tocado pelas fadas. /n• Básica. Você se torna treinado em Enganação e aprende uma magia de 1º círculo de encantamento ou ilusão, arcana ou divina, a sua escolha. /n• Aprimorada. A CD para resistir a suas magias de encantamento e ilusão aumenta em +2 e suas magias dessas escolas custam –1 PM. /n• Superior. Você recebe +4 em Carisma. Se uma criatura passar no teste de resistência contra uma magia de encantamento ou ilusão lançada por você, você fica alquebrado até o final da cena.'),
	('Linhagem Sobrenatural: Rubra', 'Arcanista', 'Feiticeiro', 'Seu sangue foi corrompido pela Tormenta. /n• Básica. Você recebe um poder da Tormenta. Quando adquire um poder da Tormenta, você pode aplicar a penalidade em Carisma a outro atributo. Sua relação com a invasão aberrante lhe permite sacrificar partes específicas de seu ser. /n• Aprimorada. Escolha uma magia para cada poder da Tormenta que você possui. Essas magias custam –2 PM. Sempre que recebe um novo poder da Tormenta, você pode escolher uma nova magia. Esta herança conta como um poder da Tormenta. /n• Superior. Você recebe +4 PM para cada poder da Tormenta que tiver. Esta herança conta como um poder da Tormenta.');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES
	('Fúria','Barbaro','','Você pode gastar 2 PM para invocar uma fúria selvagem, tornando-se temível em combate. Você recebe +2 em testes de ataque e rolagens de dano corpo a corpo, mas não pode fazer nenhuma ação que exija calma e concentração (como usar a perícia Furtividade ou lançar magias). A cada cinco níveis, pode gastar +2 PM para aumentar os bônus em +1. /nA Fúria termina se, ao fim da rodada, você não tiver atacado nem sido alvo de um efeito (ataque, habilidade, magia...) hostil.'),
	('Instinto Selvagem','Barbaro','Nível 3','No 3º nível, você recebe +1 em Percepção e Reflexos. A cada seis níveis, esse bônus aumenta em +1.'),
	('Resistência a Dano','Barbaro','Nível 5','A partir do 5º nível, graças a seu vigor e força de vontade, você ignora parte de seus ferimentos. Você recebe resistência a dano 2 (todo dano que sofre é reduzido em 2). A cada três níveis, sua RD aumenta em 2, até um máximo de RD 10 no 17º nível.'),
	('Fúria Titânica','Barbaro','Nível 20','No 20º nível, o bônus que você recebe nos testes de ataque e rolagens de dano quando usa Fúria é dobrado. Por exemplo, se gastar 8 PM, em vez de um bônus de +5, recebe um bônus de +10.');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES 
	('Inspiração','Bardo','','Você pode gastar uma ação padrão e 2 PM para inspirar as pessoas com sua música (ou outro tipo de arte, como dança). Você e todos os seus aliados em alcance curto ganham +1 em testes de perícia até o fim da cena. A cada quatro níveis, pode gastar +2 PM para aumentar o bônus em +1.'),
	('Magias - Bardo','Bardo','','Escolha três escolas de magia. Uma vez feita, essa escolha não pode ser mudada. Você pode lançar magias arcanas de 1º círculo que pertençam a essas escolas. À medida que sobe de nível, pode lançar magias de círculos maiores (2º círculo no 6º nível, 3º círculo no 10º nível e 4º círculo no 14º nível). /nVocê começa com duas magias de 1º círculo. A cada nível par (2º, 4º etc.), aprende uma magia de qualquer círculo e escola que possa lançar. Você pode lançar essas magias vestindo armaduras leves sem precisar de testes de Misticismo. /nSeu atributo-chave para lançar magias é Carisma e você soma seu bônus de Carisma no seu total de PM. Veja o Capítulo 4 para as regras de magia.'),
	('Eclético','Bardo','nível 2','A partir do 2º nível, você pode gastar 1 PM para receber todos os benefícios de ser treinado em uma perícia por um teste.'),
	('Artista Completo','Bardo','Nível 20','No 20º nível, você pode usar Inspiração como uma ação livre. Enquanto estiver sob efeito de sua Inspiração, qualquer habilidade de bardo (incluindo magias) que você usar tem seu custo em PM reduzido pela metade (após aplicar quaisquer outras habilidades que reduzam o custo).');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES 
	('Audácia','Bucaneiro','','Quando faz um teste de perícia, você pode gastar 2 PM para receber um bônus igual ao seu modificador de Carisma no teste. Você não pode usar esta habilidade em testes de ataque.'),
	('Insolência','Bucaneiro','','Você soma seu bônus de Carisma na Defesa, limitado pelo seu nível. Esta habilidade exige liberdade de movimentos; você não pode usá-la se estiver de armadura pesada ou na condição imóvel.'),
	('Evasão - Bucaneiro','Bucaneiro','Nível 2','A partir do 2º nível, quando sofre um ataque que permite um teste de Reflexos para reduzir o dano à metade, você não sofre dano algum se passar. Você ainda sofre dano normal se falhar no teste de Reflexos. Esta habilidade exige liberdade de movimentos; você não pode usá-la se'),
	('Esquiva Sagaz','Bucaneiro','Nível 3','No 3º nível, você recebe +1 na Defesa. Esse bônus aumenta em +1 a cada quatro níveis. Esta habilidade exige liberdade de movimentos; você não pode usá-la se estiver de armadura pesada ou na condição imóvel.'),
	('Panache','Bucaneiro','Nível 5','partir do 5º nível, sempre que faz um acerto crítico em combate ou reduz um inimigo a 0 PV, você recupera 1 PM.'),
	('Evasão Aprimorada - Bucaneiro','Bucaneiro','Nível 10','A partir do 10º nível, quando sofre um ataque que permite um teste de Reflexos para reduzir o dano à metade, você não sofre dano algum se passar e sofre apenas metade do dano se falhar. Esta habilidade exige liberdade de movimentos; você não pode usá-la se estiver de armadura pesada ou na condição imóvel.'),
	('Sorte de Nimb','Bucaneiro','Nível 20','No 20º nível, o bucaneiro está acostumado a encarar os piores desafios e rir na cara deles — pois sabe que tem a sorte ao seu lado. Você pode gastar 5 PM para rolar novamente um teste recém realizado. Qualquer resultado 11 ou mais na segunda rolagem será considerado um 20 natural.');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
	VALUES ('Marca da Presa','Cacador','','Você pode gastar uma ação de movimento e 1 PM para analisar uma criatura em alcance curto. Até o fim da cena, você recebe +1d4 nas rolagens de dano contra essa criatura. A cada quatro níveis, você pode gastar +1 PM para aumentar o bônus de dano (veja a tabela da classe).'),
	('Rastreador','Cacador','','Você recebe +2 em Sobrevivência. Além disso, pode se mover com seu deslocamento normal enquanto rastreia sem sofrer penalidades no teste de Sobrevivência.'),
	('Explorador','Cacador','Nível 3','No 3º nível, escolha um tipo de terreno entre aquático, ártico, colina, deserto, floresta, montanha, pântano, planície, subterrâneo ou urbano. A partir do 11º nível, você também pode escolher área de Tormenta. Quando estiver no tipo deterreno escolhido, você soma seu bônus de Sabedoria (mínimo +1) na Defesa e nos testes de Acrobacia, Atletismo, Furtividade, Percepção e Sobrevivência. A cada quatro níveis, escolha outro tipo de terreno para receber o bônus ou aumente o bônus em um tipo de terreno já escolhido em +2.'),
	('Caminho do Explorador','cacador','Nível 5','No 5º nível, você pode atravessar terrenos difíceis sem sofrer redução em seu deslocamento e a CD para rastrear você aumenta em +10. Esta habilidade só funciona em terrenos nos quais você tenha a habilidade Explorador.'),
	('Mestre Caçador','Cacador','Nível 20','No 20º nível, você pode sar a habilidade Marca da Presa como uma ação ivre. Além disso, quando usa a habilidade, pode astar +5 PM para aumentar sua margem de ameaça ontra a criatura em +2. Se você reduz uma criatura ontra a qual usou Marca da Presa a 0 pontos de vida, ecupera 5 PM.');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES 
	('Código de Honra','Cavaleiro','','Cavaleiros distinguem-se de meros combatentes por seguir um código de conduta. Fazem isto para mostrar que estão acima dos mercenários e bandoleiros que infestam os campos de batalha. Você não pode atacar um oponente pelas costas (em termos de jogo, não pode se beneficiar do bônus de flanquear), caído, desprevenido ou incapaz de lutar. Se violar o código, você perde todos os seus PM e só pode recuperá-los a partir do próximo dia. Rebaixar-se ao nível dos covardes e desesperados abala a autoconfiança que eleva o cavaleiro.'),
	('Baluarte','Cavaleiro','','Você pode gastar 1 PM para receber +2 na Defesa e nos testes de resistência até o início do seu próximo turno. A cada quatro níveis, pode gastar +1 PM para aumentar o bônus em +2./n A partir do 7º nível, quando usa esta habilidade, você pode gastar 2 PM adicionais para fornecer o mesmo bônus a todos os aliados adjacentes. Por exemplo, pode gastar 4 PM ao todo para receber +4 na Defesa e nos testes de resistência e fornecer este mesmo bônus aos outros. A partir do 15º nível, você pode gastar 5 PM adicionais para fornecer o mesmo bônus a todos os aliados em alcance curto.'),
	('Duelo','Cavaleiro','Nível 2','A partir do 2º nível, você pode gastar 2 PM para escolher um inimigo em alcance curto e receber +1 em testes de ataque e rolagens de dano contra ele até o fim da cena. Se atacar outro inimigo, o bônus termina. Para cada 2 PM extras que você gastar, o bônus aumenta em +1.'),
	('Caminho do Cavaleiro','Cavaleiro','Nível 5','No 5º nível, escolha entre Bastião ou Montaria. /n• Bastião. Se estiver usando armadura pesada, você recebe resistência a dano 5 (cumulativa com a RD fornecida por Especialização em Armadura). /n• Montaria. Você recebe um cavalo de guerra com o qual possui +5 em testes de Adestramento e Cavalgar. Ele fornece os benefícios de um aliado iniciante de seu tipo. No 11º nível, passa a fornecer os benefícios de um aliado veterano e, no 17º nível, de um aliado mestre. De acordo com o mestre, você pode receber outro tipo de montaria. Veja a lista de aliados no Capítulo 6: O Mestre. Caso a montaria morra, você pode comprar outra pelo preço normal e treiná-la para receber os benefícios deste poder com uma semana de trabalho.'),
	('Resoluto','Cavaleiro','Nível 11','A partir do 11º nível, você pode gastar 1 PM para refazer um teste de resistência contra uma condição (como abalado, paralisado etc.) que esteja o afetando. O segundo teste recebe um bônus de +5 e, se você passar, cancela o efeito. Você só pode usar esta habilidade uma vez por efeito.'),
	('Bravura Final','Cavaleiro','Nível 20','No 20º nível, sua virtude vence a morte. Se for reduzido a 0 ou menos PV, você pode continuar consciente e agindo normalmente. Se fizer isso, deve gastar 5 PM no início de cada um de seus turnos. Caso contrário, cai inconsciente ou morto, conforme seus PV atuais.');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES
	('Devoto - Clérigo','Clerigo','','Você se torna devoto de um deus maior. Você deve obedecer às Obrigações & Restrições de seu deus, mas, em troca, ganha os Poderes Concedidos dele. Veja a lista de deuses na página 97. /nComo alternativa, você pode cultuar o Panteão como um todo. Não recebe nenhum Poder Concedido, mas sua única Obrigação & Restrição é não usar armas cortantes ou perfurantes (porque derramam sangue, algo que clérigos do Panteão consideram proibido). /nO nome desta habilidade varia de acordo com a divindade escolhida: Devoto de Azgher, Devoto de Thyatis... ou Devoto dos Deuses, se escolher cultuar o Panteão como um todo.'),
	('Magias - Clerigo','Clerigo','','Você pode lançar magias divinas de 1º círculo. A cada quatro níveis, pode lançar magias de um círculo maior (2º círculo no 5º nível, 3º círculo no 9º nível e assim por diante)./n Você começa com três magias de 1º círculo. A cada nível, aprende uma magia de qualquer círculo que possa lançar./n Seu atributo-chave para lançar magias é Sabedoria e você soma seu bônus de Sabedoria no seu total de PM. Veja o Capítulo 4 para as regras de magia.'),
	('Mão da Divindade','Clerigo','Nível 20','No 20º nível, você pode gastar uma ação completa e 15 PM para canalizar a energia de seu deus. Ao fazer isso, você lança três magias divinas quaisquer (de qualquer círculo, incluindo magias que você não conhece), como uma ação livre e sem gastar PM (mas ainda precisa pagar outros custos). Você pode aplicar aprimoramentos, mas precisa pagar por eles. Após usar esta habilidade, você fica atordoado por 1d4 rodadas. Corpos mortais não foram feitos para lidar com tanto poder.');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES 
	('Devoto - Druida','Druida','','Você se torna devoto de uma divindade disponível para druidas (Allihanna, Megalokk ou Oceano). Você deve obedecer às Obrigações & Restrições de seu deus, mas, em troca, ganha os Poderes Concedidos dele. O nome desta habilidade muda de acordo com a divindade escolhida: Devoto de Allihanna, Devoto de Megalokk ou Devoto de Oceano.'),
	('Empatia Selvagem','Druida','','Você pode se comunicar com animais por meio de linguagem corporal e vocalizações. Você pode usar Adestramento com animais para mudar atitude e pedir favores.'),
	('Magias - Druida','Druida','','Escolha três escolas de magia. Uma vez feita, essa escolha não pode ser mudada. Você pode lançar magias divinas de 1º círculo que pertençam a essas escolas. À medida que sobe de nível, pode lançar magias de círculos maiores (2º círculo no 6º nível, 3º círculo no 10º nível e 4º círculo no 14º nível)./n Você começa com duas magias de 1º círculo. A cada nível par (2º, 4º etc.), aprende uma magia de qualquer círculo e escola que possa lançar./n Seu atributo-chave para lançar magias é Sabedoria e você soma seu bônus de Sabedoria no seu total de PM. Veja o Capítulo 4 para as regras de magia.'),
	('Caminho dos Ermos','Druida','Nível 2','No 2º nível, você pode atravessar terrenos difíceis sem sofrer redução em seu deslocamento e a CD para rastreá-lo aumenta em +10. Esta habilidade só funciona em terrenos naturais.'),
	('Força da Natureza','Druida','Nível 20','No 20º nível, você diminui o custo de todas as suas magias em –2 PM e aumenta a CD delas em +2. Os bônus dobram (–4 PM e +4 na CD) se você estiver em terrenos naturais.');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES 
	('Ataque Especial','Guerreiro','','Quando faz um ataque, você pode gastar 1 PM para receber +4 no teste de ataque ou na rolagem de dano. A cada quatro níveis, pode gastar +1 PM para aumentar o bônus em +4. Você pode dividir os bônus igualmente. Por exemplo, no 17º nível, pode gastar 5 PM para receber +20 no ataque, +20 no dano ou +10 no ataque e +10 no dano.'),
	('Durão','Guerreiro','Nível 3','A partir do 3ª nível, sua rijeza muscular permite que você absorva ferimentos. Sempre que sofre dano, você pode gastar 2 PM para reduzir esse dano à metade.'),
	('Ataque Extra','Guerreiro','Nível 6','A partir do 6º nível, quando usa a ação atacar, você pode gastar 2 PM para realizar um ataque adicional com a mesma arma.'),
	('Campeão','Guerreiro','Nível 20','No 20º nível, o dano de todos os seus ataques aumenta em um passo. Além disso, sempre que você faz um Ataque Especial ou um Golpe Pessoal e acerta o ataque, recupera metade dos PM gastos nele. Por exemplo, se fizer um Ataque Especial gastando 5 PM para ganhar +20 nas rolagens de dano e acertar o ataque, recupera 2 PM.');

INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES 
	('Engenhosidade','Inventor','','Quando faz um teste de perícia, você pode gastar 2 PM para receber um bônus igual ao seu modificador de Inteligência no teste. Você não pode usar esta habilidade em testes de ataque.'),
	('Protótipo','Inventor','','Você começa o jogo com um item superior com uma modificação ou 10 itens alquímicos, com preço total de até T$ 500. Veja o Capítulo 3: Equipamento para a lista de itens.'),
	('Fabricar Item Superior.','Inventor','Nível 2','No 2º nível, você recebe um item superior com preço de até T$ 2.000 e passa a poder fabricar itens superiores com uma modificação. Veja o Capítulo 3: Equipamento para a lista de modificações./n Nos níveis 4, 6, 8, 10 e 12, você pode substituir esse item por um item superior com duas, três, quatro, cinco e seis modificações, respectivamente, e passa a poder fabricar itens superiores com essa quantidade de modificações. O item do 4º nível tem limite de preço de T$ 5.000. Os demais itens não possuem limitação de preço./n Considera-se que você estava trabalhando nos itens e você não gasta dinheiro ou tempo neles (mas gasta em itens que fabricar futuramente).'),
	('Comerciante','Inventor','Nível 3','No 3º nível, você pode vender itens 10% mais caro (não cumulativo com barganha).'),
	('Encontrar Fraqueza','Inventor','Nível 7','A partir do 7º nível, você pode gastar uma ação de movimento e 2 PM para analisar um objeto em alcance curto. Se fizer isso, ignora a resistência a dano dele. Você também pode usar esta habilidade para encontrar uma fraqueza em um inimigo. Se ele estiver de armadura ou for um construto, você recebe +2 em seus testes de ataque contra ele. Os benefícios desta habilidade duram até o fim da cena.'),
	('Fabricar Item Mágico.','Inventor','Nível 9','No 9º nível, você recebe um item mágico menor e passa a poder fabricar itens mágicos menores. Veja o Capítulo 8: Recompensas para as regras de itens mágicos./n  Nos níveis 13 e 17, você pode substituir esse item por um item mágico médio e maior, respectivamente, e passa a poder fabricar itens mágicos dessas categorias./n  Considera-se que você estava trabalhando nos itens que recebe e você não gasta dinheiro, tempo ou pontos de mana neles (mas gasta em itens que fabricar futuramente).'),
	('Olho do Dragão','Inventor','Nível 11','A partir do 11º nível, você pode gastar uma ação completa para analisar um item. Você automaticamente descobre se o item é mágico, suas propriedades e como utilizá-las.'),
	('Obra-Prima','Inventor','Nível 20','No 20º nível, você fabrica sua obra-prima, aquela pela qual seu nome será lembrado em eras futuras. Você é livre para criar as regras do item, mas ele deve ser aprovado pelo mestre. Como linha geral, ele pode ter os benefícios de um item superior com seis modificações e de um item mágico maior. Considera-se que você estava trabalhando no item e você não gasta dinheiro, tempo ou PM nele.');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES 
	('Ataque Furtivo','Ladino','','Você sabe atingir os pontos vitais de um inimigo distraído. Uma vez por rodada, quando atinge um alvo desprevenido com um ataque corpo a corpo ou em alcance curto, ou um alvo que esteja flanqueando, você causa 1d6 pontos de dano adicional. A cada dois níveis, esse dano adicional aumenta em +1d6. Uma criatura imune a acertos críticos também é imune a ataques furtivos.'),
	('Especialista','Ladino','','Escolha um número de perícias treinadas igual ao seu bônus de Inteligência (mínimo 1). Ao fazer um teste de uma dessas perícias, você pode gastar 1 PM para dobrar seu bônus de treinamento. Você não pode usar esta habilidade em testes de ataque.'),
	('Evasão - Ladino','Ladino','Nível 2','A partir do 2º nível, quando sofre um ataque que permite um teste de Reflexos para reduzir o dano à metade, você não sofre dano algum se passar. Você ainda sofre dano normal se falhar no teste de Reflexos. Esta habilidade exige liberdade de movimentos; você não pode usá-la se estiver de armadura pesada ou na condição imóvel.'),
	('Esquiva Sobrenatural','Ladino','Nível 4','No 4º nível, seus instintos ficam tão apurados que você consegue reagir ao perigo antes que seus sentidos percebam. Você nunca fica surpreendido.'),
	('Olhos nas Costas','Ladino','Nível 8','A partir do 8º nível, você consegue lutar contra diversos inimigos como se fossem apenas um. Você não pode ser flanqueado.'),
	('Evasão Aprimorada - Ladino','Ladino','Nível 10','No 10º nível, quando sofre um ataque que permite um teste de Reflexos para reduzir o dano à metade, você não sofre dano algum se passar e sofre apenas metade do dano se falhar. Esta habilidade exige liberdade de movimentos; você não pode usá-la se estiver de armadura pesada ou na condição imóvel.'),
	('A Pessoa Certa Para o Trabalho','Ladino','Nível 20','No 20º nível, você se torna um verdadeiro mestre da ladinagem. Ao fazer um ataque furtivo ou usar uma perícia da lista de ladino, você pode gastar 5 PM para receber +10 no teste.');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES 
	('Briga','Lutador','','Seus ataques desarmados causam 1d6 pontos de dano e podem causar dano letal ou não letal (sem penalidades). A cada quatro níveis, seu dano desarmado aumenta, conforme a tabela./n O dano na tabela é para criaturas Pequenas e Médias. Criaturas Minúsculas diminuem esse dano em um passo, Grandes e Enormes aumentam em um passo e Colossais aumentam em dois passos.'),
	('Golpe Relâmpago','Lutador','','Quando usa a ação atacar para fazer um ataque desarmado, você pode gastar 1 PM para realizar um ataque desarmado adicional.'),
	('Casca Grossa','Lutador','Nível 3','No 3º nível, você soma seu bônus de Constituição na Defesa, limitado pelo seu nível e apenas se não estiver usando armadura pesada. Além disso, no 7º nível, e a cada quatro níveis, você recebe +1 na Defesa.'),
	('Golpe Cruel','Lutador','Nível 5','No 5º nível, você acerta onde dói. Sua margem de ameaça com ataques desarmados aumenta em +1.'),
	('Golpe Violento','Lutador','Nível 9','No 9º nível, você bate com muita força. Seu multiplicador de crítico com ataques desarmados aumenta em +1.'),
	('Dono da Rua','Lutador','Nível 20','No 20º nível, seu dano desarmado aumenta para 2d10 (para criaturas Médias). Além disso, quando usa a ação atacar para fazer um ataque desarmado, você pode fazer dois ataques, em vez de um (podendo usar Golpe Relâmpago para fazer um terceiro).');


INSERT INTO hab_Classes ( nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES 
	('Autoconfiança','Nobre','','Você pode somar seu bônus de Carisma em vez de Destreza na Defesa (mas continua não podendo somar um bônus de atributo na Defesa quando usa armadura pesada).'),
	('Espólio','Nobre','','Você recebe um item a sua escolha com preço de até T$ 2.000.'),
	('Orgulho','Nobre','','Quando faz um teste de perícia, você pode gastar uma quantidade de PM a sua escolha (limitado pelo seu modificador de Carisma). Para cada PM que gastar, recebe +2 no teste.'),
	('Riqueza','Nobre','Nível 2','No 2º nível, você passa a receber dinheiro de sua família, patrono ou negócios. Uma vez por aventura, você pode fazer um teste de Carisma com um bônus igual ao seu nível de nobre. Você recebe um número de Tibares de ouro igual ao resultado do teste. Por exemplo, um nobre de 5º nível com Carisma 18 (+4) que role um 13 no dado recebe 22 TO. O uso desta habilidade é condicionado a onde e quando você faz o teste, assim como a relação com sua família, patrono ou negócios. Por exemplo, um nobre viajando pelos ermos, isolado da civilização, dificilmente teria como receber dinheiro.'),
	('Gritar Ordens','Nobre','Nível 3','A partir do 3º nível, você pode gastar uma quantidade de PM a sua escolha (limitado pelo seu bônus de Carisma). Até o início de seu próximo turno, todos os seus aliados em alcance curto recebem um bônus nos testes de perícia igual à quantidade de PM que você gastou.'),
	('Realeza','Nobre','Nível 20','No 20º nível, sua presença impõe mais do que respeito — impõe veneração. Uma criatura que seja alvo de sua Presença Aristocrática e falhe no teste de Vontade por 10 ou mais se arrepende tanto de ter tentado machucá-lo que passa a lutar ao seu lado (e seguir suas ordens, se puder entendê-lo) pelo resto da cena. Uma criatura que seja reduzida a 0 PV por Palavras Afiadas não sofre este dano; em vez disso, passa a lutar ao seu lado pelo resto da cena.');


INSERT INTO hab_Classes (nomeHabClasse, nomeClassePertence, preRequisito, descricaoHabClasse)
VALUES
	('Abençoado', 'Paladino', '', 'Você soma seu bônus de Carisma no seu total de pontos de mana no 1º nível. Além disso, torna-se devoto de uma divindade disponível para paladinos (Azgher, Khalmyr, Lena, Lin-Wu, Marah, Tanna-Toh, Thyatis, Valkaria). Você deve obedecer às Obrigações & Restrições de seu deus, mas, em troca, ganha os Poderes Concedidos dele. Como alternativa, você pode ser um paladino do bem, lutando em prol da bondade e da justiça como um todo. Não recebe nenhum Poder Concedido, mas não precisa seguir nenhuma Obrigação & Restrição (além do Código do Herói, abaixo).'),
	('Codigo do Herói', 'Paladino', '', 'Você deve sempre manter sua palavra e nunca pode recusar um pedido de ajuda de alguém inocente. Além disso, nunca pode mentir, trapacear ou roubar. Se violar o código, você perde todos os seus PM e só pode recuperá-los a partir do próximo dia.'),
	('Golpe Divino', 'Paladino', '', 'Quando faz um ataque corpo a corpo, você pode gastar 2 PM para desferir um golpe destruidor. Você soma seu bônus de Carisma no teste de ataque e +1d8 na rolagem de dano. A cada quatro níveis, pode gastar +1 PM para aumentar o dano em +1d8.'),
	('Curar Pelas Mãos', 'Paladino', 'Nível 2', 'A partir do 2º nível, você pode gastar uma ação de movimento e 1 PM para curar 1d8+1 pontos de vida de um alvo em alcance corpo a corpo (incluindo você). A cada quatro níveis, você pode gastar +1 PM para aumentar os PV curados em +1d8+1. A partir do 6º nível, você pode gastar +1 PM quando usa Cura pelas Mãos para anular uma condição afetando o alvo, entre abalado, apavorado, atordoado, cego, doente, exausto, fatigado ou surdo. Esta habilidade também pode causar dano de luz a mortos-vivos, exigindo um ataque desarmado.'),
	('Aura Sagrada', 'Paladino', 'Nível 3', 'No 3º nível, você pode gastar 1 PM para gerar uma aura com alcance curto a partir de você. A aura emite uma luz dourada e agradável, que ilumina como uma tocha. Além disso, você e os aliados dentro da aura recebem um bônus igual ao seu bônus de Carisma nos testes de resistência. Manter a aura custa 1 PM por turno.'),
	('Benção da Justiça', 'Paladino', 'Nível 5', 'No 5º nível, escolha entre égide sagrada e montaria sagrada. Uma vez feita, esta escolha não pode ser mudada. Égide Sagrada. Você pode gastar uma ação de movimento e 2 PM para recobrir de energia seu escudo ou símbolo sagrado. Até o fim da cena, você e todos os aliados adjacentes recebem um bônus na Defesa igual ao seu bônus de Carisma. A partir do 11º nível, você pode gastar 5 PM para receber o mesmo bônus num teste de resistência contra uma magia recém lançada contra você. Se você passar no teste de resistência e a magia tiver você como único alvo, ela é revertida de volta ao conjurador (que se torna o novo alvo da magia; todas as demais características da magia, incluindo CD do teste de resistência, se mantêm)./n Montaria Sagrada. Você pode gastar uma ação de movimento e 2 PM para invocar uma montaria sagrada. Veja o quadro para mais detalhes.'),
	('Vingador', 'Paladino', 'Nível 20', 'No 20º nível, você pode gastar uma ação completa e 10 PM para se cobrir de energia divina, assumindo a forma de um vingador sagrado até o fim da cena. Nesta forma, você recebe deslocamento de voo 18m, resistência a dano 20 e soma seu modificador de Carisma em seus testes de ataque e rolagens de dano corpo a corpo.');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
	('Arcano de Batalha', 'Arcanista', '', 'Você soma o bônus de seu atributo-chave nas rolagens de dano para magias e para seu Raio Arcano (caso possua).'),
	('Escriba Arcano', 'Arcanista', 'Mago, treinado em Conhecimento.', 'Você pode aprender magias copiando os textos de pergaminhos e grimórios de outros magos. Aprender uma magia dessa forma exige um dia de trabalho e T$ 250 em matérias-primas por PM necessário para lançar a magia. Assim, aprender uma magia de 3º círculo (6 PM) exige 6 dias de trabalho e o gasto de T$ 1.500.'),
	('Fluxo de Mana', 'Arcanista', '10º nível de arcanista.', 'Você pode manter dois efeitos sustentados ativos simultaneamente com apenas uma ação livre, pagando o custo de cada efeito separadamente.'),
	('Poder Mágico', 'Arcanista', '', 'Você recebe +1 ponto de mana por nível de arcanista. Quando sobe de nível, os PM que recebe por este poder aumentam de acordo. Por exemplo, se escolher este poder no 4º nível, recebe 4 PM. Quando subir para o 5º nível, recebe +1 PM e assim por diante. Você pode escolher este poder uma segunda vez, para um total de +2 PM por nível.'),
	('Raio Arcano', 'Arcanista', '', 'Você pode gastar uma ação padrão para disparar um raio num alvo em alcance curto que causa 1d6 pontos de dano de essência. Esse dano aumenta em +1d6 para cada círculo de magia acima do 1º que você puder lançar. O alvo pode fazer um teste de Reflexos (CD atributo-chave) para reduzir o dano à metade.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
	('Alma de Bronze', 'Bárbaro', '', 'Quando entra em fúria, você recebe uma quantidade de pontos de vida temporários igual a metade do seu nível + mod. Força.'),
	('Espírito Inquebrável', 'Bárbaro', 'Alma de Bronze', 'Enquanto está em fúria, você não fica inconsciente por estar com 0 ou menos pontos de vida (você ainda morre se chegar em um valor negativo igual à metade de seus PV máximos). Pré-requisito: Alma de Bronze.'),
	('Frenesi', 'Bárbaro', '', 'Se estiver em fúria e usar a ação atacar para fazer um ataque corpo a corpo, você pode gastar 2 PM para fazer um ataque adicional.'),
	('Pele de Aço', 'Bárbaro', 'Pele de Ferro, 8º nível de bárbaro', 'O bônus de Pele de Ferro aumenta para +5'),
	('Pele de Ferro', 'Bárbaro', '', 'Você recebe +2 na Defesa, mas apenas se não estiver usando armadura pesada.'),
	('Sangue dos Inimigos', 'Bárbaro', '', 'Enquanto está em fúria, quando faz um acerto crítico ou reduz um inimigo a 0 PV, você recebe um bônus cumulativo de +1 em testes de ataque e rolagens de dano, limitado pelo seu nível, até o fim da cena.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
	('Arte Mágica', 'Bardo', '', 'Enquanto você estiver sob efeito de sua habilidade Inspiração, a CD para resistir a suas magias de bardo aumenta em +2'),
	('Aumentar Repertório', 'Bardo', '', 'Você aprende duas magias de qualquer círculo que possa lançar. Elas devem pertencer às escolas que você sabe usar, mas podem ser arcanas ou divinas. Você pode escolher este poder quantas vezes quiser.'),
	('Dança das Lâminas', 'Bardo', 'Esgrima Mágica, 10° nível de Bardo', 'Quando você lança uma magia com execução de uma ação padrão, pode gastar 1 PM para fazer um ataque corpo a corpo como uma ação livre. Pré-requisitos: Esgrima Mágica, 10º nível de bardo'),
	('Esgrima Mágica', 'Bardo', '', 'Sua arte mescla esgrima e magia, transformando dança em golpes. Enquanto estiver sob efeito de Inspiração, você pode substituir testes de Luta por testes de Atuação, mas apenas se estiver empunhando armas leves ou de uma mão.'),
	('Paródia', 'Bardo', '', 'Uma vez por rodada, quando vê alguém lançando uma magia em alcance médio, você pode pagar 1 PM e fazer um teste de Atuação (CD 15 + custo em PM da magia). Se passar, até o final de seu próximo turno você pode lançar essa magia.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
	('Amigos no Porto', 'Bucaneiro', 'Car 13, 6º nível de bucaneiro', 'Quando chega em uma comunidade portuária, você pode gastar 2 PM para fazer um teste de Carisma (CD 10). Se passar, encontra um amigo para o qual pode pedir um favor (veja a perícia Diplomacia) ou que pode ajudá-lo como um aliado por uma cena.'),
	('Aparar', 'Bucaneiro', 'Esgrimista', 'Uma vez por rodada, quando é atingido por um ataque corpo a corpo, você pode gastar 1 PM para apará-lo. Faça um teste de ataque. Se o resultado do seu teste for maior que o do oponente, você evita o ataque. Você só pode usar este poder se estiver usando uma arma leve ou ágil.'),
	('Bravata Audaz', 'Bucaneiro', '', 'Você jura fazer uma façanha específica, como roubar o tesouro de Sckhar ou ganhar um beijo do príncipe e da princesa até o fim do baile. Se cumprir a bravata, seu limite máximo de PM aumenta em +2d6 até o fim da aventura.'),
	('Esgrimista', 'Bucaneiro', 'Int 13', 'Quando usa uma arma leve ou ágil, você soma seu bônus de Inteligência nas rolagens de dano (limitado pelo seu nível).'),
	('Grudar o Cano', 'Bucaneiro', 'treinado em Luta, Pistoleiro', 'Quando faz um ataque à distância com uma arma de fogo contra um oponente adjacente, você não sofre a penalidade de –5 no teste de ataque e aumenta seu dano em um passo.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
    ('Ambidestria', 'Caçador', 'Des 15', 'Se estiver usando duas armas (e pelo menos uma delas for leve) e fizer a ação atacar, você pode fazer dois ataques, um com cada arma. Se fizer isso, sofre –2 em todos os testes de ataque até o seu próximo turno.'),
    ('Arqueiro', 'Caçador', 'Sab 13', 'Se estiver usando uma arma de ataque à distância, você soma seu bônus de Sabedoria nas rolagens de dano (limitado pelo seu nível).'),
    ('Bote', 'Caçador', 'Ambidestria, 6º nível de caçador', 'Se estiver empunhando duas armas e fizer uma investida, você pode pagar 1 PM para fazer um ataque adicional com sua arma secundária.'),
    ('Companheiro Animal', 'Caçador', 'treinado em Adestramento', 'Você recebe um companheiro animal.'),
    ('Emboscar', 'Caçador', 'treinado em Furtividade', 'Você pode gastar 2 PM para realizar uma ação padrão adicional em seu turno. Você só pode usar este poder na primeira rodada de um combate.'),
    ('Escaramuça', 'Caçador', 'Des 15, 6º nível de caçador', 'Quando se move 6m ou mais, você recebe +2 em Defesa e Reflexos e +1d8 nas rolagens de dano de ataques corpo a corpo e à distância em alcance curto até o início de seu próximo turno. Você não pode usar esta habilidade se estiver vestindo armadura pesada.'),
    ('Inimigo de (Criatura).', 'Caçador', '', 'Escolha um tipo de criatura entre animal, construto, espírito, monstro ou morto-vivo, ou duas raças humanoides (por exemplo, orcs e gnolls, ou elfos e qareen). Quando você usa a habilidade Marca da Presa contra uma criatura do tipo ou da raça escolhida, dobra os dados de bônus no dano. O nome desta habilidade varia de acordo com o tipo de criatura escolhida (Inimigo de Monstros, Inimigo de Mortos-Vivos etc.). Você pode escolher este poder outras vezes para inimigos diferentes.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
    ('Armadura da Honra', 'Cavaleiro', '', 'No início de cada cena, você recebe uma quantidade de pontos de vida temporários igual a 5 + seu bônus de Carisma. Os PV temporários duram até o final da cena.'),
    ('Autoridade Feudal', 'Cavaleiro', '6º nível de cavaleiro', 'Você possui autoridade sobre pessoas comuns (qualquer pessoa sem um título de nobreza ou uma posição numa igreja reconhecida pelo Reinado). Você pode gastar 2 PM para conclamar o povo a realizar uma tarefa para você. Em termos de jogo, passa automaticamente em um teste de perícia com CD máxima igual ao seu nível +5. O tempo necessário para conclamar o povo é o tempo do uso da perícia em questão. Esta habilidade só pode ser usada em locais onde sua posição carregue alguma influência (a critério do mestre).'),
    ('Desprezar os Covarde', 'Cavaleiro', '', 'Você recebe resistência a dano 5 se estiver caído, desprevenido ou flanqueado'),
    ('Estandarte', 'Cavaleiro', 'Título, 14º nível de cavaleiro', 'Sua flâmula torna-se célebre, um símbolo de inspiração para seus aliados. No início de cada cena, você e todos os aliados que possam ver seu estandarte recebem um número de PM temporários igual ao seu bônus de Carisma (mínimo 1). PM temporários desaparecem no final da cena.'),
    ('Investida Destruidora', 'Cavaleiro', '', 'Quando faz a ação investida, você pode gastar 2 PM. Se fizer isso, causa +2d8 pontos de dano. Você deve usar esta habilidade antes de rolar o ataque.'),
    ('Título', 'Cavaleiro', 'Autoridade Feudal, 10º nível de cavaleiro', 'Você adquire um título de nobreza. Converse com o mestre para definir os benefícios exatos de seu título. Como regra geral, você recebe 10 TO por nível de cavaleiro no início de cada aventura (rendimentos dos impostos) ou a ajuda de um aliado veterano (um membro de sua corte).');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
    ('Autoridade Eclesiástica', 'Clérigo', '5º nível de clérigo, devoto de um deus maior', 'Você possui uma posição formal em uma igreja reconhecida pelos outros membros de sua fé. Os efeitos deste poder variam de acordo com a igreja e o deus — clérigos de Khalmyr, por exemplo, possuem autoridade como juízes no Reinado — e ficam a cargo do mestre. Como regra geral, você recebe +5 em testes de Diplomacia ou Intimidação ao lidar com devotos de sua divindade e paga metade do preço de itens alquímicos, poções e serviços em templos de sua divindade.'),
    ('Canalizar Energia Positiva/Negativa', 'Clérigo', '', 'Você pode gastar uma ação padrão e 1 PM para liberar uma onda de energia positiva ou negativa (de acordo com sua divindade) que afeta todas as criaturas em alcance curto. Energia positiva cura 1d6 pontos de dano em criaturas vivas a sua escolha e causa 1d6 pontos de dano de luz em mortos-vivos. Energia negativa tem o efeito inverso — causa dano de trevas em criaturas vivas a sua escolha e cura mortos-vivos. Uma criatura que sofra dano tem direito a um teste de Vontade (CD Car) para reduzi-lo à metade. Para cada 2 PM extras que você gastar, a cura ou dano aumenta em +1d6 PV (ou seja, pode gastar 3 PM para curar 2d6 PV, 5 PM para curar 3d6 PV e assim por diante).'),
    ('Expulsar/Comandar Mortos-Vivos', 'Clérigo', 'Canalizar Energia Positiva ou Negativa', 'Você pode usar uma ação padrão e 3 PM para expulsar (se sua divindade canaliza energia positiva) ou comandar (se canaliza energia negativa) todos os mortos-vivos em alcance curto. Mortos-vivos expulsos ficam apavorados por 1d6 rodadas. Mortos-vivos comandados ficam sob suas ordens; entretanto, o nível somado de mortos-vivos sob seu comando ao mesmo tempo não pode exceder o seu próprio nível +3. Dar uma ordem a mortos-vivos é uma ação de movimento. Mortos-vivos têm direito a um teste de Vontade (CD Car) para evitar qualquer destes efeitos.'),
    ('Magia Sagrada/Profana', 'Clérigo', '', 'Quando lança uma magia divina que causa dano, você pode gastar +1 PM. Se fizer isso, muda o tipo de dano da magia para luz ou trevas (de acordo com a sua divindade).'),
    ('Símbolo Sagrado Abençoado', 'Clérigo', '', 'Você pode gastar uma ação de movimento e 1 PM para fazer uma prece e energizar seu símbolo sagrado até o fim da cena. Um símbolo sagrado energizado emite uma luz dourada ou prateada (se sua divindade canaliza energia positiva) ou púrpura ou avermelhada (se canaliza energia negativa) que ilumina como uma tocha. Enquanto você estiver empunhando um símbolo sagrado energizado, o custo em PM para lançar suas magias divinas diminui em 1.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
    ('Aspecto do Inverno', 'Druida', '', 'Você recebe resistência a frio 5 e suas magias que causam dano de frio causam +1 ponto de dano por dado. Durante o inverno, suas magias de druida custam −1 PM.'),
    ('Aspecto do Outono', 'Druida', '', 'Você aprende uma magia de necromancia, arcana ou divina, de qualquer círculo que possa lançar. Você pode gastar 1 PM para impor uma penalidade de –2 nos testes de resistência de todos os inimigos em alcance médio até o início do seu próximo turno. Durante o outono, suas magias de druida custam −1 PM.'),
    ('Aspecto da Primavera', 'Druida', '', 'Você recebe +1 em Carisma e suas magias de cura curam +1 PV por dado. Durante a primavera, suas magias de druida custam −1 PM.'),
    ('Aspecto do Verão', 'Druida', '', 'Você recebe +2 em Iniciativa e pode gastar 1 PM para cobrir suas armas ou armas naturais com chamas, causando +1d6 pontos de dano de fogo até o fim da cena. Durante o verão, suas magias de druida custam −1 PM.'),
    ('Espírito dos Equinócios', 'Druida', 'Aspecto da Primavera, Aspecto do Outono, 10º nível de druida', 'Sua alma e corpo estão em equilíbrio. Você pode gastar 1 PM para escolher 10 em um teste de resistência.'),
    ('Espírito dos Solstícios', 'Druida', 'Aspecto do Inverno, Aspecto do Verão, 10º nível de druida', 'Você transita entre os extremos do mundo natural. Quando lança uma magia, pode gastar +4 PM para maximizar os efeitos numéricos variáveis dela. Por exemplo, uma magia Curar Ferimentos aprimorada para curar 5d8+5 PV irá curar automaticamente 45 PV, sem a necessidade de rolar dados. Uma magia sem efeitos variáveis não pode ser afetada por este poder.'),
    ('Forma Primal', 'Druida', 'Forma Selvagem duas vezes, 18º nível de druida', 'Quando usa Forma Selvagem, você pode se transformar em uma fera primal. Você recebe os benefícios de dois tipos de animais (bônus iguais não se acumulam; use o que você quiser de cada tipo).'),
    ('Forma Selvagem', 'Druida', '', 'Você pode se transformar em um tipo de animal. Veja a seguir. Você pode escolher este poder diversas vezes. A cada vez, aprende uma forma selvagem diferente.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
    ('Ataque Reflexo', 'Guerreiro', 'Des 13', 'Se um alvo em alcance de seus ataques corpo a corpo ficar desprevenido ou se mover voluntariamente para fora do seu alcance, você pode gastar 1 PM para fazer um ataque corpo a corpo contra esse alvo como uma reação.'),
    ('Bater e Correr', 'Guerreiro', '', 'Quando faz uma investida, você pode continuar se movendo após o ataque, até o limite de seu deslocamento. Se gastar 2 PM, pode fazer uma investida sobre terreno difícil e sem sofrer a penalidade de Defesa.'),
    ('Especialização em Arma', 'Guerreiro', '', 'Escolha uma arma. Você recebe +2 em rolagens de dano com a arma escolhida. Você pode escolher este poder outras vezes para armas diferentes.'),
    ('Especialização em Armadura', 'Guerreiro', '12º nível de guerreiro', 'Você recebe resistência a dano 5 se estiver usando uma armadura pesada.'),
    ('Golpe Pessoal', 'Guerreiro', '', 'Quando faz um ataque, você pode desferir seu Golpe Pessoal, uma manobra única, com efeitos determinados por você. Você constrói o seu Golpe Pessoal escolhendo efeitos da lista a seguir. Cada efeito possui um custo; a soma deles será o custo do Golpe Pessoal (mínimo 1 PM e máximo igual ao seu nível). O Golpe Pessoal só pode ser usado com um tipo de arma específico (por exemplo, apenas espadas longas). Quando sobe de nível, você pode reconstruir seu Golpe Pessoal e alterar a arma que ele usa. Você pode escolher este poder outras vezes para golpes diferentes.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
    ('Agite Antes de Usar', 'Inventor', 'treinado em Ofício (alquimia).', 'Quando usa um item alquímico que cause dano, você pode gastar uma quantidade de PM a sua escolha (limitado pelo seu bônus de Inteligência). Para cada PM que gastar, o item causa um dado extra de dano do mesmo tipo.'),
    ('Autômato', 'Inventor', '', 'Você fabrica um autômato, uma criatura mecânica que obedece a seus comandos. Ele é um aliado Iniciante de um tipo a sua escolha entre ajudante, assassino, atirador, combatente, guardião, montaria ou vigilante. No 7º nível, ele muda para Veterano e, no 15º nível, para Mestre. Se o autômato for destruído, você pode fabricar um novo com uma semana de trabalho e T$ 100.'),
    ('Chutes e Palavrões', 'Inventor', 'Engenhoqueiro.', 'Uma vez por rodada, você pode pagar 1 PM para repetir um teste falho de Ofício (engenhoqueiro) recém realizado para ativar uma engenhoca.'),
    ('Engenhoqueiro', 'Inventor', 'Int 17, treinado em Ofício (engenhoqueiro).', 'Você pode fabricar engenhocas.'),
    ('Oficina de Campo', 'Inventor', 'treinado em Ofício (armeiro).', 'Você pode gastar uma hora e 2 PM para fazer a manutenção do equipamento de seu grupo. Cada membro do grupo escolhe uma arma, armadura ou escudo para manutenção. Armas recebem +1 em testes de ataque, armaduras e escudos têm sua penalidade de armadura reduzida em 1. Os benefícios duram um dia.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
    ('Assassinar', 'Ladino', '5º nível de ladino', 'Você pode gastar uma ação de movimento e 3 PM para analisar uma criatura em alcance curto. Até o fim de seu próximo turno, seu primeiro Ataque Furtivo que causar dano a ela tem seus dados de dano extras dessa habilidade dobrados.'),
    ('Gatuno', 'Ladino', 'treinado em Atletismo', 'Você recebe +2 em Atletismo. Quando escala, avança seu deslocamento normal, em vez de metade dele.'),
    ('Mão na Boca', 'Ladino', 'treinado em Luta', 'Você recebe +2 em testes de agarrar. Quando faz um ataque furtivo contra uma criatura desprevenida, você pode fazer um teste de agarrar como uma ação livre. Se agarrar a criatura, ela não poderá falar enquanto estiver agarrada.'),
    ('Mãos Rápidos', 'Ladino', 'Des 15, treinado em Ladinagem', 'Ao fazer um teste de Ladinagem para abrir fechaduras, ocultar item, punga ou sabotar, você pode pagar 1 PM para fazê-lo como uma ação livre.'),
    ('Velocidade Ladina', 'Ladino', 'Des 15, treinado em Iniciativa', 'Uma vez por rodada, você pode gastar 2 PM para realizar uma ação de movimento adicional em seu turno.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
    ('Até Acertar', 'Lutador', '', 'Se você errar um ataque desarmado, recebe um bônus cumulativo de +2 em testes de ataque e rolagens de dano desarmado contra o mesmo oponente. Os bônus terminam quando você acertar um ataque ou no fim da cena, o que acontecer primeiro.'),
    ('Braços Calejados', 'Lutador', '', 'Se você não estiver usando armadura, soma seu bônus de Força na Defesa, limitado pelo seu nível.'),
    ('Nome na Arena', 'Lutador', '12º nível de Lutador', 'Você construiu uma reputação no circuito de lutas de Arton. Escolha uma perícia que represente a característica pela qual você é conhecido, como Atletismo para uma fama de musculoso ou Intimidação para uma fama de “malvado”. Uma vez por cena, você pode gastar uma ação de movimento para fazer um teste dessa perícia (CD 10) e impressionar os presentes. Se passar, você recebe +1 em todos os seus testes de perícias baseadas em Carisma até o fim da cena. Esse bônus aumenta em +1 para cada 5 pontos pelos quais o resultado do teste exceder a CD (+2 para um resultado 15, +3 para 20 e assim por diante). Como alternativa, você pode aplicar esse bônus em seu próximo teste de ataque.'),
    ('Punhos de Adamante', 'Lutador', '8° nível de Lutador', 'Seus ataques desarmados ignoram 10 pontos de resistência a dano do alvo, se houver.'),
    ('Sarado', 'Lutador', 'For 17', 'Você soma seu bônus de Força no seu total de pontos de vida e em testes de Fortitude. A critério do mestre, você pode chamar a atenção de pessoas que se atraiam por físicos bem definidos.'),
    ('Trincado', 'Lutador', 'Con 17, Sarado, 10º nível de lutador', 'Esculpido à exaustão, seu corpo se tornou uma máquina. Você soma seu modificador de Constituição nas suas rolagens de dano desarmado.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
    ('Armadura Brilhante', 'Nobre', '8º nível de nobre.', 'Você pode somar o modificador de Carisma na Defesa quando usa armadura pesada. Se fizer isso, não pode somar o modificador de Destreza, mesmo que outras habilidades ou efeitos permitam isso.'),
    ('Educação Privilegiada', 'Nobre', '', 'Você se torna treinado em duas perícias de nobre a sua escolha.'),
    ('Estrategista', 'Nobre', 'Int 13, treinado em Guerra, 6º nível de nobre.', 'Você pode direcionar aliados em alcance curto. Gaste uma ação padrão e 1 PM por aliado que quiser direcionar (limitado pelo seu modificador de Carisma). No próximo turno do aliado, ele ganha uma ação de movimento.'),
    ('Inspirar Confiança', 'Nobre', '', 'Sua presença faz as pessoas darem o melhor de si. Você pode gastar 2 PM para fazer um aliado em alcance curto rolar novamente um teste recém realizado.'),
    ('Lingua de Ouro', 'Nobre', 'Língua de Prata, 8º nível de nobre.', 'Você pode gastar uma ação padrão e 6 PM para gerar o efeito da magia Enfeitiçar com os aprimoramentos de sugerir ação e afetar todas as criaturas dentro do alcance (CD Car). Esta não é uma habilidade mágica e provém de sua capacidade de influenciar outras pessoas.'),
    ('Lingua de Prata', 'Nobre', '', 'Quando faz um teste de perícia baseada em Carisma, você pode gastar 2 PM para receber um bônus no teste igual a metade do seu nível.');


INSERT INTO Poderes_Classes (nomePoderClasse, nomeClassePertence, preRequisito, descricaoPoderClasse)
VALUES
    ('Arma Sagrada', 'Paladino', 'devoto de uma divindade (exceto Lena e Marah).', 'Se estiver empunhando a arma preferida de seu deus, o dado de dano que você rola por Golpe Divino aumenta para d12.'),
    ('Aura de Cura', 'Paladino', '6º nível de paladino.', 'Enquanto sua aura estiver ativa, no início de seus turnos, você e os aliados a sua escolha dentro dela curam um número de PV igual a 5 + seu bônus de Carisma.'),
    ('Julgamento Divino: Coragem', 'Paladino', '', 'Você pode gastar 2 PM para inspirar coragem em uma criatura em alcance curto, incluindo você mesmo. A criatura fica imune a efeitos de medo e recebe +2 em testes de ataque contra alvos de ND maior que o nível dela.'),
    ('Orar', 'Paladino', '', 'Você aprende e pode lançar uma magia divina de 1º círculo a sua escolha. Seu atributo-chave para esta magia é Sabedoria. Você pode escolher este poder quantas vezes quiser.'),
    ('Virtude Paladinesca: Caridade', 'Paladino', '', 'O custo de suas habilidades de paladino que tenham um aliado como alvo é reduzido em 1 PM.');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Classes (nomeClasse, pontosVida, pontosMana, pericias, proeficiencias, nomeHabClasse, nomePoderClasse)
VALUES
    ('Arcanista', 'Um arcanista começa com 8 pontos de vida (+ modificador de Constituição) e ganha 2 PV (+ mod. Con) por nível.', '6 PM por nível.', 'Misticismo (Int) e Vontade (Sab), mais 1 a sua escolha entre Conhecimento (Int), Iniciativa (Des), Ofício (Int) e Percepção (Sab).', 'Nenhuma', 'Caminho do Arcanista: Bruxo', 'Arcano de Batalha'),
    ('Barbaro', 'Um bárbaro começa com 24 pontos de vida (+ modificador de Constituição) e ganha 6 PV (+ mod. Con) por nível.', '3 PM por nível.', 'Fortitude (Con) e Luta (For), mais 4 a sua escolha entre Adestramento (Car), Atletismo (For), Cavalgar (Des), Iniciativa (Des), Intimidação (Car), Ofício (Int) e Percepção (Sab).', 'Armas marciais e escudos.', 'Fúria', 'Alma de Bronze'),
    ('Bardo', 'Um bardo começa com 12 pontos de vida (+ modificador de Constituição) e ganha 3 PV (+ mod. Con) por nível.', '4 PM por nível.', 'Atuação (Car) e Reflexos (Des) mais 6 a sua escolha entre Acrobacia (Des), Cavalgar (Des), Conhecimento (Int), Diplomacia (Car), Enganação (Car), Furtividade (Des), Iniciativa (Des), Intuição (Sab), Investigação (Int), Jogatina (Car), Ladinagem (Des), Luta (For), Misticismo (Int), Nobreza (Int), Percepção (Sab), Pontaria (Des), Religião (Sab) e Vontade (Sab).', 'Armas marciais', 'Inspiração', 'Arte Mágica'),
    ('Bucaneiro', 'Um bucaneiro começa com 16 pontos de vida (+ modificador de Constituição) e ganha 4 PV (+ mod. Con) por nível.', '3 PM por nível.', 'Luta (For) ou Pontaria (Des), Reflexos (Des), mais 4 a sua escolha entre Acrobacia (Des), Atletismo (For), Atuação (Car), Enganação (Car), Fortitude (Con), Furtividade (Des), Iniciativa (Des), Intimidação (Car), Jogatina (Car), Luta (For), Ofício (Int), Percepção (Sab), Pilotagem (Des) e Pontaria (Des).', 'Armas marciais', 'Audácia', 'Amigos no Porto'),
    ('Caçador', 'Um caçador começa com 16 pontos de vida (+ modificador de Constituição) e ganha 4 PV (+ mod. Con) por nível.', '4 PM por nível.', 'Luta (For) ou Pontaria (Des), Sobrevivência (Sab), mais 6 a sua escolha entre Adestramento (Car), Atletismo (For), Cavalgar (Des), Cura (Sab), Fortitude (Con), Furtividade (Des), Iniciativa (Des), Investigação (Int), Luta (For), Ofício (Int), Percepção (Sab), Pontaria (Des) e Reflexos (Des).', 'Armas marciais e escudos', 'Marca da Presa', 'Ambidestria'),
    ('Cavaleiro', 'Um cavaleiro começa com 20 pontos de vida (+ modificador de Constituição) e ganha 5 PV (+ mod. Con) por nível.', '3 PM por nível', 'Fortitude (Con) e Luta (For), mais 2 a sua escolha entre Adestramento (Car), Atletismo (For), Cavalgar (Des), Diplomacia (Car), Guerra (Int), Iniciativa (Des), Intimidação (Car), Nobreza (Int), Percepção (Sab) e Vontade (Sab).', 'Armas marciais, armaduras pesadas e escudos', 'Código de Honra', 'Armadura da Honra'),
    ('Clerigo', 'Um clérigo começa with 16 pontos de vida (+ modificador de Constituição) e ganha 4 PV (+ mod. Con) por nível.', '5 PM por nível.', 'Religião (Sab) e Vontade (Sab), mais 2 a sua escolha entre Conhecimento (Int), Cura (Sab), Diplomacia (Car), Fortitude (Con), Iniciativa (Des), Intuição (Sab), Luta (For), Misticismo (Int), Nobreza (Int), Ofício (Int) and Percepção (Sab).', 'Armaduras pesadas e escudos', 'Devoto - Clérigo', 'Autoridade Eclesiástica'),
    ('Druida', 'Um druida começa com 16 pontos de vida (+ modificador de Constituição) e ganha 4 PV (+ mod. Con) por nível.', '4 PM por nível.', 'Sobrevivência (Sab) and Vontade (Sab), plus 4 a sua escolha entre Adestramento (Car), Atletismo (For), Cavalgar (Des), Conhecimento (Int), Cura (Sab), Fortitude (Con), Iniciativa (Des), Intuição (Sab), Luta (For), Misticismo (Int), Ofício (Int), Percepção (Sab) e Religião (Sab).', 'Escudos', 'Devoto - Druida', 'Aspecto do Inverno'),
    ('Guerreiro', 'Um guerreiro começa com 20 pontos de vida (+ modificador de Constituição) and ganha 5 PV (+ mod. Con) por nível.', '3 PM por nível.', 'Luta (For) ou Pontaria (Des), Fortitude (Con), mais 2 a sua escolha entre Adestramento (Car), Atletismo (For), Cavalgar (Des), Guerra (Int), Iniciativa (Des), Intimidação (Car), Luta (For), Ofício (Int), Percepção (Sab), Pontaria (Des) e Reflexos (Des).', 'Armas marciais, armaduras pesadas e escudos', 'Ataque Especial', 'Ataque Reflexo'),
    ('Inventor', 'Um inventor começa com 12 pontos de vida (+ modificador de Constituição) e ganha 3 PV (+ mod. Con) por nível.', '4 PM por nível.', 'Ofício (Int) and Vontade (Sab), plus 4 a sua escolha entre Conhecimento (Int), Cura (Sab), Diplomacia (Car), Fortitude (Con), Iniciativa (Des), Investigação (Int), Luta (For), Misticismo(Int), Ofício (Int), Pilotagem (Des), Pontaria (Des) e Percepção (Sab).', 'Nenhuma', 'Engenhosidade', 'Agite Antes de Usar'),
    ('Ladino', 'Um ladino começa com 12 pontos de vida (+ modificador de Constituição) and ganha 3 PV (+ mod. Con) por nível.', '4 PM por nível.', 'Ladinagem (Des) and Reflexos (Des), plus 8 a sua escolha entre Acrobacia (Des), Atletismo (For), Atuação (Car), Cavalgar (Des), Conhecimento (Int), Diplomacia (Car), Enganação (Car), Furtividade (Des), Iniciativa (Des), Intimidação (Car), Intuição (Sab), Investigação (Int), Jogatina (Car), Luta (For), Ofício (Int), Percepção (Sab), Pilotagem (Des) e Pontaria (Des).', 'Nenhuma', 'Ataque Furtivo', 'Assassinar'),
    ('Lutador', 'Um lutador começa com 20 pontos de vida (+ modificador de Constituição) and ganha 5 PV (+ mod. Con) por nível.', '3 PM por nível', 'Fortitude (Con) and Luta (For), plus 4 a sua escolha entre Acrobacia (Des), Adestramento (Car), Atletismo (For), Enganação (Car), Furtividade (Des), Iniciativa (Des), Intimidação (Car), Ofício (Int), Percepção (Sab), Pontaria (Des) and Reflexos (Des).', 'Nenhuma', 'Briga', 'Até Acertar'),
    ('Nobre', 'Um nobre começa com 16 pontos de vida (+ modificador de Constituição) and ganha 4 PV (+ mod. Con) por nível.', '4 PM por nível', 'Diplomacia (Car) ou Intimidação (Car), Vontade (Sab), plus 4 a sua escolha entre Adestramento (Car), Atuação (Car), Cavalgar (Des), Conhecimento (Int), Diplomacia (Car), Enganação (Car), Fortitude (Con), Guerra (Int), Iniciativa (Des), Intimidação (Car), Intuição (Sab), Investigação (Int), Jogatina (Car), Luta (For), Nobreza (Int), Ofício (Int), Percepção (Sab) and Pontaria (Des).', 'Armas marciais, armaduras pesadas e escudos', 'Autoconfiança', 'Armadura Brilhante'),
    ('Paladino', 'Um paladino começa com 20 pontos de vida (+ modificador de Constituição) and ganha 5 PV (+ mod. Con) por nível.', '3 PM por nível', 'Luta (For) and Vontade (Sab) plus 2 a sua escolha entre Adestramento (Car), Atletismo (For), Cavalgar (Des), Cura (Sab), Diplomacia (Car), Fortitude (Con), Guerra (Int), Iniciativa (Des), Intuição (Sab), Nobreza (Int), Percepção (Sab) and Religião (Sab).', 'Armas marciais, armaduras pesadas e escudos', 'Abençoado', 'Arma Sagrada');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Personagem (nomePersonagem, nivelPersonagem, atrFor, atrDes, atrCons, atrInt, atrSab, atrCar, nomeRaca, nomeOrigem)
VALUES
('Eldran', 8, 14, 10, 12, 16, 8, 14, 'Elfo', 'Amigo dos Animais'),
('Thorn', 6, 18, 12, 14, 10, 8, 12, 'Anão', 'Assistente de Laboratório'),
('Luna', 5, 10, 16, 14, 14, 12, 10, 'Elfo', 'Amnésico'),
('Grimm', 9, 20, 14, 16, 12, 10, 8, 'Minotauro', 'Aristocrata'),
('Seraphina', 4, 8, 16, 12, 18, 14, 12, 'Dahllan', 'Marujo'),
('Aeris', 7, 16, 14, 10, 12, 16, 10, 'Elfo', 'Criminoso'),
('Doran', 10, 18, 12, 16, 8, 10, 12, 'Humano', 'Herói Camponês'),
('Lyria', 3, 14, 14, 10, 14, 16, 12, 'Elfo', 'Estudioso'),
('Kaldor', 11, 20, 14, 12, 10, 12, 8, 'Goblin', 'Fazendeiro'),
('Evelyn', 8, 16, 12, 14, 14, 14, 10, 'Lefou', 'Guarda'),
('Thalia', 6, 12, 16, 14, 12, 10, 18, 'Elfo', 'Eremita'),
('Branor', 5, 12, 18, 16, 8, 12, 12, 'Minotauro', 'Charlatão'),
('Fenrir', 4, 14, 10, 14, 12, 14, 16, 'Qareen', 'Herói Camponês'),
('Sylas', 9, 18, 12, 14, 10, 12, 16, 'Goblin', 'Herói Camponês'),
('Isolde', 7, 16, 14, 14, 10, 14, 12, 'Elfo', 'Estudioso'),
('Kara', 10, 20, 12, 14, 14, 8, 14, 'Anão', 'Marujo'),
('Naria', 11, 16, 12, 16, 12, 14, 8, 'Elfo', 'Eremita'),
('Caelum', 8, 14, 14, 12, 16, 12, 10, 'Lefou', 'Eremita'),
('Gorrim', 6, 16, 10, 14, 14, 12, 12, 'Goblin', 'Herói Camponês'),
('Elira', 5, 14, 12, 12, 14, 18, 10, 'Dahllan', 'Circense'),
('Dralen', 4, 10, 16, 14, 12, 14, 16, 'Anão', 'Herói Camponês'),
('Thessa', 9, 18, 12, 14, 10, 12, 16, 'Goblin', 'Guarda'),
('Aeryn', 7, 16, 14, 10, 14, 12, 14, 'Elfo', 'Artesão'),
('orik', 10, 20, 14, 12, 10, 14, 12, 'Minotauro', 'Marujo'),
('Soraya', 11, 16, 12, 16, 14, 10, 12, 'Elfo', 'Charlatão'),
('Kythos', 8, 16, 14, 10, 14, 14, 12, 'Dahllan', 'Eremita'),
('Nyx', 6, 12, 14, 12, 18, 12, 10, 'Elfo', 'Fazendeiro'),
('Varis', 5, 14, 16, 10, 12, 18, 12, 'Goblin', 'Herói Camponês'),
('Aria', 4, 14, 12, 14, 12, 16, 10, 'Elfo', 'Circense'),
('Vaelin', 9, 18, 14, 10, 16, 12, 12, 'Minotauro', 'Marujo'),
('Elysia', 7, 16, 14, 12, 12, 14, 12, 'Lefou', 'Estudioso');

-----------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Multiclasse (nomePersonagem, nomeClasse) VALUES
('Eldran', 'Bardo'),
('Eldran', 'Paladino'),
('Thorn', 'Guerreiro'),
('Thorn', 'Ladino'),
('Luna', 'Druida'),
('Luna', 'Arcanista'),
('Grimm', 'Paladino'),
('Grimm', 'Barbaro'),
('Seraphina', 'Clerigo'),
('Seraphina', 'Arcanista'),
('Aeris', 'Ladino'),
('Aeris', 'Arcanista'),
('Doran', 'Barbaro'),
('Doran', 'Guerreiro'),
('Lyria', 'Arcanista'),
('Lyria', 'Bardo'),
('Kaldor', 'Caçador'),
('Kaldor', 'Arcanista'),
('Evelyn', 'Cavaleiro'),
('Evelyn', 'Clerigo'),
('Thalia', 'Bardo'),
('Thalia', 'Druida'),
('Branor', 'Lutador'),
('Branor', 'Barbaro'),
('Fenrir', 'Druida'),
('Fenrir', 'Lutador'),
('Sylas', 'Lutador'),
('Sylas', 'Arcanista'),
('Isolde', 'Clerigo'),
('Isolde', 'Cavaleiro'),
('Gorrim', 'Guerreiro'),
('Elira', 'Ladino'),
('Dralen', 'Paladino'),
('Thessa', 'Cavaleiro'),
('Aeryn', 'Guerreiro'),
('orik', 'Barbaro'),
('Soraya', 'Bardo'),
('Kythos', 'Druida'),
('Nyx', 'Lutador'),
('Varis', 'Caçador'),
('Aria', 'Clerigo'),
('Vaelin', 'Paladino'),
('Elysia', 'Arcanista'),
('Caelum', 'Lutador'),
('Kara', 'Inventor'),
('Naria', 'Bardo');



SELECT * FROM Hab_Raca;

SELECT * FROM Racas;

SELECT r.nomeRaca, r.modAtributo, hr.nomeHabRaca
	FROM Racas r
	JOIN Hab_Raca hr ON r.nomeRaca = hr.nomeRacaPertence;
	
SELECT r.nomeRaca, hr.nomeHabRaca, hr.descricaoHabRaca
	FROM Racas r
	JOIN Hab_Raca hr ON r.nomeRaca = hr.nomeRacaPertence;

SELECT * From Origens;

SELECT * From Hab_Classes;

SELECT * From Poderes_Classes;

SELECT * From Classes;

SELECT c.nomeClasse, hc.nomeHabClasse, pc.nomePoderClasse
FROM Classes c
JOIN Hab_Classes hc ON c.nomeClasse = hc.nomeClassePertence
JOIN Poderes_Classes pc ON c.nomeClasse = pc.nomeClassePertence;

SELECT * FROM Personagem;

SELECT 
    P.*,
    C.nomeClasse
FROM 
    Personagem P
JOIN 
    Multiclasse M ON P.nomePersonagem = M.nomePersonagem
JOIN 
    Classes C ON M.nomeClasse = C.nomeClasse;


SELECT * FROM Personagem WHERE nomeRaca = 'Minotauro' ORDER BY nomePersonagem;

SELECT * FROM Personagem WHERE nivelPersonagem = '5' ORDER BY nomePersonagem;



--\d
--\set QUIET OFF