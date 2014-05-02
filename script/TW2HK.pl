#!/usr/bin/perl
# Usage: ./TW2HK.pl , put it in the same directory as install.rdf

use strict;
use warnings;
use File::Copy;

my $version;
my $install='<?xml version="1.0"?>
<!--
-->
<RDF xmlns="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
     xmlns:em="http://www.mozilla.org/2004/em-rdf#">
  <Description about="urn:mozilla:install-manifest"
               em:id="langpack-zh-HK@firefox.mozilla.org"
               em:name="Traditional Chinese Hong Kong (zh-HK) Language Pack"
               em:version="$version.0"
               em:type="8"
               em:creator="Mozilla Hong Kong Community based on the work of MozTW">
    <em:contributor>Sammy Fung</em:contributor> <em:contributor>Haggen So</em:contributor>
    <em:targetApplication>
      <Description>
        <em:id>{ec8030f7-c20a-464f-9b0e-13a3a9e97384}</em:id>
        <em:minVersion>$version.0</em:minVersion>
        <em:maxVersion>$version.*</em:maxVersion>
      </Description>
    </em:targetApplication>
  </Description>
</RDF>';

# Ref: http://perlmaven.com/how-to-replace-a-string-in-a-file-with-perl
sub read_file {
  my ($filename) = @_;
   
  open my $in, '<:encoding(UTF-8)', $filename or die "Could not open '$filename' for reading $!";
  local $/ = undef;
  my $all = <$in>;
  close $in;
   
  return $all;
}
 
sub write_file {
  my ($filename, $content) = @_;
   
  open my $out, '>:encoding(UTF-8)', $filename or die "Could not open '$filename' for writing $!";;
  print $out $content;
  close $out;
   
  return;
}

print "TW2HK started \n";

# install.rdf
print " \nFix install.rdf \n";
my $filename = "install.rdf";
my $data = read_file($filename);
$data =~ /em:version=\"(\d+)/ ;
$version=$1;
print "Version:$version \n";
$install =~ s/\$version/$version/g;
write_file($filename, $install);

# zh-TW -> zh-HK
print " \nReplace zh-TW -> zh-HK \n";
my @files = ("chrome.manifest", 
"browser/chrome.manifest", 
"browser/defaults/preferences/firefox-l10n.js", 
"browser/chrome/zh-TW.manifest",
"chrome/zh-TW.manifest");

foreach (@files) {
  my $filename = $_;
  my $data = read_file($filename);
  $data =~ s/zh-TW/zh-HK/g;
  $data =~ s/zh-tw/zh-hk/g;
  write_file($filename, $data);
  print "$filename done.\n";
}

$filename = "chrome/zh-TW/locale/zh-TW/global/intl.properties";
$data = read_file($filename);
$data =~ s/locale=zh-TW/locale=zh-HK/g;
write_file($filename, $data);
print "$filename done.\n";

# searchplugins
print "\nsearchplugins - don't care for now\n";

# Rename files
print "\nRename files \n";
move("browser/chrome/zh-TW.manifest", "browser/chrome/zh-HK.manifest") or die("failed to move browser/chrome/zh-TW.manifest to browser/chrome/zh-HK.manifest");
move("chrome/zh-TW.manifest", "chrome/zh-HK.manifest") or die("failed to move chrome/zh-TW.manifest to chrome/zh-HK.manifest");

# Lastly, change directories
print "\nChange Directories \n";
move("browser/chrome/zh-TW", "browser/chrome/zh-HK") or die("failed to move browser/chrome/zh-TW -> browser/chrome/zh-HK");
move("chrome/zh-TW/locale/zh-TW", "chrome/zh-TW/locale/zh-HK") or die("failed to move chrome/zh-TW/locale/zh-TW -> chrome/zh-TW/locale/zh-HK");
move("chrome/zh-TW/", "chrome/zh-HK/") or die("failed to move chrome/zh-TW/ -> chrome/zh-HK/");
