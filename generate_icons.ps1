Add-Type -AssemblyName System.Drawing

function Generate-Icon($size, $filename) {
    $bmp = New-Object System.Drawing.Bitmap $size, $size
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

    # Background gradient or solid brand navy #0f233a
    $brushBg = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml("#0f233a"))
    $g.FillRectangle($brushBg, 0, 0, $size, $size)

    # Gold circular accent
    $penGold = New-Object System.Drawing.Pen ([System.Drawing.ColorTranslator]::FromHtml("#f59e0b"), [Math]::Max(2, $size / 48))
    $margin = $size * 0.08
    $g.DrawEllipse($penGold, $margin, $margin, $size - 2*$margin, $size - 2*$margin)

    # Text: 釜山 (Large)
    $fontSize1 = $size * 0.28
    $font1 = New-Object System.Drawing.Font ("Microsoft JhengHei", $fontSize1, [System.Drawing.FontStyle]::Bold)
    $brushGold = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml("#fcd34d"))
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = [System.Drawing.StringAlignment]::Center
    $sf.LineAlignment = [System.Drawing.StringAlignment]::Center

    $rect1 = New-Object System.Drawing.RectangleF (0, ($size * 0.22), $size, ($size * 0.35))
    $g.DrawString("釜山", $font1, $brushGold, $rect1, $sf)

    # Text: 2026 (Small)
    $fontSize2 = $size * 0.16
    $font2 = New-Object System.Drawing.Font ("Arial", $fontSize2, [System.Drawing.FontStyle]::Bold)
    $brushWhite = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml("#ffffff"))
    $rect2 = New-Object System.Drawing.RectangleF (0, ($size * 0.58), $size, ($size * 0.22))
    $g.DrawString("2026", $font2, $brushWhite, $rect2, $sf)

    $bmp.Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
    Write-Host "Created $filename ($size x $size)"
}

Generate-Icon 192 "icon-192.png"
Generate-Icon 512 "icon-512.png"

