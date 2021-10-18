# frozen_string_literal: true

FILE_F = './F.txt'
FILE_H = './H.txt'

def generate_f
  File.open(FILE_F, 'w') do |f|
    rand(5..15).downto 1 do
      word = (0...rand(5..15)).map { rand(65..65 + 25).chr }.join.downcase
      yield word
      f.puts word
    end
  end
end

def generate_h
  return 'FILE F NOT EXISTS' unless File.exist? FILE_F

  h = File.new FILE_H, 'w'
  File.open(FILE_F, 'r') do |f|
    while (line = f.gets)
      unless line.index('a').nil?
        h.puts(line)
        yield line end
    end
  end
  h.close
end
