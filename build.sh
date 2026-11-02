#!/usr/bin/env bash
# Sestaví samostatný index.html (GitHub Pages) z mise-180.html (verze pro artifact).
set -euo pipefail
cd "$(dirname "$0")"

{
cat <<'EOF'
<!doctype html>
<html lang="cs">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#090d0a">
<meta name="description" content="Vypadla komunikace. Tvůj tým čeká na instrukce. Máš 180 sekund.">
<meta property="og:title" content="Mise 180: Signál ztracen">
<meta property="og:description" content="Vypadla komunikace. Tvůj tým čeká na instrukce. Máš 180 sekund.">
<meta property="og:type" content="website">
<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>
EOF
sed -n '1,/^<\/style>$/p' mise-180.html
echo '</head>'
echo '<body>'
sed -n '/^<\/style>$/,$p' mise-180.html | tail -n +2
printf '</body>\n</html>\n'
} > index.html

echo "index.html: $(wc -l < index.html) řádků"
