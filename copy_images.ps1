$srcDir = "C:\Users\NYAMMA\Downloads\blo website"
$destBase = "c:\Users\NYAMMA\NYA BLO\apps\web\public\images"

function Slugify($name) {
    $name = $name.ToLower()
    $name = $name -replace 'é|è|ê', 'e'
    $name = $name -replace 'à|â', 'a'
    $name = $name -replace 'î|ï', 'i'
    $name = $name -replace 'ô|ö', 'o'
    $name = $name -replace 'û|ü', 'u'
    $name = $name -replace '_', '-'
    $name = $name -replace '\s+', '-'
    $name = $name -replace '[^a-z0-9\-]', ''
    $name = $name -replace '-+', '-'
    return $name.Trim('-')
}

$files = Get-ChildItem $srcDir -Filter *.png

foreach ($file in $files) {
    $slug = Slugify($file.BaseName)
    $ext = $file.Extension
    $category = "other"

    if ($file.Name -match "Bazin|Masque|Sceau|Encens|Huile|iPhone|Samsung|Setup|Vidéoprojecteur|Vid_oprojecteur") { $category = "products" }
    elseif ($file.Name -match "Site Vitrine|Pro Shop|MVP App|Express AI|Pack Mensuel") { $category = "services" }
    elseif ($file.Name -match "Villa|Appartement|Domaine|Duplex|Terrain|Bureau") { $category = "immobilier" }
    elseif ($file.Name -match "Formation|Masterclass|Leadership|Cosmologie|Design") { $category = "education" }
    elseif ($file.Name -match "Comfort|Moto|Premium|Trajet") { $category = "vtc" }
    elseif ($file.Name -match "Centre|Clinique|Soins|Mère-Enfant|M_re-Enfant|M_re Enfant") { $category = "health" }
    elseif ($file.Name -match "Cycle de Sirius|Cyber Shango|Renaissance K_mitique|Dama") { $category = "media" }

    $destPath = Join-Path $destBase $category
    $destPath = Join-Path $destPath ($slug + $ext)
    
    Write-Host "Copying $($file.Name) to $destPath"
    Copy-Item $file.FullName -Destination $destPath -Force
}
