function zcp {
  cat $ZELLIJ_DUMP | pbcopy
}

function zdump {
  zellij action dump-screen $ZELLIJ_DUMP
}

function zcat {
  zellij action dump-screen $ZELLIJ_DUMP
  cat $ZELLIJ_DUMP
}

