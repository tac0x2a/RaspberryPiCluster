#!/usr/bin/env ruby

require 'webhdfs'
require 'webhdfs/fileutils'

Host = "rp00.tac42.net"
Port = 9870
UserName = "hadoop"

DstDir = "/DisneyWaitingTime"

client = WebHDFS::Client.new(Host, Port, UserName)
client.delete(DstDir, :recursive => true)
client.delete(DstDir)
client.mkdir(DstDir, :permission => '0777')

WebHDFS::FileUtils.set_server(Host, Port, UserName)

Dir.glob("*.json") do |src_file|
  WebHDFS::FileUtils.copy_from_local(src_file, DstDir)
end
