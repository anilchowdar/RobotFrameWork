- job-template:
    name: '{name}-unit-tests'
    project-type: pipeline
    dsl: |
        build job: "job1"
        parallel [
          2a: build job: "job2a",
          2b: node "dummynode" {{
            sh "echo {isay}"
          }}
        ]

- job-group:
    name: '{name}-tests'
    jobs:
      - '{name}-unit-tests':
          isay: 'hello'

- project:
    name: project-name
    jobs:
    - '{name}-tests'