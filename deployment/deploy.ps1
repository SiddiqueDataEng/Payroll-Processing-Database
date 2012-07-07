# Deployment Script for Payroll-Processing-Database
# PowerShell 2.0 (Windows Server 2008 R2)
# Manual deployment process - typical for 2011-2014

param(
    [string]$ServerName = "localhost",
    [string]$DatabaseName = "PayrollDB"
)

Write-Host "========================================" -ForegroundColor Green
Write-Host "Deploying Payroll-Processing-Database" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "MANUAL DEPLOYMENT STEPS:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. RDP to server: $ServerName" -ForegroundColor Cyan
Write-Host "2. Copy deployment package to server" -ForegroundColor Cyan
Write-Host "3. Stop IIS Application Pool" -ForegroundColor Cyan
Write-Host "4. Backup current application files" -ForegroundColor Cyan
Write-Host "5. Execute SQL scripts in SSMS:" -ForegroundColor Cyan
Write-Host "   - Open SQL Server Management Studio" -ForegroundColor White
Write-Host "   - Connect to $ServerName" -ForegroundColor White
Write-Host "   - Execute database\schema.sql" -ForegroundColor White
Write-Host "   - Execute database\stored-procedures.sql" -ForegroundColor White
Write-Host "   - Execute database\triggers.sql" -ForegroundColor White
Write-Host "6. Copy new application files" -ForegroundColor Cyan
Write-Host "7. Update Web.config connection string" -ForegroundColor Cyan
Write-Host "8. Start IIS Application Pool" -ForegroundColor Cyan
Write-Host "9. Test application manually" -ForegroundColor Cyan
Write-Host "10. Document deployment in Excel log" -ForegroundColor Cyan
Write-Host ""
Write-Host "========================================" -ForegroundColor Green

# Automated database deployment (if SQL Server accessible)
Write-Host ""
Write-Host "Attempting automated database deployment..." -ForegroundColor Yellow

$sqlFiles = @(
    "..\database\01-schema.sql",
    "..\database\02-stored-procedures.sql",
    "..\database\03-triggers.sql",
    "..\database\04-seed-data.sql"
)

foreach ($sqlFile in $sqlFiles) {
    if (Test-Path $sqlFile) {
        Write-Host "Executing $sqlFile..." -ForegroundColor Cyan
        sqlcmd -S $ServerName -d $DatabaseName -i $sqlFile -b
        if ($LASTEXITCODE -eq 0) {
            Write-Host "  SUCCESS" -ForegroundColor Green
        } else {
            Write-Host "  FAILED - Check errors above" -ForegroundColor Red
            Write-Host "  Continue manually in SSMS" -ForegroundColor Yellow
        }
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Deployment script completed" -ForegroundColor Green
Write-Host "Complete remaining steps manually" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Green
