param (
    [Parameter(Mandatory=$true)]
    [string]$FilePath,

    [Parameter(Mandatory=$true)]
    [string]$HashPath,

    [Parameter(Mandatory=$true)]
    [ValidateSet('SHA256', 'SHA512')]
    [string]$Algorithm
)

$expectedHashLine = Get-Content -Path $HashPath
$expectedHash = ($expectedHashLine.Split(' '))[0].ToLower()
$actualHash = (Get-FileHash -Path $FilePath -Algorithm $Algorithm).Hash.ToLower()

# Function to count characters and numbers in a string
function CountCharsAndNumbers($str) {
    $chars = 0
    $numbers = 0

    foreach ($c in $str.ToCharArray()) {
        if ($c -match "\d") {
            $numbers++
        } elseif ($c -match "\w") {
            $chars++
        }
    }

    return @($chars, $numbers)
}

$expectedCounts = CountCharsAndNumbers -str $expectedHash
$actualCounts = CountCharsAndNumbers -str $actualHash

if ($expectedHash -eq $actualHash) {
    Write-Host "Expected $Algorithm Checksum:`n$expectedHash"
    Write-Host "Expected checksum contains $($expectedCounts[0]) characters and $($expectedCounts[1]) numbers."
    Write-Host "Actual $Algorithm Checksum:`n$actualHash"
    Write-Host "Actual checksum contains $($actualCounts[0]) characters and $($actualCounts[1]) numbers."
    Write-Host "Checksums match."
} else {
    Write-Host "Expected $Algorithm Checksum:`n$expectedHash"
    Write-Host "Expected checksum contains $($expectedCounts[0]) characters and $($expectedCounts[1]) numbers."
    Write-Host "Actual $Algorithm Checksum:`n$actualHash"
    Write-Host "Actual checksum contains $($actualCounts[0]) characters and $($actualCounts[1]) numbers."
    Write-Host "Checksums do not match."
}
