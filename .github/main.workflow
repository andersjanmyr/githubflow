workflow "push-flow" {
  on = "push"
  resolves = "echo2"
}

action "echo1" {
  uses = "docker://alpine:latest"
  runs = "env"
}

action "echo2" {
  needs = "echo1"
  uses = "docker://alpine:latest"
  runs = "sh -c \"echo two GITHUB_SHA:$GITHUB_SHA, GITHUB_REF:$GITHUB_REF\""
}
