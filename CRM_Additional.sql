USE [CRM_DB]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 11/27/2017 10:03:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menus](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [int] NOT NULL,
	[ControllerName] [varchar](20) NOT NULL,
	[ActionName] [varchar](100) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[V_TransactionInfo]    Script Date: 11/27/2017 10:03:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[V_TransactionInfo] 
AS
	SELECT  
		ti.Id, ti.TransactionId, 
		CASE
			WHEN ti.TransactionType=1 THEN 'TRANSFER'
			WHEN ti.TransactionType=2 THEN 'DEPOSIT'
			WHEN ti.TransactionType=3 THEN 'EXPENSE'
		END TransactionType,
		ISNULL((SELECT AccountName FROM BankAccounts WHERE Id=ti.AccountFrom),'') AccountFrom,
		ISNULL((SELECT AccountName FROM BankAccounts WHERE Id=ti.AccountTo),'') AccountTo,
		ISNULL(ti.Date, '') Date,
		CASE
			WHEN ti.PayerType=1 THEN (SELECT AgentName FROM AgentInfoes WHERE Id=ti.PayerId)
			WHEN ti.PayerType=2 THEN (SELECT FirstName FROM ClientInfoes WHERE Id=ti.PayerId)
			WHEN ti.PayerType=3 THEN 'Officer'
			WHEN ti.PayerType=4 THEN 'Other'
			ELSE ''
		END Payer,
		(SELECT MethodName FROM PaymentMethods WHERE Id=ti.MethodId) Method,
		CASE WHEN ti.TransactionType=1 THEN ti.Amount ELSE 0.00 END TransferAmount,
		CASE WHEN ti.TransactionType=2 THEN ti.Amount ELSE 0.00 END DepositAmount,
		CASE WHEN ti.TransactionType=3 THEN ti.Amount ELSE 0.00 END ExpenseAmount,
		ti.Description
	FROM TransactionsInfoes ti


GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (1, 1, N'clients', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (2, 1, N'clients', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (3, 1, N'clients', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (4, 1, N'clients', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (5, 1, N'clients', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (6, 1, N'clients', N'getadditionalreferralfields', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (7, 1, N'clients', N'getadditionalsupplierfields', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (8, 1, N'clients', N'getadditionalservicefields', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (9, 1, N'agents', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (10, 1, N'agents', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (11, 1, N'agents', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (12, 1, N'agents', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (13, 1, N'agents', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (14, 1, N'agents', N'isemailavailable', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (15, 2, N'billing', N'clientpayment', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (16, 2, N'billing', N'agentpayment', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (17, 2, N'billing', N'supplierpayment', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (18, 2, N'billing', N'getclientsbranchwise', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (19, 2, N'billing', N'getservicechargeinfo', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (20, 2, N'billing', N'getservicechargeinfoforagent', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (21, 2, N'billing', N'getservicechargeinfoforsupplier', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (22, 2, N'billing', N'getpaymentfields', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (23, 3, N'deposits', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (24, 3, N'deposits', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (25, 3, N'deposits', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (26, 3, N'deposits', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (27, 3, N'deposits', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (28, 3, N'deposits', N'getadditionalpayertypefields', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (29, 3, N'expenses', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (30, 3, N'expenses', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (31, 3, N'expenses', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (32, 3, N'expenses', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (33, 3, N'expenses', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (34, 3, N'transactions', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (35, 3, N'transactions', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (36, 3, N'transactions', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (37, 3, N'transactions', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (38, 3, N'accounts', N'agentstatement', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (39, 3, N'accounts', N'balancesheet', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (40, 3, N'accounts', N'isexpensebalanceavailable', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (41, 3, N'accounts', N'istransferbalanceavailable', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (42, 4, N'reports', N'clientinforeport', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (43, 4, N'reports', N'clientpaymentreport', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (44, 4, N'reports', N'clientduereport', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (45, 4, N'reports', N'agentinforeport', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (46, 4, N'reports', N'agentpaymentreport', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (47, 4, N'reports', N'agentduereport', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (48, 4, N'reports', N'supplierinforeport', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (49, 4, N'reports', N'supplierpaymentreport', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (50, 4, N'reports', N'supplierduereport', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (51, 4, N'reports', N'dailypaymentreport', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (52, 4, N'reports', N'getclientsbybranchid', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (53, 5, N'users', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (54, 5, N'users', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (55, 5, N'users', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (56, 5, N'users', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (57, 5, N'users', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (58, 5, N'users', N'isadminuser', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (59, 5, N'users', N'isemailavailable', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (60, 5, N'users', N'isuseravailable', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (61, 5, N'users', N'updateuserstatus', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (62, 5, N'groups', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (63, 5, N'groups', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (64, 5, N'groups', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (65, 5, N'groups', N'isgroupavailable', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (66, 6, N'generalsettings', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (67, 6, N'generalsettings', N'islogohavetoadd', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (68, 6, N'generalsettings', N'createdbbackup', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (69, 6, N'accounts', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (70, 6, N'accounts', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (71, 6, N'accounts', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (72, 6, N'accounts', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (73, 6, N'accounts', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (74, 6, N'designations', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (75, 6, N'designations', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (76, 6, N'designations', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (77, 6, N'designations', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (78, 6, N'designations', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (79, 6, N'services', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (80, 6, N'services', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (81, 6, N'services', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (82, 6, N'services', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (83, 6, N'services', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (84, 6, N'services', N'isserviceavailable', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (85, 6, N'branch', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (86, 6, N'branch', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (87, 6, N'branch', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (88, 6, N'branch', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (89, 6, N'branch', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (90, 6, N'country', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (91, 6, N'country', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (92, 6, N'country', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (93, 6, N'country', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (94, 6, N'country', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (95, 6, N'sectors', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (96, 6, N'sectors', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (97, 6, N'sectors', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (98, 6, N'sectors', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (99, 6, N'sectors', N'delete', 1)
GO
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (100, 6, N'sectors', N'batchupload', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (101, 6, N'airlines', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (102, 6, N'airlines', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (103, 6, N'airlines', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (104, 6, N'airlines', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (105, 6, N'airlines', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (106, 6, N'suppliers', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (107, 6, N'suppliers', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (108, 6, N'suppliers', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (109, 6, N'suppliers', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (110, 6, N'suppliers', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (111, 6, N'paymentmethods', N'index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (112, 6, N'paymentmethods', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (113, 6, N'paymentmethods', N'create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (114, 6, N'paymentmethods', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (115, 6, N'paymentmethods', N'delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (117, 5, N'Employees', N'Index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (118, 5, N'Employees', N'Create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (119, 5, N'Employees', N'Edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (120, 5, N'Employees', N'Delete', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (121, 5, N'Employees', N'Details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (122, 3, N'Transfers', N'Index', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (123, 3, N'transfers', N'Create', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (124, 3, N'transfers', N'edit', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (125, 3, N'transfers', N'details', 1)
INSERT [dbo].[Menus] ([MenuId], [ModuleName], [ControllerName], [ActionName], [Status]) VALUES (126, 3, N'transfers', N'delete', 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
