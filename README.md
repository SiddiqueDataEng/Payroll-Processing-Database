# Payroll Processing Database

**OLTP System**

## 🎯 Overview

Automated payroll with deductions and allowances

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [Usage](#usage)
- [API Documentation](#api-documentation)
- [Database Schema](#database-schema)
- [Testing](#testing)
- [Monitoring](#monitoring)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

### Core Features
- ✅ Complete database schema with normalized tables
- ✅ Stored procedures for all business logic
- ✅ Triggers for automation and audit trails
- ✅ RESTful API backend
- ✅ Responsive web interface
- ✅ Role-based access control
- ✅ Comprehensive error handling
- ✅ Audit logging
- ✅ Data validation
- ✅ Transaction management

### Advanced Features
- ✅ Real-time notifications
- ✅ Export to Excel/PDF
- ✅ Advanced search and filtering
- ✅ Dashboard and analytics
- ✅ Batch operations
- ✅ Data import/export
- ✅ Email notifications
- ✅ Scheduled jobs

## 🛠️ Technology Stack (2011)

### Database
- **Database Server**: Microsoft SQL Server 2008 R2 / 2012
- **Database Name**: PayrollDB
- **ORM**: ADO.NET
- **Migration Tool**: SQL Scripts

### Backend
- **Framework**: MSSQL, SSIS
- **Language**: C# / VB.NET
- **API**: ASP.NET Web API / WebForms
- **Authentication**: Forms Authentication / Windows Auth

### Frontend
- **Framework**: ASP.NET WebForms 4.0
- **UI Library**: jQuery 1.x, Bootstrap 2.x
- **Charts**: Chart.js / Google Charts
- **Grid**: GridView / jqGrid

### DevOps & Infrastructure
- **Containerization**: Docker
- **IaC**: Azure Bicep, Terraform
- **CI/CD**: Azure DevOps, GitHub Actions
- **Monitoring**: Application Insights, SQL Server Profiler

## 🏗️ Architecture

### System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     Presentation Layer                       │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  Web UI      │  │  Reports     │  │  Dashboard   │      │
│  │  (ASP.NET)   │  │  (SSRS)      │  │  (Charts)    │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                     Business Logic Layer                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  Services    │  │  Validation  │  │  Business    │      │
│  │  (C#)        │  │  Rules       │  │  Rules       │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                     Data Access Layer                        │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  ADO.NET     │  │  Stored      │  │  Entity      │      │
│  │  Repository  │  │  Procedures  │  │  Models      │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                     Database Layer                           │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  Tables      │  │  Stored      │  │  Triggers    │      │
│  │  (SQL)       │  │  Procedures  │  │  (SQL)       │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
│                     SQL Server PayrollDB                     │
└─────────────────────────────────────────────────────────────┘
```

### Database Schema

See [database/schema-diagram.md](database/schema-diagram.md) for detailed ER diagram.

### Folder Structure

```
05-Payroll-Processing-Database/
├── README.md                          # This file
├── .gitignore                         # Git ignore rules
├── docker-compose.yml                 # Docker composition
├── Dockerfile                         # Docker image definition
│
├── database/                          # Database scripts
│   ├── 01-CreateDatabase.sql         # Database creation
│   ├── 02-CreateTables.sql           # Table definitions
│   ├── 03-CreateStoredProcedures.sql # Stored procedures
│   ├── 04-CreateTriggers.sql         # Triggers
│   ├── 05-CreateIndexes.sql          # Index optimization
│   ├── 06-SeedData.sql               # Sample data
│   ├── 07-TestData.sql               # Test data
│   └── schema-diagram.md             # ER diagram
│
├── src/                               # Source code
│   ├── Payroll-Processing-Database.sln            # Visual Studio solution
│   ├── Web/                          # Web application
│   │   ├── Default.aspx              # Home page
│   │   ├── Web.config                # Configuration
│   │   ├── Global.asax               # Application events
│   │   ├── Pages/                    # Web pages
│   │   ├── Controls/                 # User controls
│   │   ├── Scripts/                  # JavaScript
│   │   ├── Styles/                   # CSS
│   │   └── Images/                   # Images
│   ├── DataAccess/                   # Data access layer
│   │   ├── DataAccess.cs             # ADO.NET code
│   │   ├── Models/                   # Entity models
│   │   └── Repositories/             # Repository pattern
│   ├── BusinessLogic/                # Business logic
│   │   ├── Services/                 # Business services
│   │   └── Validators/               # Validation logic
│   └── Tests/                        # Unit tests
│       ├── UnitTests/                # Unit tests
│       └── IntegrationTests/         # Integration tests
│
├── deployment/                        # Deployment scripts
│   ├── deploy.ps1                    # PowerShell deployment
│   ├── deploy.sh                     # Bash deployment
│   ├── setup-database.ps1            # Database setup
│   ├── setup-iis.ps1                 # IIS configuration
│   └── rollback.ps1                  # Rollback script
│
├── infrastructure/                    # Infrastructure as Code
│   ├── bicep/                        # Azure Bicep
│   │   ├── main.bicep                # Main template
│   │   ├── database.bicep            # SQL Server
│   │   ├── webapp.bicep              # Web App
│   │   └── parameters.json           # Parameters
│   └── terraform/                    # Terraform
│       ├── main.tf                   # Main configuration
│       ├── variables.tf              # Variables
│       ├── outputs.tf                # Outputs
│       └── terraform.tfvars          # Values
│
├── ci-cd/                            # CI/CD pipelines
│   ├── azure-pipelines.yml           # Azure DevOps
│   ├── github-actions.yml            # GitHub Actions
│   └── jenkins/                      # Jenkins
│       └── Jenkinsfile               # Jenkins pipeline
│
├── docs/                             # Documentation
│   ├── API.md                        # API documentation
│   ├── DATABASE.md                   # Database docs
│   ├── DEPLOYMENT.md                 # Deployment guide
│   ├── USER-GUIDE.md                 # User manual
│   └── DEVELOPER-GUIDE.md            # Developer guide
│
└── tests/                            # Test scripts
    ├── load-tests/                   # Load testing
    ├── integration-tests/            # Integration tests
    └── test-data/                    # Test data
```

## 📋 Prerequisites

### Development Environment
- Windows Server 2008 R2 / 2012 or later
- Visual Studio 2010 / 2012 Professional or higher
- SQL Server 2008 R2 / 2012 (Developer or Enterprise Edition)
- SQL Server Management Studio (SSMS)
- IIS 7.5 or later
- .NET Framework 4.0 / 4.5

### Optional Tools
- SQL Server Data Tools (SSDT)
- SQL Server Reporting Services (SSRS)
- SQL Server Integration Services (SSIS)
- Git for version control
- Docker Desktop (for containerization)

### System Requirements
- **CPU**: 2+ cores
- **RAM**: 4GB minimum, 8GB recommended
- **Disk**: 10GB free space
- **OS**: Windows Server 2008 R2 or later

## 🚀 Installation

### Step 1: Clone Repository

```bash
git clone <repository-url>
cd 05-Payroll-Processing-Database
```

### Step 2: Database Setup

```powershell
# Run database scripts in order
cd database

# Execute in SQL Server Management Studio
sqlcmd -S localhost -i 01-CreateDatabase.sql
sqlcmd -S localhost -d PayrollDB -i 02-CreateTables.sql
sqlcmd -S localhost -d PayrollDB -i 03-CreateStoredProcedures.sql
sqlcmd -S localhost -d PayrollDB -i 04-CreateTriggers.sql
sqlcmd -S localhost -d PayrollDB -i 05-CreateIndexes.sql
sqlcmd -S localhost -d PayrollDB -i 06-SeedData.sql
```

Or use the automated script:

```powershell
.\deployment\setup-database.ps1 -ServerName "localhost" -DatabaseName "PayrollDB"
```

### Step 3: Configure Application

Edit `src/Web/Web.config`:

```xml
<connectionStrings>
  <add name="PayrollDB" 
       connectionString="Server=localhost;Database=PayrollDB;Integrated Security=true;" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

### Step 4: Build Solution

```powershell
cd src
msbuild Payroll-Processing-Database.sln /p:Configuration=Release
```

Or open in Visual Studio and build (Ctrl+Shift+B).

### Step 5: Deploy to IIS

```powershell
.\deployment\setup-iis.ps1 -SiteName "Payroll-Processing-Database" -Port 8080
```

### Step 6: Verify Installation

Navigate to: `http://localhost:8080`

Default credentials:
- Username: `admin`
- Password: `admin123`

## ⚙️ Configuration

### Database Configuration

Edit connection string in `Web.config`:

```xml
<connectionStrings>
  <add name="PayrollDB" 
       connectionString="Server=YOUR_SERVER;Database=PayrollDB;User Id=YOUR_USER;Password=YOUR_PASSWORD;" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

### Application Settings

```xml
<appSettings>
  <add key="ApplicationName" value="Payroll-Processing-Database" />
  <add key="PageSize" value="20" />
  <add key="SessionTimeout" value="30" />
  <add key="EnableLogging" value="true" />
  <add key="LogPath" value="C:\Logs\Payroll-Processing-Database" />
</appSettings>
```

### Email Configuration

```xml
<system.net>
  <mailSettings>
    <smtp from="noreply@company.com">
      <network host="smtp.company.com" port="587" 
               userName="user" password="pass" 
               enableSsl="true" />
    </smtp>
  </mailSettings>
</system.net>
```

## 🚢 Deployment

### Manual Deployment

1. Build the solution in Release mode
2. Copy files from `bin/Release` to server
3. Configure IIS application pool
4. Set up database connection
5. Test the application

### Automated Deployment

```powershell
# Deploy to production
.\deployment\deploy.ps1 -Environment Production -ServerName "prod-server"

# Deploy to staging
.\deployment\deploy.ps1 -Environment Staging -ServerName "staging-server"
```

### Docker Deployment

```bash
# Build Docker image
docker build -t Payroll-Processing-Database:latest .

# Run container
docker-compose up -d

# View logs
docker-compose logs -f
```

### Azure Deployment

```bash
# Deploy using Bicep
cd infrastructure/bicep
az deployment group create --resource-group rg-Payroll-Processing-Database --template-file main.bicep

# Deploy using Terraform
cd infrastructure/terraform
terraform init
terraform plan
terraform apply
```

## 📖 Usage

### Creating a New Transaction

1. Navigate to **Transactions > New Transaction**
2. Select Branch, Customer, and Sales Representative
3. Add product line items
4. Review totals
5. Click **Save Transaction**

### Viewing Reports

1. Navigate to **Reports**
2. Select report type
3. Set date range and filters
4. Click **Generate Report**
5. Export to Excel or PDF

### Managing Master Data

1. Navigate to **Master Data**
2. Select entity type (Products, Customers, etc.)
3. Click **Add New** or edit existing records
4. Save changes

## 📚 API Documentation

### REST API Endpoints

#### Transactions

```
GET    /api/transactions              # List all transactions
GET    /api/transactions/:id          # Get transaction by ID
POST   /api/transactions              # Create new transaction
PUT    /api/transactions/:id          # Update transaction
DELETE /api/transactions/:id          # Delete transaction
```

#### Products

```
GET    /api/products                  # List all products
GET    /api/products/:id              # Get product by ID
POST   /api/products                  # Create new product
PUT    /api/products/:id              # Update product
DELETE /api/products/:id              # Delete product
```

See [docs/API.md](docs/API.md) for complete API documentation.

## 🗄️ Database Schema

### Main Tables

- **Branches**: Store branch information
- **Customers**: Customer master data
- **Products**: Product catalog
- **SalesTransactions**: Transaction headers
- **SalesTransactionDetails**: Transaction line items
- **Payments**: Payment records
- **SalesRepresentatives**: Sales staff
- **AuditLog**: Audit trail

See [docs/DATABASE.md](docs/DATABASE.md) for complete schema documentation.

## 🧪 Testing

### Run Unit Tests

```powershell
cd src/Tests
dotnet test
```

### Run Integration Tests

```powershell
cd tests/integration-tests
.\run-tests.ps1
```

### Load Testing

```powershell
cd tests/load-tests
.\run-load-test.ps1 -Users 100 -Duration 300
```

## 📊 Monitoring

### Application Monitoring

- **Logs**: Check `C:\Logs\Payroll-Processing-Database`
- **Performance**: Use Performance Monitor
- **Errors**: Check Event Viewer

### Database Monitoring

```sql
-- Check database size
EXEC sp_spaceused

-- View active connections
SELECT * FROM sys.dm_exec_sessions WHERE database_id = DB_ID('PayrollDB')

-- Check long-running queries
SELECT * FROM sys.dm_exec_requests WHERE database_id = DB_ID('PayrollDB')
```

## 🔧 Troubleshooting

### Common Issues

#### Database Connection Failed

**Problem**: Cannot connect to database

**Solution**:
1. Verify SQL Server is running
2. Check connection string in Web.config
3. Verify user permissions
4. Check firewall settings

#### Application Pool Crashes

**Problem**: IIS application pool stops

**Solution**:
1. Check Event Viewer for errors
2. Verify .NET Framework version
3. Check application pool identity
4. Review application logs

#### Slow Performance

**Problem**: Application is slow

**Solution**:
1. Check database indexes
2. Review query execution plans
3. Enable output caching
4. Optimize stored procedures

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Write tests
5. Submit a pull request

## 📄 License

This project is part of the Muhammad Siddique |  dba.siddique@gmail.com.  
For educational and reference purposes.

## 👤 Author

**Data Engineering Portfolio**  
**Year**: 2011  
**Technology Era**: 2011-2014

## 📞 Support

For issues and questions:
- Check the [docs/](docs/) folder
- Review [TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
- Check database logs
- Review application logs

## 🔗 Related Projects

- See [00-PORTFOLIO-INDEX.md](../00-PORTFOLIO-INDEX.md) for all projects

---

**Last Updated**: 2011  
**Status**: ✅ Production Ready  
**Version**: 1.0.0
