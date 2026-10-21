$ErrorActionPreference = 'Stop'
$taskRoot = Split-Path -Parent $PSScriptRoot
$pdfPath = Join-Path $taskRoot 'output\pdf\Васильев_КЮ_ВетЗабота_Проектирование_ИС.pdf'
$previewDir = Join-Path $taskRoot 'docs\previews'
New-Item -ItemType Directory -Path $previewDir -Force | Out-Null
$names = @('use-cases','wireframe-1','wireframe-2','wireframe-3','wireframe-4','wireframe-5')
for ($i = 0; $i -lt $names.Count; $i++) {
    $pageNumber = 8 + $i
    & pdftoppm -f $pageNumber -l $pageNumber -singlefile -r 120 -png $pdfPath (Join-Path $previewDir $names[$i])
    if ($LASTEXITCODE -ne 0) { throw "Rendering failed for page $pageNumber" }
}
