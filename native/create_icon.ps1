<# Создаёт многоразмерный ICO и значок проекта из векторной геометрии.
Вызывается вручную при изменении оформления; сборка использует готовые assets. #>
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$assets = Join-Path $PSScriptRoot 'assets'
[IO.Directory]::CreateDirectory($assets) | Out-Null
$images = @()
foreach ($size in @(16, 24, 32, 48, 64, 128, 256)) {
    $bitmap = New-Object Drawing.Bitmap($size, $size)
    $graphics = [Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.ScaleTransform(($size / 256.0), ($size / 256.0))
    $background = New-Object Drawing.SolidBrush([Drawing.ColorTranslator]::FromHtml('#153c4b'))
    $glass = New-Object Drawing.SolidBrush([Drawing.ColorTranslator]::FromHtml('#008899'))
    $electrode = New-Object Drawing.Pen([Drawing.Color]::White, 12)
    $bolt = New-Object Drawing.SolidBrush([Drawing.ColorTranslator]::FromHtml('#ffcf54'))
    $graphics.FillEllipse($background, 2, 2, 252, 252)
    $graphics.FillRectangle($glass, 42, 114, 172, 88)
    foreach ($x in @(66, 128, 190)) { $graphics.DrawLine($electrode, $x, 55, $x, 151) }
    [Drawing.PointF[]]$points = @(
        [Drawing.PointF]::new(144, 82), [Drawing.PointF]::new(96, 151),
        [Drawing.PointF]::new(128, 151), [Drawing.PointF]::new(110, 216),
        [Drawing.PointF]::new(169, 132), [Drawing.PointF]::new(137, 132)
    )
    $graphics.FillPolygon($bolt, $points)
    $stream = New-Object IO.MemoryStream
    $bitmap.Save($stream, [Drawing.Imaging.ImageFormat]::Png)
    $images += ,$stream.ToArray()
    if ($size -eq 256) { $bitmap.Save((Join-Path $assets 'tok26.png'), [Drawing.Imaging.ImageFormat]::Png) }
    foreach ($resource in @($stream, $graphics, $bitmap, $background, $glass, $electrode, $bolt)) { $resource.Dispose() }
}
$output = [IO.File]::Create((Join-Path $assets 'tok26.ico'))
$writer = New-Object IO.BinaryWriter($output)
try {
    $writer.Write([uint16]0); $writer.Write([uint16]1); $writer.Write([uint16]$images.Count)
    $offset = 6 + 16 * $images.Count
    $sizes = @(16, 24, 32, 48, 64, 128, 256)
    for ($i = 0; $i -lt $images.Count; $i++) {
        $dimension = if ($sizes[$i] -eq 256) { 0 } else { $sizes[$i] }
        $writer.Write([byte]$dimension); $writer.Write([byte]$dimension)
        $writer.Write([byte]0); $writer.Write([byte]0)
        $writer.Write([uint16]1); $writer.Write([uint16]32)
        $writer.Write([uint32]$images[$i].Length); $writer.Write([uint32]$offset)
        $offset += $images[$i].Length
    }
    foreach ($bytes in $images) { $writer.Write([byte[]]$bytes) }
}
finally { $writer.Dispose(); $output.Dispose() }
$idea = Join-Path (Split-Path $PSScriptRoot) '.idea'
[IO.Directory]::CreateDirectory($idea) | Out-Null
Copy-Item -LiteralPath (Join-Path $assets 'tok26.png') -Destination (Join-Path $idea 'icon.png')
Copy-Item -LiteralPath (Join-Path $assets 'tok26.png') -Destination (Join-Path $idea 'icon_dark.png')
