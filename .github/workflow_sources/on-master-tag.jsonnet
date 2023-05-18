local common = import 'common.libsonnet';

common.manifestYamlDoc(
  {
    name: 'Release production',
    on: {
      push: {
        tags: ['v*'],
      },
      workflow_dispatch: {},  // Allow starting the workflow manually
    },

    jobs: {
      ref:: '${{ github.ref }}',
      base:: {},
      docker_project:: 'husarnet/husarnet',

      build_linux: common.jobs.build_linux(self.ref) + self.base,
      build_macos_natively: common.jobs.build_macos_natively(self.ref) + self.base,
      build_windows: common.jobs.build_windows(self.ref) + self.base,
      build_windows_installer: common.jobs.build_windows_installer(self.ref) + self.base,
      run_tests: common.jobs.run_tests(self.ref) + self.base,
      run_integration_tests: common.jobs.run_integration_tests(self.ref, self.docker_project) + self.base,

      release: common.jobs.release('prod', self.ref) + self.base,
      release_github: common.jobs.release_github() + self.base,
      build_docker: common.jobs.build_docker(self.docker_project, true, self.ref) + self.base,
      release_docker: common.jobs.release_docker(self.docker_project, self.ref) + self.base,
    },
  }
)
