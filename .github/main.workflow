workflow "push-flow" {
  on = "push"
  resolves = "echo2"
}

action "env" {
  uses = "docker://alpine:latest"
  runs = "env"
}

action "cat-event" {
  uses = "docker://alpine:latest"
  runs = "sh -c cat $GITHUB_EVENT_PATH"
}


action "echo2" {
  needs = [ "env", "cat-event" ]
  uses = "docker://alpine:latest"
  runs = "sh -c echo two GITHUB_SHA:$GITHUB_SHA, GITHUB_REF:$GITHUB_REF"
}
