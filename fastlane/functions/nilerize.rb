#!/usr/bin/env groovy
#
#   readable_time.rb
#   Tooling
#   Created by Duncan Wallace 08/21/2020
#   Copyright © 2020. Duncwa LLC.  All rights reserved

def nilerize(*args)
  args.find { |a| !a.nil? }
end
