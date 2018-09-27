# Spinnaker-demo

Spinnaker-demo is a demo project for testing Jenkins-Spinnaker pipelines.

More details are available at [imperialwicket.com](http://imperialwicket.com/install-spinnaker-on-ubuntu-16.04-in-aws/).

Key considerations in this implementation are:

 - Jenkinsfile and Jenkins pipeline are responsible for generating an artifact and gating artifact (debian package) generation by branch
 - Jenkins job completion triggers a Spinnaker deployment pipeline that includes an image bake stage
