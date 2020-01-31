BATT=$(pmset -g batt)
STATUS=$(echo $BATT | grep -Eo "\d+%" | cut -d% -f1)%
if ! [[ $BATT == *"discharging"* ]]; then
  STATUS="${STATUS} ⚡️"
fi
echo $STATUS
