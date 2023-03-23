[Defines]
  PLATFORM_NAME                  = sdm845Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = sdm845Pkg/polaris.fdf

!include sdm845Pkg/sdm845Pkg.dsc

[PcdsFixedAtBuild.common]
  # System Memory size
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x40000000

  # Adjust your framebuffer size here
  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1920
  gsdm845PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|1200
