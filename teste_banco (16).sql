-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/08/2025 às 15:40
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `teste_banco`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `conversas`
--

CREATE TABLE `conversas` (
  `id` int(11) NOT NULL,
  `usuario1_id` int(10) UNSIGNED NOT NULL,
  `usuario2_id` int(10) UNSIGNED NOT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conversas`
--

INSERT INTO `conversas` (`id`, `usuario1_id`, `usuario2_id`, `data_criacao`) VALUES
(1, 11, 1, '2025-08-14 13:31:55'),
(2, 11, 2, '2025-08-14 13:31:55'),
(3, 11, 12, '2025-08-14 13:31:55'),
(4, 11, 10, '2025-08-14 13:37:40');

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `data_evento` date NOT NULL,
  `hora_evento` time NOT NULL,
  `local_evento` varchar(255) DEFAULT NULL,
  `tipo` enum('palestra','workshop','reuniao','outro') DEFAULT 'palestra',
  `criador_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `eventos`
--

INSERT INTO `eventos` (`id`, `titulo`, `descricao`, `data_evento`, `hora_evento`, `local_evento`, `tipo`, `criador_id`) VALUES
(1, 'Workshop de Docker', 'Aprenda a containerizar aplicações com Docker', '2023-05-15', '14:00:00', 'Laboratório 5', 'workshop', 2),
(2, 'Palestra: Carreira em TI', 'Mercado de trabalho e oportunidades na área de tecnologia', '2023-05-20', '19:30:00', 'Auditório Principal', 'palestra', 3),
(3, 'Hackathon de Inovação', 'Maratona de desenvolvimento de soluções tecnológicas', '2023-06-10', '09:00:00', 'Biblioteca Central', 'outro', 4),
(4, 'Oficina de Git e GitHub', 'Controle de versão e colaboração em projetos', '2023-06-15', '16:00:00', 'Sala 203', 'workshop', 5),
(5, 'Discussão: Ética em IA', 'Debate sobre implicações éticas do uso de inteligência artificial', '2023-07-05', '18:00:00', 'Sala Virtual', 'palestra', 11);

-- --------------------------------------------------------

--
-- Estrutura para tabela `evento_participantes`
--

CREATE TABLE `evento_participantes` (
  `evento_id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_confirmacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `evento_participantes`
--

INSERT INTO `evento_participantes` (`evento_id`, `usuario_id`, `data_confirmacao`) VALUES
(1, 14, '2025-08-20 14:35:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupos`
--

CREATE TABLE `grupos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `criador_id` int(10) UNSIGNED NOT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `grupos`
--

INSERT INTO `grupos` (`id`, `nome`, `descricao`, `criador_id`, `data_criacao`) VALUES
(1, 'Estudantes de Banco de Dados', 'Grupo para discussão de tópicos avançados em bancos de dados relacionais e NoSQL', 2, '2025-08-07 13:41:53'),
(2, 'Grupo de Estudos de IA', 'Comunidade para aprender e aplicar conceitos de Inteligência Artificial', 3, '2025-08-07 13:41:53'),
(3, 'Desenvolvedores Front-end', 'Compartilhamento de recursos e técnicas modernas de desenvolvimento web', 4, '2025-08-07 13:41:53'),
(4, 'Pesquisadores de Machine Learning', 'Discussão de artigos científicos e projetos práticos em ML', 5, '2025-08-07 13:41:53'),
(5, 'Tecnologia na Educação', 'Como aplicar inovações tecnológicas para melhorar o ensino', 11, '2025-08-07 13:41:53'),
(6, 'Mario', 'Grupo do mario', 11, '2025-08-07 14:23:06'),
(7, 'skibidi sigma123', 'sigma123', 11, '2025-08-07 14:23:27'),
(8, 'Sarturneiros', 'Vaca sartuaniada ', 11, '2025-08-07 14:24:18'),
(9, 'Admin1', '123', 11, '2025-08-07 14:36:42'),
(10, 'Admin1', '123', 11, '2025-08-07 14:37:17'),
(11, 'Admin1', '123', 11, '2025-08-07 14:38:48'),
(12, 'Grupo1', 'seguidor_id', 11, '2025-08-07 16:12:41'),
(13, 'Grupo2', 'Grupo2', 11, '2025-08-07 16:13:35'),
(14, 'Grupo3', 'Grupo3', 11, '2025-08-07 16:13:42'),
(15, 'Grupo4', 'Grupo4', 11, '2025-08-07 16:13:50'),
(16, 'Grupo5', 'Grupo5', 11, '2025-08-07 16:14:02'),
(17, 'Grupo99', 'Grupo99', 11, '2025-08-13 14:20:16'),
(18, '1', '1', 11, '2025-08-20 13:51:28'),
(19, 'arnaldopenis', 'arnaldopenis', 14, '2025-08-20 14:32:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_membros`
--

CREATE TABLE `grupo_membros` (
  `grupo_id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_ingresso` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `grupo_membros`
--

INSERT INTO `grupo_membros` (`grupo_id`, `usuario_id`, `data_ingresso`) VALUES
(1, 2, '2025-08-07 13:42:04'),
(1, 3, '2025-08-07 13:42:04'),
(1, 4, '2025-08-07 13:42:04'),
(1, 5, '2025-08-07 13:42:04'),
(1, 11, '2025-08-07 14:21:07'),
(2, 3, '2025-08-07 13:42:04'),
(2, 4, '2025-08-07 13:42:04'),
(2, 5, '2025-08-07 13:42:04'),
(2, 6, '2025-08-07 13:42:04'),
(2, 11, '2025-08-07 14:30:48'),
(3, 4, '2025-08-07 13:42:04'),
(3, 5, '2025-08-07 13:42:04'),
(3, 6, '2025-08-07 13:42:04'),
(3, 7, '2025-08-07 13:42:04'),
(3, 11, '2025-08-07 14:22:24'),
(4, 5, '2025-08-07 13:42:04'),
(4, 6, '2025-08-07 13:42:04'),
(4, 7, '2025-08-07 13:42:04'),
(4, 8, '2025-08-07 13:42:04'),
(4, 11, '2025-08-07 14:24:39'),
(5, 2, '2025-08-07 13:42:04'),
(5, 3, '2025-08-07 13:42:04'),
(5, 4, '2025-08-07 13:42:04'),
(5, 11, '2025-08-07 13:42:04'),
(6, 11, '2025-08-07 14:23:06'),
(7, 11, '2025-08-07 14:23:27'),
(7, 14, '2025-08-20 14:32:49'),
(8, 11, '2025-08-07 14:24:18'),
(8, 14, '2025-08-20 14:32:59'),
(9, 11, '2025-08-07 14:36:42'),
(10, 11, '2025-08-07 14:37:17'),
(11, 11, '2025-08-07 14:38:48'),
(12, 11, '2025-08-07 16:12:41'),
(13, 11, '2025-08-07 16:13:35'),
(14, 11, '2025-08-07 16:13:42'),
(14, 14, '2025-08-20 14:36:39'),
(15, 11, '2025-08-07 16:13:50'),
(15, 14, '2025-08-20 14:36:36'),
(16, 11, '2025-08-07 16:14:02'),
(16, 12, '2025-08-08 08:06:28'),
(16, 13, '2025-08-20 14:26:59'),
(17, 11, '2025-08-13 14:20:16'),
(17, 12, '2025-08-14 14:11:41'),
(17, 13, '2025-08-20 14:26:58'),
(17, 14, '2025-08-20 14:34:46'),
(18, 11, '2025-08-20 13:51:28'),
(18, 13, '2025-08-20 14:26:55'),
(18, 14, '2025-08-20 14:32:24'),
(19, 14, '2025-08-20 14:32:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_visualizacoes`
--

CREATE TABLE `grupo_visualizacoes` (
  `grupo_id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `ultima_visualizacao` int(11) DEFAULT 0,
  `data_atualizacao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `grupo_visualizacoes`
--

INSERT INTO `grupo_visualizacoes` (`grupo_id`, `usuario_id`, `ultima_visualizacao`, `data_atualizacao`) VALUES
(1, 11, 0, '2025-08-14 14:12:44'),
(2, 11, 0, '2025-08-14 14:12:44'),
(3, 11, 0, '2025-08-14 14:12:28'),
(3, 12, 0, '2025-08-14 14:11:59'),
(4, 11, 0, '2025-08-14 14:12:30'),
(5, 11, 0, '2025-08-14 14:57:44'),
(6, 11, 0, '2025-08-14 14:34:56'),
(7, 14, 0, '2025-08-20 14:34:18'),
(15, 11, 0, '2025-08-15 08:20:45'),
(16, 11, 21, '2025-08-20 14:28:32'),
(16, 12, 18, '2025-08-20 13:53:56'),
(16, 13, 21, '2025-08-20 14:27:20'),
(17, 11, 22, '2025-08-20 14:28:31'),
(17, 12, 17, '2025-08-20 13:54:05'),
(17, 13, 22, '2025-08-20 14:27:25'),
(17, 14, 22, '2025-08-20 14:36:21'),
(18, 11, 27, '2025-08-21 13:29:54'),
(18, 13, 20, '2025-08-20 14:27:12'),
(18, 14, 27, '2025-08-20 14:34:11');

-- --------------------------------------------------------

--
-- Estrutura para tabela `materiais`
--

CREATE TABLE `materiais` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `materia` varchar(100) NOT NULL DEFAULT 'Geral',
  `descricao` text DEFAULT NULL,
  `tipo` enum('documento','video','link','outro') DEFAULT 'documento',
  `url` varchar(255) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `data_publicacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `materiais`
--

INSERT INTO `materiais` (`id`, `titulo`, `materia`, `descricao`, `tipo`, `url`, `usuario_id`, `data_publicacao`) VALUES
(1, 'Guia de Normalização de Dados', 'Geral', 'Material completo sobre formas normais e boas práticas em modelagem de dados', 'documento', 'https://drive.com/normalizacao.pdf', 2, '2025-08-07 13:42:13'),
(2, 'Introdução ao React.js', 'Geral', 'Tutorial básico para iniciantes em desenvolvimento front-end', 'documento', 'https://drive.com/react-intro.pdf', 3, '2025-08-07 13:42:13'),
(3, 'Vídeo: Criando APIs RESTful', 'Geral', 'Gravação da aula sobre desenvolvimento de APIs com Node.js', 'video', 'https://youtube.com/api-rest', 4, '2025-08-07 13:42:13'),
(4, 'Coleção de Exercícios SQL', 'Geral', 'Problemas práticos para aprimorar habilidades em consultas SQL', 'documento', 'https://drive.com/exercicios-sql.pdf', 5, '2025-08-07 13:42:13'),
(5, 'Fundamentos de Machine Learning', 'Geral', 'Apresentação sobre conceitos básicos de aprendizado de máquina', 'documento', 'https://drive.com/ml-fundamentos.pdf', 11, '2025-08-07 13:42:13'),
(6, 'Apostila de Álgebra', 'Matemática', 'Material introdutório de equações do 1º grau', 'documento', 'http://exemplo.com/algebra.pdf', 1, '2025-08-21 16:48:54'),
(7, 'Exercícios de Geometria', 'Matemática', 'Lista com problemas de ângulos e áreas', 'documento', 'http://exemplo.com/geometria.pdf', 1, '2025-08-21 16:48:54'),
(8, 'Vídeo de Trigonometria', 'Matemática', 'Explicação sobre seno, cosseno e tangente', 'video', 'http://exemplo.com/trigonometria.mp4', 2, '2025-08-21 16:48:54'),
(9, 'Experimentos de Mecânica', 'Física', 'Vídeo prático sobre as Leis de Newton', 'video', 'http://exemplo.com/mecanica.mp4', 2, '2025-08-21 16:48:54'),
(10, 'Apostila de Termodinâmica', 'Física', 'Teoria básica com exercícios resolvidos', 'documento', 'http://exemplo.com/termodinamica.pdf', 1, '2025-08-21 16:48:54'),
(11, 'Tabela Periódica Completa', 'Química', 'Tabela interativa para estudo', 'link', 'http://exemplo.com/tabela', 1, '2025-08-21 16:48:54'),
(12, 'Reações Orgânicas', 'Química', 'Resumo das principais reações orgânicas', 'documento', 'http://exemplo.com/organica.pdf', 2, '2025-08-21 16:48:54'),
(13, 'Revolução Francesa', 'História', 'Resumo dos principais acontecimentos', 'documento', 'http://exemplo.com/revolucao.pdf', 1, '2025-08-21 16:48:54'),
(14, 'Guerras Mundiais', 'História', 'Vídeo aula sobre a Primeira e Segunda Guerra', 'video', 'http://exemplo.com/guerras.mp4', 2, '2025-08-21 16:48:54'),
(15, 'Regras de Crase', 'Português', 'Resumo ilustrado com exemplos práticos', 'documento', 'http://exemplo.com/crase.pdf', 1, '2025-08-21 16:48:54'),
(16, 'Vídeo de Interpretação de Texto', 'Português', 'Explicação de técnicas de leitura', 'video', 'http://exemplo.com/interpretacao.mp4', 2, '2025-08-21 16:48:54');

-- --------------------------------------------------------

--
-- Estrutura para tabela `material_avaliacoes`
--

CREATE TABLE `material_avaliacoes` (
  `id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `avaliacao` tinyint(4) DEFAULT NULL CHECK (`avaliacao` between 1 and 5),
  `data_avaliacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` int(11) NOT NULL,
  `conversa_id` int(11) NOT NULL,
  `remetente_id` int(10) UNSIGNED NOT NULL,
  `conteudo` text NOT NULL,
  `data_envio` datetime DEFAULT current_timestamp(),
  `lida` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mensagens`
--

INSERT INTO `mensagens` (`id`, `conversa_id`, `remetente_id`, `conteudo`, `data_envio`, `lida`) VALUES
(1, 1, 11, 'Olá administrador, preciso de ajuda com meu perfil', '2025-08-14 13:31:55', 0),
(2, 1, 1, 'Claro Mario, no que posso ajudar?', '2025-08-14 13:31:55', 1),
(3, 1, 11, 'Não consigo editar minhas informações pessoais', '2025-08-14 13:31:55', 0),
(4, 1, 1, 'Vou verificar isso para você', '2025-08-14 13:31:55', 1),
(5, 2, 11, 'Oi João, você tem o material de Docker?', '2025-08-14 13:31:55', 0),
(6, 2, 2, 'Sim Mario, vou te enviar o link', '2025-08-14 13:31:55', 1),
(7, 2, 2, 'https://drive.com/normalizacao.pdf', '2025-08-14 13:31:55', 1),
(8, 3, 12, 'Oi Mario, tudo bem?', '2025-08-14 13:31:55', 1),
(9, 3, 11, 'Tudo sim Asdrubal! E com você?', '2025-08-14 13:31:55', 1),
(10, 3, 12, 'Estou estudando PHP, tem alguma dica?', '2025-08-14 13:31:55', 1),
(11, 4, 11, 'Opa', '2025-08-14 13:37:45', 0),
(12, 3, 11, 'Oi', '2025-08-14 13:38:03', 1),
(13, 3, 12, 'Olá', '2025-08-14 13:59:16', 1),
(14, 3, 12, 'Olá', '2025-08-14 13:59:16', 1),
(15, 3, 12, 'vish', '2025-08-14 13:59:21', 1),
(16, 3, 12, 'vish', '2025-08-14 13:59:21', 1),
(17, 3, 12, 'A', '2025-08-14 13:59:28', 1),
(18, 3, 12, 'A', '2025-08-14 13:59:28', 1),
(19, 3, 12, 'Uma', '2025-08-14 13:59:42', 1),
(20, 3, 12, 'Uma', '2025-08-14 13:59:42', 1),
(21, 3, 12, 'duas', '2025-08-14 13:59:54', 1),
(22, 3, 12, 'duas', '2025-08-14 13:59:54', 1),
(23, 3, 12, 'a', '2025-08-14 14:00:31', 1),
(24, 3, 12, 'aa', '2025-08-14 14:00:40', 1),
(25, 3, 12, 'p', '2025-08-14 14:00:46', 1),
(26, 3, 12, 'p', '2025-08-14 14:00:46', 1),
(27, 2, 11, 'opa', '2025-08-14 14:57:18', 0),
(28, 2, 11, 'opa', '2025-08-14 14:57:18', 0),
(29, 2, 11, 'a', '2025-08-14 15:25:32', 0),
(30, 2, 11, 'a', '2025-08-14 15:25:32', 0),
(31, 2, 11, 'Olá', '2025-08-15 08:08:25', 0),
(32, 3, 11, 'digitei isso no Mario Gonçalves', '2025-08-20 13:50:31', 1),
(33, 3, 12, 'a', '2025-08-20 14:22:24', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensagens_grupo`
--

CREATE TABLE `mensagens_grupo` (
  `id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `remetente_id` int(10) UNSIGNED NOT NULL,
  `conteudo` text NOT NULL,
  `data_envio` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mensagens_grupo`
--

INSERT INTO `mensagens_grupo` (`id`, `grupo_id`, `remetente_id`, `conteudo`, `data_envio`) VALUES
(1, 17, 12, 'Olá', '2025-08-14 14:11:49'),
(2, 17, 12, 'Olá', '2025-08-14 14:11:49'),
(3, 17, 12, 'ola', '2025-08-14 14:11:55'),
(4, 17, 11, 'vish', '2025-08-14 14:12:37'),
(5, 17, 11, 'digitei isso no Mario Gonçalves', '2025-08-14 15:50:26'),
(6, 17, 12, 'oi', '2025-08-14 15:51:48'),
(7, 17, 12, 'oi', '2025-08-14 15:51:48'),
(8, 16, 12, 'Muito bom', '2025-08-14 15:52:02'),
(9, 16, 12, 'Muito bom', '2025-08-14 15:52:02'),
(10, 17, 11, 'amem', '2025-08-14 15:53:47'),
(11, 16, 11, 'nice', '2025-08-14 15:59:11'),
(12, 16, 11, 'a', '2025-08-14 16:00:11'),
(13, 16, 11, 'text', '2025-08-15 08:28:53'),
(14, 16, 11, 'a', '2025-08-15 08:34:15'),
(15, 17, 11, 'Muito bom', '2025-08-15 08:34:33'),
(16, 17, 11, 'aa', '2025-08-15 08:56:23'),
(17, 17, 11, 'aa', '2025-08-15 08:56:23'),
(18, 16, 11, 'teste', '2025-08-15 09:01:49'),
(19, 18, 11, 'digitei isso no Mario Gonçalves', '2025-08-20 13:51:48'),
(20, 18, 13, 'Legal', '2025-08-20 14:27:12'),
(21, 16, 13, 'Very Well', '2025-08-20 14:27:20'),
(22, 17, 13, 'Legal', '2025-08-20 14:27:25'),
(23, 18, 14, 'Very Well', '2025-08-20 14:33:49'),
(24, 18, 14, 'Very Well', '2025-08-20 14:33:49'),
(25, 18, 14, 'dukhytd', '2025-08-20 14:33:56'),
(26, 18, 14, 'dukhytd', '2025-08-20 14:33:56'),
(27, 18, 14, 'arnaldopinto', '2025-08-20 14:34:11');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type` enum('academic','materials','calendar') NOT NULL,
  `priority` enum('low','medium','high') NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `academicType` enum('homework','exam','deadline','event') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id`, `title`, `message`, `date`, `time`, `type`, `priority`, `read`, `academicType`) VALUES
(3, 'Material Disponível', 'O professor de Algoritmos disponibilizou o material para a próxima aula.', '2025-04-11', '16:20:00', 'materials', 'medium', 1, 'homework');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(10) UNSIGNED NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `idade` tinyint(3) UNSIGNED NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('ativo','inativo') NOT NULL DEFAULT 'ativo',
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `matricula`, `idade`, `foto`, `email`, `nome`, `senha`, `data_criacao`, `status`, `criado_em`, `atualizado_em`, `admin`) VALUES
(1, 'ADM001', 30, NULL, 'admin@email.com', 'Administrador do Sistema', '$2y$10$ExemploDeHashAdmin', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 1),
(2, '2023001', 20, NULL, 'aluno1@email.com', 'João Silva', '$2y$10$ExemploDeHash123', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(3, '2023002', 21, NULL, 'aluno2@email.com', 'Maria Oliveira', '$2y$10$ExemploDeHash456', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(4, '2023003', 22, NULL, 'aluno3@email.com', 'Carlos Pereira', '$2y$10$ExemploDeHash789', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(5, '2023004', 19, NULL, 'aluno4@email.com', 'Ana Santos', '$2y$10$ExemploDeHashABC', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(6, '2023005', 23, NULL, 'aluno5@email.com', 'Pedro Costa', '$2y$10$ExemploDeHashDEF', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(7, '2023006', 20, NULL, 'aluno6@email.com', 'Juliana Almeida', '$2y$10$ExemploDeHashGHI', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(8, '2023007', 21, NULL, 'aluno7@email.com', 'Fernando Lima', '$2y$10$ExemploDeHashJKL', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(9, '2023008', 22, NULL, 'aluno8@email.com', 'Mariana Ribeiro', '$2y$10$ExemploDeHashMNO', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(10, '2023009', 19, NULL, 'aluno9@email.com', 'Ricardo Gomes', '$2y$10$ExemploDeHashPQR', '2025-05-30 09:12:35', 'ativo', '2025-05-30 09:12:35', '2025-05-30 09:12:35', 0),
(11, 'U20256959', 0, NULL, 'mario.junior2@alunos.sc.senac.br', 'Mario Gonçalves', '$2y$10$iq7qXkniq8n0aE9m1xeEBeZHr/O.73LmsyHODFSKCv3HfMHvlz4Hm', '2025-07-04 09:12:24', 'ativo', '2025-07-04 09:12:24', '2025-08-07 08:34:35', 0),
(12, 'U20253258', 0, NULL, 'mario@gmail.com', 'Mario Gonzales', '$2y$10$HQkskavaHe80fi304S4BUuRB7cZsSxAmmDmlmWWh2KF8ztxAKZoRC', '2025-08-08 08:05:22', 'ativo', '2025-08-08 08:05:22', '2025-08-20 14:15:14', 0),
(13, 'U20250111', 0, NULL, 'mario1@gmail.com', 'Mario Segundo', '$2y$10$4U/N8SNFi9y/KNCjvF4.cemtw8AaJEmttnr3typErXsBGU1j1dBLi', '2025-08-20 14:26:43', 'ativo', '2025-08-20 14:26:43', '2025-08-20 14:27:46', 0),
(14, 'U20252181', 0, NULL, 'sjgrekif@gmail.com', 'pedro_primeiro', '$2y$10$OOYSZMe1PyUo.IxS9.VhQOXvwM9E89WaNAXIPnjGUPcT77zCzo28m', '2025-08-20 14:29:51', 'ativo', '2025-08-20 14:29:51', '2025-08-20 14:29:51', 0),
(15, 'U20252908', 0, NULL, 'shereksigma@gmail.com', 'shereksigma', '$2y$10$OIOJf1BonDKaXdQledSVEelz8dRUg/1ot4Kn7Z7ALriQXHgTvUJDC', '2025-08-20 14:41:24', 'ativo', '2025-08-20 14:41:24', '2025-08-20 14:41:24', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_aparencia`
--

CREATE TABLE `usuario_aparencia` (
  `id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `tema` enum('light','dark') DEFAULT 'dark',
  `tamanho_fonte` enum('small','medium','large') DEFAULT 'medium',
  `idioma` enum('pt-BR','en-US','es') DEFAULT 'pt-BR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_aparencia`
--

INSERT INTO `usuario_aparencia` (`id`, `usuario_id`, `tema`, `tamanho_fonte`, `idioma`) VALUES
(1, 2, 'dark', 'medium', 'pt-BR'),
(2, 3, 'light', 'small', 'en-US'),
(3, 4, 'dark', 'medium', 'pt-BR'),
(4, 5, 'dark', 'medium', 'pt-BR'),
(5, 6, 'dark', 'medium', 'pt-BR'),
(6, 7, 'dark', 'medium', 'pt-BR'),
(7, 8, 'dark', 'medium', 'pt-BR'),
(8, 9, 'dark', 'medium', 'pt-BR'),
(9, 10, 'dark', 'medium', 'pt-BR'),
(10, 1, 'dark', 'medium', 'pt-BR'),
(11, 11, 'light', 'large', 'pt-BR'),
(12, 12, 'dark', 'large', 'pt-BR'),
(13, 14, 'dark', 'small', 'en-US');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_config`
--

CREATE TABLE `usuario_config` (
  `id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `bio` text DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_config`
--

INSERT INTO `usuario_config` (`id`, `usuario_id`, `bio`, `telefone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrador do sistema com experiência em segurança de dados', '+55 11 91234-5678', '2025-07-09 17:49:50', '2025-07-09 17:49:50'),
(2, 2, 'Professor de Banco de Dados com 10 anos de experiência', '+55 11 98765-4321', '2025-07-09 17:49:50', '2025-08-07 16:43:29'),
(3, 11, 'homem masculino', '47988962224', '2025-07-14 17:01:40', '2025-08-20 16:52:40'),
(4, 12, 'Homem Lindao', '', '2025-08-08 11:07:08', '2025-08-08 11:07:08'),
(5, 13, 'Mario Segundo para Testes', '', '2025-08-20 17:27:37', '2025-08-20 17:27:37'),
(6, 14, 'se leu é gay', '11 4002-8922', '2025-08-20 17:31:07', '2025-08-20 17:31:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_notificacoes`
--

CREATE TABLE `usuario_notificacoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `mensagens` tinyint(1) DEFAULT 1,
  `matches` tinyint(1) DEFAULT 1,
  `grupos` tinyint(1) DEFAULT 1,
  `mencoes` tinyint(1) DEFAULT 1,
  `email_notificacoes` tinyint(1) DEFAULT 0,
  `push_notificacoes` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_notificacoes`
--

INSERT INTO `usuario_notificacoes` (`id`, `usuario_id`, `mensagens`, `matches`, `grupos`, `mencoes`, `email_notificacoes`, `push_notificacoes`) VALUES
(1, 2, 1, 1, 1, 1, 0, 1),
(2, 3, 1, 1, 1, 1, 0, 1),
(3, 4, 1, 1, 1, 1, 0, 1),
(4, 5, 1, 1, 1, 1, 0, 1),
(5, 6, 1, 1, 1, 1, 0, 1),
(6, 7, 1, 1, 1, 1, 0, 1),
(7, 8, 1, 1, 1, 1, 0, 1),
(8, 9, 1, 1, 1, 1, 0, 1),
(9, 10, 1, 1, 1, 1, 0, 1),
(10, 1, 1, 1, 1, 1, 0, 1),
(11, 11, 1, 1, 1, 1, 0, 1),
(12, 13, 1, 0, 0, 0, 0, 0),
(13, 14, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_privacidade`
--

CREATE TABLE `usuario_privacidade` (
  `id` int(11) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `perfil_visibilidade` enum('all','connections','nobody') DEFAULT 'all',
  `status_online` tinyint(1) DEFAULT 1,
  `confirmacoes_leitura` tinyint(1) DEFAULT 1,
  `coleta_dados` tinyint(1) DEFAULT 1,
  `expiracao_chat` enum('12h','24h','48h','never') DEFAULT '24h'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_privacidade`
--

INSERT INTO `usuario_privacidade` (`id`, `usuario_id`, `perfil_visibilidade`, `status_online`, `confirmacoes_leitura`, `coleta_dados`, `expiracao_chat`) VALUES
(1, 2, 'all', 1, 1, 1, '24h'),
(2, 3, 'all', 1, 1, 1, '24h'),
(3, 4, 'all', 1, 1, 1, '24h'),
(4, 5, 'all', 1, 1, 1, '24h'),
(5, 6, 'all', 1, 1, 1, '24h'),
(6, 7, 'all', 1, 1, 1, '24h'),
(7, 8, 'all', 1, 1, 1, '24h'),
(8, 9, 'all', 1, 1, 1, '24h'),
(9, 10, 'all', 1, 1, 1, '24h'),
(10, 1, 'all', 1, 1, 1, '24h'),
(11, 11, 'connections', 0, 0, 0, '24h'),
(12, 12, 'connections', 1, 1, 1, '24h'),
(13, 14, 'connections', 1, 1, 1, 'never');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_seguidores`
--

CREATE TABLE `usuario_seguidores` (
  `seguidor_id` int(10) UNSIGNED NOT NULL,
  `seguido_id` int(10) UNSIGNED NOT NULL,
  `data_seguimento` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_seguidores`
--

INSERT INTO `usuario_seguidores` (`seguidor_id`, `seguido_id`, `data_seguimento`) VALUES
(10, 11, '2025-08-07 14:04:27'),
(11, 1, '2025-08-07 14:04:21'),
(11, 2, '2025-08-07 14:06:10'),
(11, 3, '2025-08-07 16:31:06'),
(11, 4, '2025-08-07 16:10:15'),
(11, 5, '2025-08-07 16:11:41'),
(11, 6, '2025-08-07 16:11:26'),
(11, 7, '2025-08-07 16:11:07'),
(11, 8, '2025-08-20 13:52:22'),
(11, 12, '2025-08-08 08:08:45'),
(12, 11, '2025-08-08 08:06:46'),
(14, 6, '2025-08-20 14:35:35');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `conversas`
--
ALTER TABLE `conversas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario1_id` (`usuario1_id`),
  ADD KEY `usuario2_id` (`usuario2_id`);

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criador_id` (`criador_id`);

--
-- Índices de tabela `evento_participantes`
--
ALTER TABLE `evento_participantes`
  ADD PRIMARY KEY (`evento_id`,`usuario_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criador_id` (`criador_id`);

--
-- Índices de tabela `grupo_membros`
--
ALTER TABLE `grupo_membros`
  ADD PRIMARY KEY (`grupo_id`,`usuario_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `grupo_visualizacoes`
--
ALTER TABLE `grupo_visualizacoes`
  ADD PRIMARY KEY (`grupo_id`,`usuario_id`),
  ADD KEY `grupo_visualizacoes_ibfk_2` (`usuario_id`);

--
-- Índices de tabela `materiais`
--
ALTER TABLE `materiais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `material_avaliacoes`
--
ALTER TABLE `material_avaliacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversa_id` (`conversa_id`),
  ADD KEY `remetente_id` (`remetente_id`);

--
-- Índices de tabela `mensagens_grupo`
--
ALTER TABLE `mensagens_grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grupo_id` (`grupo_id`),
  ADD KEY `remetente_id` (`remetente_id`);

--
-- Índices de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `usuario_matricula_unique` (`matricula`),
  ADD UNIQUE KEY `usuario_email_unique` (`email`);

--
-- Índices de tabela `usuario_aparencia`
--
ALTER TABLE `usuario_aparencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuario_config`
--
ALTER TABLE `usuario_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuario_notificacoes`
--
ALTER TABLE `usuario_notificacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuario_privacidade`
--
ALTER TABLE `usuario_privacidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuario_seguidores`
--
ALTER TABLE `usuario_seguidores`
  ADD PRIMARY KEY (`seguidor_id`,`seguido_id`),
  ADD KEY `seguido_id` (`seguido_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `conversas`
--
ALTER TABLE `conversas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `materiais`
--
ALTER TABLE `materiais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `material_avaliacoes`
--
ALTER TABLE `material_avaliacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `mensagens_grupo`
--
ALTER TABLE `mensagens_grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `usuario_aparencia`
--
ALTER TABLE `usuario_aparencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `usuario_config`
--
ALTER TABLE `usuario_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario_notificacoes`
--
ALTER TABLE `usuario_notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `usuario_privacidade`
--
ALTER TABLE `usuario_privacidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `conversas`
--
ALTER TABLE `conversas`
  ADD CONSTRAINT `conversas_ibfk_1` FOREIGN KEY (`usuario1_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversas_ibfk_2` FOREIGN KEY (`usuario2_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`criador_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `evento_participantes`
--
ALTER TABLE `evento_participantes`
  ADD CONSTRAINT `evento_participantes_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `evento_participantes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`criador_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `grupo_membros`
--
ALTER TABLE `grupo_membros`
  ADD CONSTRAINT `grupo_membros_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grupo_membros_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `grupo_visualizacoes`
--
ALTER TABLE `grupo_visualizacoes`
  ADD CONSTRAINT `grupo_visualizacoes_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `grupo_visualizacoes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`);

--
-- Restrições para tabelas `materiais`
--
ALTER TABLE `materiais`
  ADD CONSTRAINT `materiais_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `material_avaliacoes`
--
ALTER TABLE `material_avaliacoes`
  ADD CONSTRAINT `material_avaliacoes_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `materiais` (`id`),
  ADD CONSTRAINT `material_avaliacoes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`);

--
-- Restrições para tabelas `mensagens`
--
ALTER TABLE `mensagens`
  ADD CONSTRAINT `mensagens_ibfk_1` FOREIGN KEY (`conversa_id`) REFERENCES `conversas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mensagens_ibfk_2` FOREIGN KEY (`remetente_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `mensagens_grupo`
--
ALTER TABLE `mensagens_grupo`
  ADD CONSTRAINT `mensagens_grupo_ibfk_1` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `mensagens_grupo_ibfk_2` FOREIGN KEY (`remetente_id`) REFERENCES `usuario` (`idusuario`);

--
-- Restrições para tabelas `usuario_aparencia`
--
ALTER TABLE `usuario_aparencia`
  ADD CONSTRAINT `usuario_aparencia_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_config`
--
ALTER TABLE `usuario_config`
  ADD CONSTRAINT `usuario_config_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_notificacoes`
--
ALTER TABLE `usuario_notificacoes`
  ADD CONSTRAINT `usuario_notificacoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_privacidade`
--
ALTER TABLE `usuario_privacidade`
  ADD CONSTRAINT `usuario_privacidade_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_seguidores`
--
ALTER TABLE `usuario_seguidores`
  ADD CONSTRAINT `usuario_seguidores_ibfk_1` FOREIGN KEY (`seguidor_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuario_seguidores_ibfk_2` FOREIGN KEY (`seguido_id`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
