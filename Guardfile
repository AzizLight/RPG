guard 'bundler' do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  watch(/^.+\.gemspec/)
end

guard 'minitest' :verbose => true do
  watch('^spec/(.*)_spec.rb')
  watch('^lib/(.*)\.rb')        { |m| "spec/#{m[1]}_spec.rb" }
  watch('^spec/spec_helper.rb') { "spec" }
end

guard 'ego' do
  watch('Guardfile')
end
