#!/usr/bin/env groovy
#
#   build_number.rb
#   Tooling
#   Created by Duncan Wallace 03/30/2022
#   Copyright © 2022. Duncwa LLC.  All rights reserved

require "time"

def build_number(time: Time.now)
 time.utc.iso8601.tr("-T:Z", "")[2,10]
end
