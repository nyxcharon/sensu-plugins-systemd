#! /usr/bin/env ruby
#
#   check-failed-units.rb
#
# DESCRIPTION:
# => Check if there are any failed systemd service units
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: systemd-bindings
#
# USAGE:

#
# LICENSE:
#   Bobby Martin <nyxcharon@gmail.com>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'
require 'systemd'

class CheckFailedUnits < Sensu::Plugin::Check::CLI
    def run
      cli = CheckFailedUnits.new
      begin
        systemd = Systemd::SystemdManager.new
      rescue
        unknown 'Can not connect to systemd'
      end
      failed_units = ""
      systemd.units.each do |unit|
        if unit.name.include?(".service") and unit.active_state.include?("failed")
          failed_units += unit.name+","
        end
      end
      if failed_units.empty?
        ok 'No failed service units'
      else
        critical "Found failed service units: #{failed_units}"
      end
    end
end
