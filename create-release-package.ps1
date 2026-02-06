# Xeneon Ollama Widget - Release Package Builder
# Creates a distributable ZIP file with all necessary files

Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Xeneon Ollama Widget - Release Package Builder         ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

$releaseVersion = "v1.0.0"
$releaseFolder = "xeneon-ollama-widget-$releaseVersion"
$zipFileName = "$releaseFolder.zip"

# Files to include in the release
$filesToInclude = @(
    "redteam.html",
    "ollamasoft.html",
    "start-ollama-widget.bat",
    "README.md",
    "SETUP.md",
    "LICENSE",
    "QUICKSTART.txt"
)

Write-Host "📦 Creating release package: $zipFileName" -ForegroundColor Green
Write-Host ""

# Check if all files exist
Write-Host "✓ Checking files..." -ForegroundColor Yellow
$missingFiles = @()
foreach ($file in $filesToInclude) {
    if (Test-Path $file) {
        Write-Host "  ✓ $file" -ForegroundColor Gray
    } else {
        Write-Host "  ✗ $file (MISSING)" -ForegroundColor Red
        $missingFiles += $file
    }
}

if ($missingFiles.Count -gt 0) {
    Write-Host ""
    Write-Host "❌ Error: Missing files. Cannot create release package." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "✓ Creating temporary release folder..." -ForegroundColor Yellow

# Clean up old release folder if it exists
if (Test-Path $releaseFolder) {
    Remove-Item $releaseFolder -Recurse -Force
}

# Create release folder
New-Item -ItemType Directory -Path $releaseFolder -Force | Out-Null

# Copy files to release folder
Write-Host "✓ Copying files..." -ForegroundColor Yellow
foreach ($file in $filesToInclude) {
    Copy-Item $file $releaseFolder\
    Write-Host "  → $file" -ForegroundColor Gray
}

Write-Host ""
Write-Host "✓ Creating ZIP archive..." -ForegroundColor Yellow

# Remove old ZIP if it exists
if (Test-Path $zipFileName) {
    Remove-Item $zipFileName -Force
}

# Create ZIP file
Compress-Archive -Path $releaseFolder -DestinationPath $zipFileName -Force

# Clean up temporary folder
Remove-Item $releaseFolder -Recurse -Force

# Get file size
$zipSize = (Get-Item $zipFileName).Length / 1KB
$zipSizeMB = [math]::Round($zipSize / 1024, 2)

Write-Host ""
Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                   ✅ SUCCESS!                             ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "📦 Release package created:" -ForegroundColor Cyan
Write-Host "   File: $zipFileName" -ForegroundColor White
Write-Host "   Size: $zipSizeMB MB" -ForegroundColor White
Write-Host ""
Write-Host "📋 Package includes:" -ForegroundColor Cyan
foreach ($file in $filesToInclude) {
    Write-Host "   • $file" -ForegroundColor Gray
}
Write-Host ""
Write-Host "🚀 Next steps:" -ForegroundColor Yellow
Write-Host "   1. Share $zipFileName with others" -ForegroundColor White
Write-Host "   2. Users extract the ZIP and read QUICKSTART.txt" -ForegroundColor White
Write-Host "   3. Users need to download Ollama separately from:" -ForegroundColor White
Write-Host "      https://ollama.com/download" -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 Tip: Upload to GitHub Releases for easy distribution!" -ForegroundColor Yellow
Write-Host ""
