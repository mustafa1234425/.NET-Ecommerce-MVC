
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/22/2025 04:24:02
-- Generated from EDMX file: E:\private\Web Test\.NET-Ecommerce-Project-master\ClickNBuy\Models\Model.edmx
-- --------------------------------------------------
create database [ClickNBuy];
SET QUOTED_IDENTIFIER OFF;
GO
USE [ClickNBuy];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__tbl_categ__ad_id__04E4BC85]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_category] DROP CONSTRAINT [FK__tbl_categ__ad_id__04E4BC85];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_categ__ad_id__4CA06362]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_category] DROP CONSTRAINT [FK__tbl_categ__ad_id__4CA06362];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_categ__ad_id__71D1E811]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_category] DROP CONSTRAINT [FK__tbl_categ__ad_id__71D1E811];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_invoi__in_fk__160F4887]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_invoice] DROP CONSTRAINT [FK__tbl_invoi__in_fk__160F4887];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_order__o_fk___18EBB532]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_order] DROP CONSTRAINT [FK__tbl_order__o_fk___18EBB532];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_order__o_fk___2739D489]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_order] DROP CONSTRAINT [FK__tbl_order__o_fk___2739D489];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_produ__cat_i__05D8E0BE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_product] DROP CONSTRAINT [FK__tbl_produ__cat_i__05D8E0BE];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_produ__cat_i__534D60F1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_product] DROP CONSTRAINT [FK__tbl_produ__cat_i__534D60F1];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_produ__cat_i__72C60C4A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_product] DROP CONSTRAINT [FK__tbl_produ__cat_i__72C60C4A];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_produ__us_id__06CD04F7]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_product] DROP CONSTRAINT [FK__tbl_produ__us_id__06CD04F7];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_produ__us_id__52593CB8]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_product] DROP CONSTRAINT [FK__tbl_produ__us_id__52593CB8];
GO
IF OBJECT_ID(N'[dbo].[FK__tbl_produ__us_id__73BA3083]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tbl_product] DROP CONSTRAINT [FK__tbl_produ__us_id__73BA3083];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[tbl_admin]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tbl_admin];
GO
IF OBJECT_ID(N'[dbo].[tbl_category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tbl_category];
GO
IF OBJECT_ID(N'[dbo].[tbl_invoice]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tbl_invoice];
GO
IF OBJECT_ID(N'[dbo].[tbl_order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tbl_order];
GO
IF OBJECT_ID(N'[dbo].[tbl_product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tbl_product];
GO
IF OBJECT_ID(N'[dbo].[tbl_user]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tbl_user];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'tbl_admin'
CREATE TABLE [dbo].[tbl_admin] (
    [ad_id] int IDENTITY(1,1) NOT NULL,
    [ad_name] varchar(50)  NOT NULL,
    [ad_email] varchar(50)  NOT NULL,
    [ad_password] varchar(50)  NOT NULL
);
GO

-- Creating table 'tbl_category'
CREATE TABLE [dbo].[tbl_category] (
    [cat_id] int IDENTITY(1,1) NOT NULL,
    [cat_name] varchar(50)  NOT NULL,
    [ad_id_fk] int  NULL,
    [cat_image] varchar(max)  NULL,
    [cat_status] int  NULL
);
GO

-- Creating table 'tbl_product'
CREATE TABLE [dbo].[tbl_product] (
    [pro_id] int IDENTITY(1,1) NOT NULL,
    [pro_name] varchar(50)  NOT NULL,
    [pro_price] int  NULL,
    [pro_image] varchar(max)  NOT NULL,
    [pro_desc] varchar(max)  NULL,
    [u_contact] varchar(max)  NOT NULL,
    [us_id_fk] int  NULL,
    [cat_id_fk] int  NULL
);
GO

-- Creating table 'tbl_user'
CREATE TABLE [dbo].[tbl_user] (
    [u_id] int IDENTITY(1,1) NOT NULL,
    [u_name] varchar(50)  NOT NULL,
    [u_email] varchar(50)  NOT NULL,
    [u_password] varchar(50)  NOT NULL,
    [u_image] varchar(max)  NOT NULL,
    [u_contact] varchar(max)  NOT NULL
);
GO

-- Creating table 'tbl_invoice'
CREATE TABLE [dbo].[tbl_invoice] (
    [in_id] int IDENTITY(1,1) NOT NULL,
    [in_fk_user] int  NULL,
    [in_date] datetime  NULL,
    [in_totalbill] int  NULL
);
GO

-- Creating table 'tbl_order'
CREATE TABLE [dbo].[tbl_order] (
    [o_id] int IDENTITY(1,1) NOT NULL,
    [o_fk_pro] int  NULL,
    [o_date] datetime  NULL,
    [o_totalbill] int  NULL,
    [o_fk_invoice] int  NULL,
    [o_qty] int  NULL,
    [o_unitprice] int  NULL,
    [o_bill] int  NULL,
    [u_credit_card_number] varchar(50)  NULL,
    [u_ccv] varchar(50)  NULL,
    [u_pin] varchar(10)  NULL,
    [u_expiry_date] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ad_id] in table 'tbl_admin'
ALTER TABLE [dbo].[tbl_admin]
ADD CONSTRAINT [PK_tbl_admin]
    PRIMARY KEY CLUSTERED ([ad_id] ASC);
GO

-- Creating primary key on [cat_id] in table 'tbl_category'
ALTER TABLE [dbo].[tbl_category]
ADD CONSTRAINT [PK_tbl_category]
    PRIMARY KEY CLUSTERED ([cat_id] ASC);
GO

-- Creating primary key on [pro_id] in table 'tbl_product'
ALTER TABLE [dbo].[tbl_product]
ADD CONSTRAINT [PK_tbl_product]
    PRIMARY KEY CLUSTERED ([pro_id] ASC);
GO

-- Creating primary key on [u_id] in table 'tbl_user'
ALTER TABLE [dbo].[tbl_user]
ADD CONSTRAINT [PK_tbl_user]
    PRIMARY KEY CLUSTERED ([u_id] ASC);
GO

-- Creating primary key on [in_id] in table 'tbl_invoice'
ALTER TABLE [dbo].[tbl_invoice]
ADD CONSTRAINT [PK_tbl_invoice]
    PRIMARY KEY CLUSTERED ([in_id] ASC);
GO

-- Creating primary key on [o_id] in table 'tbl_order'
ALTER TABLE [dbo].[tbl_order]
ADD CONSTRAINT [PK_tbl_order]
    PRIMARY KEY CLUSTERED ([o_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ad_id_fk] in table 'tbl_category'
ALTER TABLE [dbo].[tbl_category]
ADD CONSTRAINT [FK__tbl_categ__ad_id__04E4BC85]
    FOREIGN KEY ([ad_id_fk])
    REFERENCES [dbo].[tbl_admin]
        ([ad_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_categ__ad_id__04E4BC85'
CREATE INDEX [IX_FK__tbl_categ__ad_id__04E4BC85]
ON [dbo].[tbl_category]
    ([ad_id_fk]);
GO

-- Creating foreign key on [ad_id_fk] in table 'tbl_category'
ALTER TABLE [dbo].[tbl_category]
ADD CONSTRAINT [FK__tbl_categ__ad_id__4CA06362]
    FOREIGN KEY ([ad_id_fk])
    REFERENCES [dbo].[tbl_admin]
        ([ad_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_categ__ad_id__4CA06362'
CREATE INDEX [IX_FK__tbl_categ__ad_id__4CA06362]
ON [dbo].[tbl_category]
    ([ad_id_fk]);
GO

-- Creating foreign key on [ad_id_fk] in table 'tbl_category'
ALTER TABLE [dbo].[tbl_category]
ADD CONSTRAINT [FK__tbl_categ__ad_id__71D1E811]
    FOREIGN KEY ([ad_id_fk])
    REFERENCES [dbo].[tbl_admin]
        ([ad_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_categ__ad_id__71D1E811'
CREATE INDEX [IX_FK__tbl_categ__ad_id__71D1E811]
ON [dbo].[tbl_category]
    ([ad_id_fk]);
GO

-- Creating foreign key on [cat_id_fk] in table 'tbl_product'
ALTER TABLE [dbo].[tbl_product]
ADD CONSTRAINT [FK__tbl_produ__cat_i__05D8E0BE]
    FOREIGN KEY ([cat_id_fk])
    REFERENCES [dbo].[tbl_category]
        ([cat_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_produ__cat_i__05D8E0BE'
CREATE INDEX [IX_FK__tbl_produ__cat_i__05D8E0BE]
ON [dbo].[tbl_product]
    ([cat_id_fk]);
GO

-- Creating foreign key on [cat_id_fk] in table 'tbl_product'
ALTER TABLE [dbo].[tbl_product]
ADD CONSTRAINT [FK__tbl_produ__cat_i__534D60F1]
    FOREIGN KEY ([cat_id_fk])
    REFERENCES [dbo].[tbl_category]
        ([cat_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_produ__cat_i__534D60F1'
CREATE INDEX [IX_FK__tbl_produ__cat_i__534D60F1]
ON [dbo].[tbl_product]
    ([cat_id_fk]);
GO

-- Creating foreign key on [cat_id_fk] in table 'tbl_product'
ALTER TABLE [dbo].[tbl_product]
ADD CONSTRAINT [FK__tbl_produ__cat_i__72C60C4A]
    FOREIGN KEY ([cat_id_fk])
    REFERENCES [dbo].[tbl_category]
        ([cat_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_produ__cat_i__72C60C4A'
CREATE INDEX [IX_FK__tbl_produ__cat_i__72C60C4A]
ON [dbo].[tbl_product]
    ([cat_id_fk]);
GO

-- Creating foreign key on [us_id_fk] in table 'tbl_product'
ALTER TABLE [dbo].[tbl_product]
ADD CONSTRAINT [FK__tbl_produ__us_id__06CD04F7]
    FOREIGN KEY ([us_id_fk])
    REFERENCES [dbo].[tbl_user]
        ([u_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_produ__us_id__06CD04F7'
CREATE INDEX [IX_FK__tbl_produ__us_id__06CD04F7]
ON [dbo].[tbl_product]
    ([us_id_fk]);
GO

-- Creating foreign key on [us_id_fk] in table 'tbl_product'
ALTER TABLE [dbo].[tbl_product]
ADD CONSTRAINT [FK__tbl_produ__us_id__52593CB8]
    FOREIGN KEY ([us_id_fk])
    REFERENCES [dbo].[tbl_user]
        ([u_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_produ__us_id__52593CB8'
CREATE INDEX [IX_FK__tbl_produ__us_id__52593CB8]
ON [dbo].[tbl_product]
    ([us_id_fk]);
GO

-- Creating foreign key on [us_id_fk] in table 'tbl_product'
ALTER TABLE [dbo].[tbl_product]
ADD CONSTRAINT [FK__tbl_produ__us_id__73BA3083]
    FOREIGN KEY ([us_id_fk])
    REFERENCES [dbo].[tbl_user]
        ([u_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_produ__us_id__73BA3083'
CREATE INDEX [IX_FK__tbl_produ__us_id__73BA3083]
ON [dbo].[tbl_product]
    ([us_id_fk]);
GO

-- Creating foreign key on [in_fk_user] in table 'tbl_invoice'
ALTER TABLE [dbo].[tbl_invoice]
ADD CONSTRAINT [FK__tbl_invoi__in_fk__160F4887]
    FOREIGN KEY ([in_fk_user])
    REFERENCES [dbo].[tbl_user]
        ([u_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_invoi__in_fk__160F4887'
CREATE INDEX [IX_FK__tbl_invoi__in_fk__160F4887]
ON [dbo].[tbl_invoice]
    ([in_fk_user]);
GO

-- Creating foreign key on [o_fk_pro] in table 'tbl_order'
ALTER TABLE [dbo].[tbl_order]
ADD CONSTRAINT [FK__tbl_order__o_fk___18EBB532]
    FOREIGN KEY ([o_fk_pro])
    REFERENCES [dbo].[tbl_product]
        ([pro_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_order__o_fk___18EBB532'
CREATE INDEX [IX_FK__tbl_order__o_fk___18EBB532]
ON [dbo].[tbl_order]
    ([o_fk_pro]);
GO

-- Creating foreign key on [o_fk_invoice] in table 'tbl_order'
ALTER TABLE [dbo].[tbl_order]
ADD CONSTRAINT [FK__tbl_order__o_fk___2739D489]
    FOREIGN KEY ([o_fk_invoice])
    REFERENCES [dbo].[tbl_invoice]
        ([in_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tbl_order__o_fk___2739D489'
CREATE INDEX [IX_FK__tbl_order__o_fk___2739D489]
ON [dbo].[tbl_order]
    ([o_fk_invoice]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------