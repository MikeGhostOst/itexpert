# Тестовое задание

Веб-приложение на Asp.Net Core.

Реализовано два RestAPI метода: GET и POST, также добавлен фронтенд, взаимодействующий с этими методами.

Используемая БД: SQL Server Express LocalDB.

В папке Database находится скрипт для создания БД.

Структура таблицы:

```SQL
CREATE TABLE [dbo].[CodeValuePairs](
	[Code] [int] NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
	[Order] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
```
