# frozen_string_literal: true

require 'stealth'
require 'dotenv/load'
require_relative './environment'

Bundler.require(:default, Stealth.env)

Stealth.config.session_ttl = 1_209_600 # 14 days x 24 hours x 3_600 seconds

Stealth.boot

