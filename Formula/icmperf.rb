# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Icmperf < Formula
  desc ""
  homepage ""
  version "2.0.0"

  on_macos do
    on_intel do
      url "https://github.com/b4nst/icmperf/releases/download/v2.0.0/icmperf_Darwin_x86_64.tar.gz"
      sha256 "c784c3d70a6810b9df39f09a11d594f562405221aa2557b5c83713b312dc9e9c"

      def install
        bin.install "icmperf"
      end
    end
    on_arm do
      url "https://github.com/b4nst/icmperf/releases/download/v2.0.0/icmperf_Darwin_arm64.tar.gz"
      sha256 "e8d2504384d24bb9b86069f20d6a64442806e15dc3e99ec4efed56dc0511a473"

      def install
        bin.install "icmperf"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/b4nst/icmperf/releases/download/v2.0.0/icmperf_Linux_x86_64.tar.gz"
        sha256 "60b49fdf47fb1b744784d828e9ecd0bd5eb33f35061e63dad74a74bd551a6c0a"

        def install
          bin.install "icmperf"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/b4nst/icmperf/releases/download/v2.0.0/icmperf_Linux_arm64.tar.gz"
        sha256 "8d3fab5c1ba3e4d3bc6b7ea66da77e97d87707b42987326dc829b69359723f27"

        def install
          bin.install "icmperf"
        end
      end
    end
  end
end
