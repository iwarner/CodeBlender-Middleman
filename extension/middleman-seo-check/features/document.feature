Feature: Document

    Scenario: Don't analyse documents that have already been analysed
        Given a fixture app "basic-app"
            Then the following files should not exist:
                | source/index.html |

    Scenario: Don't write a manifest file if it is disabled

        Given a fixture app "basic-app"
            And app "basic-app" is using config "disabled-manifest"

        Given a successfully built app at "basic-app" with flags "--verbose"
            Then the following files should not exist:
                | build/seocheck.manifest.yml |

    Scenario: Basic analysing

        Given a fixture app "basic-app"
            Then the following files should exist:
                | source/index.html |
