
task :build do
  sh "gem build bigcommerce.gemspec"
end

task :publish => :build do
  sh "gem push bigcommerce"
end

task :clean do
  sh "rm *.gem"
end

task :release => [:publish, :clean]