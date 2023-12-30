/*
 Navicat SQL Server Data Transfer

 Source Server         : Sorteio WIDUP
 Source Server Type    : SQL Server
 Source Server Version : 12002148
 Source Host           : widup-prod.database.windows.net:1433
 Source Catalog        : widup
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 12002148
 File Encoding         : 65001

 Date: 11/05/2021 14:31:15
*/


-- ----------------------------
-- Table structure for CategoriaSorteio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoriaSorteio]') AND type IN ('U'))
	DROP TABLE [dbo].[CategoriaSorteio]
GO

CREATE TABLE [dbo].[CategoriaSorteio] (
  [id_categoria_sorteio] int  IDENTITY(1,1) NOT NULL,
  [nome] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [status] bit DEFAULT 0 NOT NULL
)
GO


-- ----------------------------
-- Records of CategoriaSorteio
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CategoriaSorteio] ON
GO

INSERT INTO [dbo].[CategoriaSorteio] ([id_categoria_sorteio], [nome], [status]) VALUES (N'1', N'Moto', N'0')
GO

INSERT INTO [dbo].[CategoriaSorteio] ([id_categoria_sorteio], [nome], [status]) VALUES (N'2', N'Celular', N'0')
GO

INSERT INTO [dbo].[CategoriaSorteio] ([id_categoria_sorteio], [nome], [status]) VALUES (N'3', N'Carro', N'0')
GO

INSERT INTO [dbo].[CategoriaSorteio] ([id_categoria_sorteio], [nome], [status]) VALUES (N'4', N'Casa', N'0')
GO

INSERT INTO [dbo].[CategoriaSorteio] ([id_categoria_sorteio], [nome], [status]) VALUES (N'5', N'Eletrodomésticos', N'0')
GO

INSERT INTO [dbo].[CategoriaSorteio] ([id_categoria_sorteio], [nome], [status]) VALUES (N'6', N'Carro 1', N'1')
GO

SET IDENTITY_INSERT [dbo].[CategoriaSorteio] OFF
GO


-- ----------------------------
-- Table structure for FormasDePagamento
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[FormasDePagamento]') AND type IN ('U'))
	DROP TABLE [dbo].[FormasDePagamento]
GO

CREATE TABLE [dbo].[FormasDePagamento] (
  [id_forma_de_pagamento] int  IDENTITY(1,1) NOT NULL,
  [nome_banco] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [codigo_banco] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [favorecido] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [cpf] varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [agencia] varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [conta] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [url_imagem] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [id_tipo_forma_de_pagamento] int  NOT NULL,
  [status] bit DEFAULT 0 NOT NULL,
  [pix] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- Records of FormasDePagamento
-- ----------------------------
SET IDENTITY_INSERT [dbo].[FormasDePagamento] ON
GO

INSERT INTO [dbo].[FormasDePagamento] ([id_forma_de_pagamento], [nome_banco], [codigo_banco], [favorecido], [cpf], [agencia], [conta], [url_imagem], [id_tipo_forma_de_pagamento], [status], [pix]) VALUES (N'0', N'Nu Pagamentos', N'260', N'VIP Prêmios RN', N'00.000.000/0000-00', N'0001', N'0000-0', N'https://cdnfiresorteios.blob.core.windows.net/imagens/62ce0f99-f829-464e-9beb-2042b7b79298.png', N'2', N'1', N'pix@vippremisorn.com')
GO

INSERT INTO [dbo].[FormasDePagamento] ([id_forma_de_pagamento], [nome_banco], [codigo_banco], [favorecido], [cpf], [agencia], [conta], [url_imagem], [id_tipo_forma_de_pagamento], [status], [pix]) VALUES (N'1', N'Nu Pagamentos', N'260', N'VIP Prêmios RN', N'00.000.000/0000-00', N'0001', N'0000-0', N'https://cdnfiresorteios.blob.core.windows.net/imagens/62ce0f99-f829-464e-9beb-2042b7b79298.png', N'2', N'1', N'pix@vippremisorn.com')
GO

INSERT INTO [dbo].[FormasDePagamento] ([id_forma_de_pagamento], [nome_banco], [codigo_banco], [favorecido], [cpf], [agencia], [conta], [url_imagem], [id_tipo_forma_de_pagamento], [status], [pix]) VALUES (N'2', N'BANCO INTER', N'077', N'MATHEUS FERREIRA ROSADO', N'100.226.614-92', N'0001', N'26722119', N'https://vippremios.blob.core.windows.net/imagens/0a79576d-118c-4e47-933b-ae188b5018ae.png', N'1', N'0', N'')
GO

INSERT INTO [dbo].[FormasDePagamento] ([id_forma_de_pagamento], [nome_banco], [codigo_banco], [favorecido], [cpf], [agencia], [conta], [url_imagem], [id_tipo_forma_de_pagamento], [status], [pix]) VALUES (N'3', N'BRADESCO', N'237', N'MATHEUS FERREIRA ROSADO', N'100.226.614-92', N'3728', N'90519-4', N'https://vippremios.blob.core.windows.net/imagens/3d35f35c-62a7-4463-8e3d-647c47c38cde.png', N'1', N'0', N'')
GO

INSERT INTO [dbo].[FormasDePagamento] ([id_forma_de_pagamento], [nome_banco], [codigo_banco], [favorecido], [cpf], [agencia], [conta], [url_imagem], [id_tipo_forma_de_pagamento], [status], [pix]) VALUES (N'4', N'PIC PAY', N'380', N'EMILY LAIZ TORRES CAVALCANTI', N'016.646.144-00', N'0001', N'11651417-5', N'https://vippremios.blob.core.windows.net/imagens/aa052a61-2f31-4570-ae4d-e22854af0bcc.png', N'1', N'0', N'')
GO

INSERT INTO [dbo].[FormasDePagamento] ([id_forma_de_pagamento], [nome_banco], [codigo_banco], [favorecido], [cpf], [agencia], [conta], [url_imagem], [id_tipo_forma_de_pagamento], [status], [pix]) VALUES (N'5', N'NUBANK PAGAMENTOS', N'260', N'EMILY LAIZ TORRES CAVALCANTI', N'016.646.144-00', N'0001', N'26076287-1', N'https://vippremios.blob.core.windows.net/imagens/e0787fd0-8b01-4354-a6d6-abd352a88973.png', N'1', N'0', N'')
GO

INSERT INTO [dbo].[FormasDePagamento] ([id_forma_de_pagamento], [nome_banco], [codigo_banco], [favorecido], [cpf], [agencia], [conta], [url_imagem], [id_tipo_forma_de_pagamento], [status], [pix]) VALUES (N'6', N'PIX', N'077', N'MATHEUS FERREIRA ROSADO', N'100.226.614-92', N'0001', N'26722119', N'https://vippremios.blob.core.windows.net/imagens/d48655e0-8af2-426b-a754-22c2b87b2267.png', N'2', N'0', N'100.226.614-92')
GO

SET IDENTITY_INSERT [dbo].[FormasDePagamento] OFF
GO


-- ----------------------------
-- Table structure for GaleriaFotos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[GaleriaFotos]') AND type IN ('U'))
	DROP TABLE [dbo].[GaleriaFotos]
GO

CREATE TABLE [dbo].[GaleriaFotos] (
  [id_galeria_fotos] int  IDENTITY(1,1) NOT NULL,
  [url_imagem] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [status] bit DEFAULT 0 NOT NULL,
  [id_sorteio] int  NOT NULL
)
GO


-- ----------------------------
-- Records of GaleriaFotos
-- ----------------------------
SET IDENTITY_INSERT [dbo].[GaleriaFotos] ON
GO

INSERT INTO [dbo].[GaleriaFotos] ([id_galeria_fotos], [url_imagem], [status], [id_sorteio]) VALUES (N'9', N'https://vippremios.blob.core.windows.net/imagens/08140d50-ed12-44c4-bfcf-bfd5c9414eaf.jpg', N'0', N'1')
GO

INSERT INTO [dbo].[GaleriaFotos] ([id_galeria_fotos], [url_imagem], [status], [id_sorteio]) VALUES (N'22', N'https://vippremios.blob.core.windows.net/imagens/a8ea9e82-3379-4815-ab9f-bcc5bddf355b.jpg', N'0', N'2')
GO

INSERT INTO [dbo].[GaleriaFotos] ([id_galeria_fotos], [url_imagem], [status], [id_sorteio]) VALUES (N'24', N'https://vippremios.blob.core.windows.net/imagens/0e3db893-1985-483e-a529-82dc47a103ad.jpg', N'0', N'5')
GO

INSERT INTO [dbo].[GaleriaFotos] ([id_galeria_fotos], [url_imagem], [status], [id_sorteio]) VALUES (N'25', N'https://vippremios.blob.core.windows.net/imagens/e30e4827-43f3-40b2-a5ba-1926deedcd75.jpg', N'0', N'5')
GO

INSERT INTO [dbo].[GaleriaFotos] ([id_galeria_fotos], [url_imagem], [status], [id_sorteio]) VALUES (N'73', N'https://vippremios.blob.core.windows.net/imagens/0d8de140-f510-406a-b142-de8baadd92ce.jpeg', N'0', N'6')
GO

INSERT INTO [dbo].[GaleriaFotos] ([id_galeria_fotos], [url_imagem], [status], [id_sorteio]) VALUES (N'74', N'https://vippremios.blob.core.windows.net/imagens/951a31b2-0856-4dc8-9225-350e360b00a5.jpeg', N'0', N'6')
GO

INSERT INTO [dbo].[GaleriaFotos] ([id_galeria_fotos], [url_imagem], [status], [id_sorteio]) VALUES (N'75', N'https://vippremios.blob.core.windows.net/imagens/bbd12f78-3d33-48c0-994a-0fc34c9deba8.jpeg', N'0', N'6')
GO

INSERT INTO [dbo].[GaleriaFotos] ([id_galeria_fotos], [url_imagem], [status], [id_sorteio]) VALUES (N'76', N'https://vippremios.blob.core.windows.net/imagens/7d539832-0757-493d-b834-f602c89894d4.jpeg', N'0', N'6')
GO

INSERT INTO [dbo].[GaleriaFotos] ([id_galeria_fotos], [url_imagem], [status], [id_sorteio]) VALUES (N'77', N'https://vippremios.blob.core.windows.net/imagens/d9eea1d4-a9ba-4250-9390-72e9c6d5237b.jpeg', N'0', N'6')
GO

SET IDENTITY_INSERT [dbo].[GaleriaFotos] OFF
GO


-- ----------------------------
-- Table structure for NumeroEscolhido
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[NumeroEscolhido]') AND type IN ('U'))
	DROP TABLE [dbo].[NumeroEscolhido]
GO

CREATE TABLE [dbo].[NumeroEscolhido] (
  [id_numero_escolhido] int  IDENTITY(1,1) NOT NULL,
  [id_pedido] int  NOT NULL,
  [numero] int  NOT NULL
)
GO


-- ----------------------------
-- Records of NumeroEscolhido
-- ----------------------------
SET IDENTITY_INSERT [dbo].[NumeroEscolhido] ON
GO

INSERT INTO [dbo].[NumeroEscolhido] ([id_numero_escolhido], [id_pedido], [numero]) VALUES (N'29', N'22', N'0')
GO

INSERT INTO [dbo].[NumeroEscolhido] ([id_numero_escolhido], [id_pedido], [numero]) VALUES (N'30', N'22', N'1')
GO

INSERT INTO [dbo].[NumeroEscolhido] ([id_numero_escolhido], [id_pedido], [numero]) VALUES (N'31', N'22', N'2')
GO

INSERT INTO [dbo].[NumeroEscolhido] ([id_numero_escolhido], [id_pedido], [numero]) VALUES (N'32', N'22', N'3')
GO

INSERT INTO [dbo].[NumeroEscolhido] ([id_numero_escolhido], [id_pedido], [numero]) VALUES (N'33', N'22', N'4')
GO

INSERT INTO [dbo].[NumeroEscolhido] ([id_numero_escolhido], [id_pedido], [numero]) VALUES (N'34', N'22', N'5')
GO

INSERT INTO [dbo].[NumeroEscolhido] ([id_numero_escolhido], [id_pedido], [numero]) VALUES (N'35', N'23', N'6')
GO

INSERT INTO [dbo].[NumeroEscolhido] ([id_numero_escolhido], [id_pedido], [numero]) VALUES (N'36', N'24', N'206')
GO

SET IDENTITY_INSERT [dbo].[NumeroEscolhido] OFF
GO


-- ----------------------------
-- Table structure for Pedido
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedido]') AND type IN ('U'))
	DROP TABLE [dbo].[Pedido]
GO

CREATE TABLE [dbo].[Pedido] (
  [id_pedido] int  IDENTITY(1,1) NOT NULL,
  [id_usuario] int  NOT NULL,
  [data_pedido] date  NOT NULL,
  [valor_total] decimal(7,2)  NOT NULL,
  [id_status_pedido] int  NOT NULL,
  [id_sorteio] int  NULL,
  [status] bit DEFAULT 0 NOT NULL
)
GO


-- ----------------------------
-- Records of Pedido
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Pedido] ON
GO

INSERT INTO [dbo].[Pedido] ([id_pedido], [id_usuario], [data_pedido], [valor_total], [id_status_pedido], [id_sorteio], [status]) VALUES (N'22', N'35', N'2021-05-09', N'210.00', N'2', N'1', N'1')
GO

INSERT INTO [dbo].[Pedido] ([id_pedido], [id_usuario], [data_pedido], [valor_total], [id_status_pedido], [id_sorteio], [status]) VALUES (N'23', N'36', N'2021-05-09', N'35.00', N'2', N'1', N'0')
GO

INSERT INTO [dbo].[Pedido] ([id_pedido], [id_usuario], [data_pedido], [valor_total], [id_status_pedido], [id_sorteio], [status]) VALUES (N'24', N'36', N'2021-05-11', N'79.00', N'1', N'6', N'0')
GO

SET IDENTITY_INSERT [dbo].[Pedido] OFF
GO


-- ----------------------------
-- Table structure for SchemaVersions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[SchemaVersions]') AND type IN ('U'))
	DROP TABLE [dbo].[SchemaVersions]
GO

CREATE TABLE [dbo].[SchemaVersions] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [ScriptName] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Applied] datetime  NOT NULL
)
GO


-- ----------------------------
-- Records of SchemaVersions
-- ----------------------------
SET IDENTITY_INSERT [dbo].[SchemaVersions] ON
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'3', N'Sorteio.Migration.Scripts.202104071044_Criacao_Tabela_Tipo_Usuario.sql', N'2021-04-07 11:17:26.197')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'4', N'Sorteio.Migration.Scripts.202104071052_Criacao_Tabelas.sql', N'2021-04-07 11:17:26.313')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'6', N'Sorteio.Migration.Scripts.202104071110_Criacao_Tabelas_FormasDePagamento.sql', N'2021-04-07 11:50:49.547')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'7', N'Sorteio.Migration.Scripts.202104081300_Criacao_Tabela_Usuario.sql', N'2021-04-08 13:07:11.397')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'8', N'Sorteio.Migration.Scripts.202104081310_Criacao_Tabela_Pedido.sql', N'2021-04-08 13:19:02.277')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'9', N'Sorteio.Migration.Scripts.202104081323_Alteracao_Adicionando_Status_nas_Tabelas.sql', N'2021-04-08 13:26:15.397')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'10', N'Sorteio.Migration.Scripts.202104081327_Criacao_Tabela_Numero_Escolhido.sql', N'2021-04-08 13:33:45.980')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'11', N'Sorteio.Migration.Scripts.202104081334_Criacao_Tabela_Sorteio.sql', N'2021-04-08 14:17:49.510')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'12', N'Sorteio.Migration.Scripts.202104081422_Criacao_Tabela_VencedorSorteio.sql', N'2021-04-08 14:28:45.033')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'13', N'Sorteio.Migration.Scripts.202104081432_Alteracao_Tabela_Sorteio.sql', N'2021-04-14 16:40:42.213')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'14', N'Sorteio.Migration.Scripts.202104201200_Alteracao_Tabela_Pedido.sql', N'2021-04-20 12:45:12.723')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'15', N'Sorteio.Migration.Scripts.202104221126_Alteracao_Tabela_Pedido.sql', N'2021-04-22 11:37:54.807')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'16', N'Sorteio.Migration.Scripts.202104221227_Alteracao_Tabela_Pedido.sql', N'2021-04-22 12:33:56.753')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'17', N'Sorteio.Migration.Scripts.202104221353_Alteracao_Tabela_Usuario.sql', N'2021-04-22 13:59:35.610')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'18', N'Sorteio.Migration.Scripts.202104261436_Alteracao_Tabela_Sorteio.sql', N'2021-04-26 14:37:05.927')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'19', N'Sorteio.Migration.Scripts.202104261440_Alteracao_Tabela_Sorteio.sql', N'2021-04-26 14:44:54.950')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'20', N'Sorteio.Migration.Scripts.202104270917_Alteracao_Tabela_FormasDePagamento.sql', N'2021-04-27 09:19:22.633')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'21', N'Sorteio.Migration.Scripts.202104300839_Alteracao_Tabela_Sorteio.sql', N'2021-04-30 08:40:31.537')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'22', N'Sorteio.Migration.Scripts.202104300843_Alteracao_Tabela_Sorteio.sql', N'2021-04-30 08:43:46.907')
GO

INSERT INTO [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (N'23', N'Sorteio.Migration.Scripts.202104301102_Alteracao_Tabela_Pedido.sql', N'2021-04-30 11:05:01.517')
GO

SET IDENTITY_INSERT [dbo].[SchemaVersions] OFF
GO


-- ----------------------------
-- Table structure for Sorteio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sorteio]') AND type IN ('U'))
	DROP TABLE [dbo].[Sorteio]
GO

CREATE TABLE [dbo].[Sorteio] (
  [id_sorteio] int  IDENTITY(1,1) NOT NULL,
  [id_categoria_sorteio] int  NOT NULL,
  [nome] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [edicao] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [valor] decimal(7,2)  NOT NULL,
  [quantidade_numeros] int  NOT NULL,
  [descricao_curta] varchar(8000) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [descricao_longa] varchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [status] bit DEFAULT 0 NOT NULL,
  [excluido] bit DEFAULT 0 NOT NULL
)
GO


-- ----------------------------
-- Records of Sorteio
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Sorteio] ON
GO

INSERT INTO [dbo].[Sorteio] ([id_sorteio], [id_categoria_sorteio], [nome], [edicao], [valor], [quantidade_numeros], [descricao_curta], [descricao_longa], [status], [excluido]) VALUES (N'1', N'1', N'Moto Kawasaki Z400 2020', N'001', N'35.00', N'1000', N'Z400 ABS', N'<p>MOTO KAWASAKI 2020</p><p>MOTO Z400</p><p>ANO: 2020</p><p>KM: 10.200</p><p>ADICIONAL ESCAPAMENTO ESPORTIVO</p><p>IPVA PAGO</p><div>SORTEIO VALIDO PARA TODO BRASIL E FRETE POR NOSSA CONTA ATE 400KM!</div><div><br></div><div>Valor da centena: R$ 35,00</div><div><br></div><div>SORTEIO PELA LOTERIA FEDERAL, ASSIM QUE CONCLUIDO TODOS OS NUMEROS!</div><div><br></div><div>SE ATENTE AO PRAZO LIMITE DE PAGAMENTO DE 2 DIAS PARA VALIDAÇAO DE SEU NUMERO!</div><div><br></div><div>Boa sorte!</div><div><br style="color: rgb(33, 37, 41); font-family: &quot;Open Sans&quot;, sans-serif;"></div>', N'1', N'1')
GO

INSERT INTO [dbo].[Sorteio] ([id_sorteio], [id_categoria_sorteio], [nome], [edicao], [valor], [quantidade_numeros], [descricao_curta], [descricao_longa], [status], [excluido]) VALUES (N'2', N'1', N'Moto Kawasaki Ninja 2020', N'002', N'35.00', N'1000', N'Teste', N'<p>MOTO KAWASAKI 2020</p><p>MOTO Z400</p><p>ANO: 2020</p><p>KM: 10.200</p><p>ADICIONAL ESCAPAMENTO ESPORTIVO</p><p>IPVA PAGO</p><div>SORTEIO VALIDO PARA TODO BRASIL E FRETE POR NOSSA CONTA ATE 400KM!</div><div><br></div><div>Valor da centena: R$ 35,00</div><div><br></div><div>SORTEIO PELA LOTERIA FEDERAL, ASSIM QUE CONCLUIDO TODOS OS NUMEROS!</div><div><br></div><div>SE ATENTE AO PRAZO LIMITE DE PAGAMENTO DE 2 DIAS PARA VALIDAÇAO DE SEU NUMERO!</div><div><br></div><div>Boa sorte!</div><div><br style="color: rgb(33, 37, 41); font-family: &quot;Open Sans&quot;, sans-serif;"></div>', N'1', N'1')
GO

INSERT INTO [dbo].[Sorteio] ([id_sorteio], [id_categoria_sorteio], [nome], [edicao], [valor], [quantidade_numeros], [descricao_curta], [descricao_longa], [status], [excluido]) VALUES (N'5', N'1', N'Moto Honda CB 600F', N'002', N'35.00', N'1000', N'Hornet', N'<p><span style="color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;">A&nbsp;</span><span style="font-weight: 700; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;">Hornet</span><span style="color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;">&nbsp;traz um&nbsp;</span><span style="font-weight: 700; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;">motor</span><span style="color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;">&nbsp;de quatro cilindros em linha com 599 cm³ de capacidade. Tem linhas discretas e boa maneabilidade, além de ser fácil de conduzir. O propulsor possui duplo comando no cabeçote (DOHC) e refrigeração líquida. Produz 96,5 cv de potência máxima a 12.000 rpm e torque de 6,43 kgf.m a 9.500 rpm</span><br></p>', N'1', N'1')
GO

INSERT INTO [dbo].[Sorteio] ([id_sorteio], [id_categoria_sorteio], [nome], [edicao], [valor], [quantidade_numeros], [descricao_curta], [descricao_longa], [status], [excluido]) VALUES (N'6', N'3', N'VOLVO C30 T5 R-DESIGN', N'001', N'79.00', N'999', N'Valor de R$ 79,00 para os 10 primeiros adquirentes da rifa. A partir do décimo primeiro número será o valor de R$ 89,00', N'<ul><li><span style="font-size: 18px;">2.5 5 Cilindros Turbo</span></li></ul><ul><li><p><span style="font-size: 18px;">Versão Exclusiva R-Design</span></p></li><li><div><p><span style="font-size: 18px;">Motor 2.5 5 Cilindros Turbo (Focus Rs)</span><br></p></div></li><li><div><p><span style="font-size: 18px;">Teto Solar</span><br></p></div></li><li><div><p><span style="font-size: 18px;">Farol de xênon</span><br></p></div></li><li><div><p><span style="font-size: 18px;">Pneus Michelin PS4</span><br></p></div></li></ul><ul><li><span style="font-size: 18px;">Rodas aro 18 MIDIR</span></li></ul>', N'0', N'0')
GO

SET IDENTITY_INSERT [dbo].[Sorteio] OFF
GO


-- ----------------------------
-- Table structure for StatusPedido
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusPedido]') AND type IN ('U'))
	DROP TABLE [dbo].[StatusPedido]
GO

CREATE TABLE [dbo].[StatusPedido] (
  [id_status_pedido] int  IDENTITY(1,1) NOT NULL,
  [nome] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO


-- ----------------------------
-- Records of StatusPedido
-- ----------------------------
SET IDENTITY_INSERT [dbo].[StatusPedido] ON
GO

INSERT INTO [dbo].[StatusPedido] ([id_status_pedido], [nome]) VALUES (N'1', N'Pendente')
GO

INSERT INTO [dbo].[StatusPedido] ([id_status_pedido], [nome]) VALUES (N'2', N'Pago')
GO

INSERT INTO [dbo].[StatusPedido] ([id_status_pedido], [nome]) VALUES (N'4', N'Cancelado')
GO

SET IDENTITY_INSERT [dbo].[StatusPedido] OFF
GO


-- ----------------------------
-- Table structure for TipoFormaDePagamento
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoFormaDePagamento]') AND type IN ('U'))
	DROP TABLE [dbo].[TipoFormaDePagamento]
GO

CREATE TABLE [dbo].[TipoFormaDePagamento] (
  [id_tipo_forma_de_pagamento] int  IDENTITY(1,1) NOT NULL,
  [nome] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [status] bit DEFAULT 0 NOT NULL
)
GO


-- ----------------------------
-- Records of TipoFormaDePagamento
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TipoFormaDePagamento] ON
GO

INSERT INTO [dbo].[TipoFormaDePagamento] ([id_tipo_forma_de_pagamento], [nome], [status]) VALUES (N'1', N'Conta Corrente', N'0')
GO

INSERT INTO [dbo].[TipoFormaDePagamento] ([id_tipo_forma_de_pagamento], [nome], [status]) VALUES (N'2', N'Pix', N'0')
GO

SET IDENTITY_INSERT [dbo].[TipoFormaDePagamento] OFF
GO


-- ----------------------------
-- Table structure for TipoUsuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoUsuario]') AND type IN ('U'))
	DROP TABLE [dbo].[TipoUsuario]
GO

CREATE TABLE [dbo].[TipoUsuario] (
  [id_tipo_usuario] int  IDENTITY(1,1) NOT NULL,
  [nome] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO


-- ----------------------------
-- Records of TipoUsuario
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON
GO

INSERT INTO [dbo].[TipoUsuario] ([id_tipo_usuario], [nome]) VALUES (N'1', N'Administrador')
GO

INSERT INTO [dbo].[TipoUsuario] ([id_tipo_usuario], [nome]) VALUES (N'2', N'Cliente')
GO

SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
GO


-- ----------------------------
-- Table structure for Usuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type IN ('U'))
	DROP TABLE [dbo].[Usuario]
GO

CREATE TABLE [dbo].[Usuario] (
  [id_usuario] int  IDENTITY(1,1) NOT NULL,
  [nome] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [email] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [senha] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [celular] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [cpf] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [url_imagem] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [id_tipo_usuario] int  NOT NULL,
  [status] bit DEFAULT 0 NOT NULL,
  [data_de_nascimento] date  NULL,
  [cep] varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [logadouro] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [numero] int  NULL,
  [bairro] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [complemento] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [estado] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [cidade] varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [referencia] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO


-- ----------------------------
-- Records of Usuario
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Usuario] ON
GO

INSERT INTO [dbo].[Usuario] ([id_usuario], [nome], [email], [senha], [celular], [cpf], [url_imagem], [id_tipo_usuario], [status], [data_de_nascimento], [cep], [logadouro], [numero], [bairro], [complemento], [estado], [cidade], [referencia]) VALUES (N'1', N'Administrador Widup', N'admin@widup.com.br', N'st4yrDNVlA+Lcll/moe/2tpiaVbd6Y764pN3Suw1AAc=', N'(11) 11111-1111', N'249.325.084-25', NULL, N'1', N'0', N'1760-01-01', N'', N'', N'0', N'', N'', N'', N'', N'')
GO

INSERT INTO [dbo].[Usuario] ([id_usuario], [nome], [email], [senha], [celular], [cpf], [url_imagem], [id_tipo_usuario], [status], [data_de_nascimento], [cep], [logadouro], [numero], [bairro], [complemento], [estado], [cidade], [referencia]) VALUES (N'35', N'Administrador VIP Prêmios RN', N'admin@vippremiosrn.com', N'st4yrDNVlA+Lcll/moe/2tpiaVbd6Y764pN3Suw1AAc=', N'(11) 11111-1111', N'249.325.084-23', NULL, N'1', N'0', N'1760-01-01', NULL, NULL, N'0', NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Usuario] ([id_usuario], [nome], [email], [senha], [celular], [cpf], [url_imagem], [id_tipo_usuario], [status], [data_de_nascimento], [cep], [logadouro], [numero], [bairro], [complemento], [estado], [cidade], [referencia]) VALUES (N'36', N'Renisson Batista', N'renissonbatista62@gmail.com', N'RiKyss2qxDTeHwp+rnD7i9GB7FqN9MMUwQ+icBHWBck=', N'(84) 99117-3575', N'067.410.064-60', NULL, N'2', N'0', N'1760-01-01', NULL, NULL, N'0', NULL, NULL, NULL, NULL, NULL)
GO

SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO


-- ----------------------------
-- Table structure for VencedorSorteio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[VencedorSorteio]') AND type IN ('U'))
	DROP TABLE [dbo].[VencedorSorteio]
GO

CREATE TABLE [dbo].[VencedorSorteio] (
  [id_vencedor_sorteio] int  IDENTITY(1,1) NOT NULL,
  [id_sorteio] int  NOT NULL,
  [id_usuario] int  NOT NULL,
  [numero_sorteado] int  NOT NULL,
  [data_sorteio] date  NOT NULL
)
GO


-- ----------------------------
-- Records of VencedorSorteio
-- ----------------------------
SET IDENTITY_INSERT [dbo].[VencedorSorteio] ON
GO

INSERT INTO [dbo].[VencedorSorteio] ([id_vencedor_sorteio], [id_sorteio], [id_usuario], [numero_sorteado], [data_sorteio]) VALUES (N'1', N'1', N'36', N'6', N'2021-05-09')
GO

SET IDENTITY_INSERT [dbo].[VencedorSorteio] OFF
GO


-- ----------------------------
-- Auto increment value for CategoriaSorteio
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[CategoriaSorteio]', RESEED, 6)
GO


-- ----------------------------
-- Primary Key structure for table CategoriaSorteio
-- ----------------------------
ALTER TABLE [dbo].[CategoriaSorteio] ADD CONSTRAINT [pk_CategoriaSorteio] PRIMARY KEY CLUSTERED ([id_categoria_sorteio])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for FormasDePagamento
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[FormasDePagamento]', RESEED, 6)
GO


-- ----------------------------
-- Primary Key structure for table FormasDePagamento
-- ----------------------------
ALTER TABLE [dbo].[FormasDePagamento] ADD CONSTRAINT [pk_FormasDePagamento] PRIMARY KEY CLUSTERED ([id_forma_de_pagamento])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for GaleriaFotos
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[GaleriaFotos]', RESEED, 77)
GO


-- ----------------------------
-- Primary Key structure for table GaleriaFotos
-- ----------------------------
ALTER TABLE [dbo].[GaleriaFotos] ADD CONSTRAINT [pk_GaleriaFotos] PRIMARY KEY CLUSTERED ([id_galeria_fotos])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for NumeroEscolhido
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[NumeroEscolhido]', RESEED, 36)
GO


-- ----------------------------
-- Primary Key structure for table NumeroEscolhido
-- ----------------------------
ALTER TABLE [dbo].[NumeroEscolhido] ADD CONSTRAINT [pk_NumeroEscolhido] PRIMARY KEY CLUSTERED ([id_numero_escolhido])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for Pedido
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Pedido]', RESEED, 24)
GO


-- ----------------------------
-- Primary Key structure for table Pedido
-- ----------------------------
ALTER TABLE [dbo].[Pedido] ADD CONSTRAINT [pf_Pedido] PRIMARY KEY CLUSTERED ([id_pedido])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for SchemaVersions
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[SchemaVersions]', RESEED, 23)
GO


-- ----------------------------
-- Primary Key structure for table SchemaVersions
-- ----------------------------
ALTER TABLE [dbo].[SchemaVersions] ADD CONSTRAINT [PK_SchemaVersions_Id] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for Sorteio
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Sorteio]', RESEED, 6)
GO


-- ----------------------------
-- Primary Key structure for table Sorteio
-- ----------------------------
ALTER TABLE [dbo].[Sorteio] ADD CONSTRAINT [pk_Soteio] PRIMARY KEY CLUSTERED ([id_sorteio])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for StatusPedido
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[StatusPedido]', RESEED, 4)
GO


-- ----------------------------
-- Primary Key structure for table StatusPedido
-- ----------------------------
ALTER TABLE [dbo].[StatusPedido] ADD CONSTRAINT [pk_StatusPedido] PRIMARY KEY CLUSTERED ([id_status_pedido])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for TipoFormaDePagamento
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[TipoFormaDePagamento]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table TipoFormaDePagamento
-- ----------------------------
ALTER TABLE [dbo].[TipoFormaDePagamento] ADD CONSTRAINT [pk_TipoFormaDePagamento] PRIMARY KEY CLUSTERED ([id_tipo_forma_de_pagamento])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for TipoUsuario
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[TipoUsuario]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table TipoUsuario
-- ----------------------------
ALTER TABLE [dbo].[TipoUsuario] ADD CONSTRAINT [pk_TipoUsuario] PRIMARY KEY CLUSTERED ([id_tipo_usuario])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for Usuario
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Usuario]', RESEED, 36)
GO


-- ----------------------------
-- Primary Key structure for table Usuario
-- ----------------------------
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [pk_Usuario] PRIMARY KEY CLUSTERED ([id_usuario])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Auto increment value for VencedorSorteio
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[VencedorSorteio]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table VencedorSorteio
-- ----------------------------
ALTER TABLE [dbo].[VencedorSorteio] ADD CONSTRAINT [pk_VencedorSorteio] PRIMARY KEY CLUSTERED ([id_vencedor_sorteio])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


-- ----------------------------
-- Foreign Keys structure for table FormasDePagamento
-- ----------------------------
ALTER TABLE [dbo].[FormasDePagamento] ADD CONSTRAINT [FormasDePagamentoTipoFormaDePagamento] FOREIGN KEY ([id_tipo_forma_de_pagamento]) REFERENCES [dbo].[TipoFormaDePagamento] ([id_tipo_forma_de_pagamento]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table GaleriaFotos
-- ----------------------------
ALTER TABLE [dbo].[GaleriaFotos] ADD CONSTRAINT [fk_GaleriaFotosSorteio] FOREIGN KEY ([id_sorteio]) REFERENCES [dbo].[Sorteio] ([id_sorteio]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table NumeroEscolhido
-- ----------------------------
ALTER TABLE [dbo].[NumeroEscolhido] ADD CONSTRAINT [fk_NumeroEscolhidoPedido] FOREIGN KEY ([id_pedido]) REFERENCES [dbo].[Pedido] ([id_pedido]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Pedido
-- ----------------------------
ALTER TABLE [dbo].[Pedido] ADD CONSTRAINT [fk_PedidoStatusPedidoo] FOREIGN KEY ([id_status_pedido]) REFERENCES [dbo].[StatusPedido] ([id_status_pedido]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Pedido] ADD CONSTRAINT [fk_PedidoSorteio] FOREIGN KEY ([id_sorteio]) REFERENCES [dbo].[Sorteio] ([id_sorteio]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Pedido] ADD CONSTRAINT [fk_PedidoUsuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([id_usuario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Sorteio
-- ----------------------------
ALTER TABLE [dbo].[Sorteio] ADD CONSTRAINT [fk_SorteioCategoriaSorteio] FOREIGN KEY ([id_categoria_sorteio]) REFERENCES [dbo].[CategoriaSorteio] ([id_categoria_sorteio]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Usuario
-- ----------------------------
ALTER TABLE [dbo].[Usuario] ADD CONSTRAINT [fk_UsuarioTipoUsuario] FOREIGN KEY ([id_tipo_usuario]) REFERENCES [dbo].[TipoUsuario] ([id_tipo_usuario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table VencedorSorteio
-- ----------------------------
ALTER TABLE [dbo].[VencedorSorteio] ADD CONSTRAINT [fk_VencedorSorteioSorteio] FOREIGN KEY ([id_sorteio]) REFERENCES [dbo].[Sorteio] ([id_sorteio]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[VencedorSorteio] ADD CONSTRAINT [fk_VencedorSorteioUsuario] FOREIGN KEY ([id_usuario]) REFERENCES [dbo].[Usuario] ([id_usuario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

