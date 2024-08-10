echo ""

figlet "Pacotes por data"

echo ""

for i in $(pacman -Qq)
do
  grep "\[ALPM\] installed $i" /var/log/pacman.log
done | \
  sort -u | \
  sed -e 's/\[ALPM\] installed //' -e 's/(.*$//'
