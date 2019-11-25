# pmset -g batt | grep -Eo "\d+%" | cut -d% -f1
pmset -g batt | grep -Eo "\d+%"
