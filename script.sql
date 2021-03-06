create database [college2]
USE [college2]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 14/07/2022 03:57:48 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[cls_id] [int] IDENTITY(1,1) NOT NULL,
	[id_pro] [int] NULL,
	[room_id] [int] NULL,
	[course_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cls_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 14/07/2022 03:57:48 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[crs_id] [int] IDENTITY(1,1) NOT NULL,
	[descrp] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[crs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profossor]    Script Date: 14/07/2022 03:57:48 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profossor](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](50) NULL,
	[title_degree] [varchar](20) NULL,
	[phone] [varchar](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 14/07/2022 03:57:48 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[num_room] [int] NULL,
	[building_name] [varchar](20) NULL,
	[floor_num] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_desc_prof_room]    Script Date: 14/07/2022 03:57:48 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_desc_prof_room]
AS
SELECT        dbo.Class.cls_id, dbo.Profossor.fullname, dbo.Room.num_room, dbo.Course.descrp
FROM            dbo.Class INNER JOIN
                         dbo.Course ON dbo.Class.course_id = dbo.Course.crs_id INNER JOIN
                         dbo.Profossor ON dbo.Class.id_pro = dbo.Profossor.pro_id INNER JOIN
                         dbo.Room ON dbo.Class.room_id = dbo.Room.room_id
GO
/****** Object:  Table [dbo].[stu_cls]    Script Date: 14/07/2022 03:57:48 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stu_cls](
	[id_cls] [int] NULL,
	[id_stu] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 14/07/2022 03:57:48 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stu_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](50) NULL,
	[phone] [varchar](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[stu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Course]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Profossor] FOREIGN KEY([id_pro])
REFERENCES [dbo].[Profossor] ([pro_id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Profossor]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Room] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Room]
GO
ALTER TABLE [dbo].[stu_cls]  WITH CHECK ADD  CONSTRAINT [FK_stu_cls_Class] FOREIGN KEY([id_cls])
REFERENCES [dbo].[Class] ([cls_id])
GO
ALTER TABLE [dbo].[stu_cls] CHECK CONSTRAINT [FK_stu_cls_Class]
GO
ALTER TABLE [dbo].[stu_cls]  WITH CHECK ADD  CONSTRAINT [FK_stu_cls_Student] FOREIGN KEY([id_stu])
REFERENCES [dbo].[Student] ([stu_id])
GO
ALTER TABLE [dbo].[stu_cls] CHECK CONSTRAINT [FK_stu_cls_Student]
GO
