Around( '@record' ) do | scenario, block |
  start_recording
  block.call
  stop_recording
end
