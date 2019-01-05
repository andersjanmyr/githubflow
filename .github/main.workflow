workflow "push-flow" {
  on = "push"
  resolves = "echo2"
}

action "echo1" {
  uses = "docker://alpine:latest"
  runs = "echo one"
}

action "echo2" {
  needs = "echo1"
  uses = "docker://alpine:latest"
  runs = "echo two"
}
