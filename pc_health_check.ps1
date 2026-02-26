const vscode = require('vscode');

function activate(context) {
    let disposable = vscode.commands.registerCommand('pcHealth.runReport', function () {

        const terminal = vscode.window.createTerminal('PC Health Report');
        terminal.show();

        // PowerShell variables must be escaped (\$) to prevent JS template literal interpolation.
        // The script is built as an array of lines joined by newlines to avoid backtick conflicts.
        const script = [
            '# 1. Gather System Identity Information',
            '\\$computerName = \\$env:COMPUTERNAME',
            '\\$userName = \\$env:USERNAME',
            'Write-Host "--- PC Health Report for \\$computerName ---" -ForegroundColor Cyan',
            'Write-Host "Current User: \\$userName"',
            '',
            '# 2. Disk Space Audit (Targeting C: Drive)',
            '\\$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID=\'C:\'"',
            '\\$freeSpaceGB = [math]::round(\\$disk.FreeSpace / 1GB, 2)',
            '\\$totalSpaceGB = [math]::round(\\$disk.Size / 1GB, 2)',
            'Write-Host "Disk Space: \\$freeSpaceGB GB free out of \\$totalSpaceGB GB"',
            '',
            '# 3. RAM (Memory) Utilization',
            '\\$os = Get-CimInstance Win32_OperatingSystem',
            '\\$freeRAM = [math]::round(\\$os.FreePhysicalMemory / 1MB, 2)',
            '\\$totalRAM = [math]::round(\\$os.TotalVisibleMemorySize / 1MB, 2)',
            'Write-Host "Memory: \\$freeRAM GB free out of \\$totalRAM GB"',
            '',
            '# 4. Service Status Check: Print Spooler',
            '\\$service = Get-Service -Name "Spooler"',
            'if (\\$service.Status -eq "Running") {',
            '    Write-Host "Print Spooler Service: Running" -ForegroundColor Green',
            '} else {',
            '    Write-Host "Print Spooler Service: Stopped (Attention Required!)" -ForegroundColor Red',
            '}',
            '',
            'Write-Host "--- Check Completed ---" -ForegroundColor Cyan',
        ].join('\n');

        terminal.sendText(script);
    });

    context.subscriptions.push(disposable);
}

function deactivate() {}

module.exports = { activate, deactivate };
