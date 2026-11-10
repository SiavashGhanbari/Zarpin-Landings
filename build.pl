# Assembles landing-builder.html from src/ (font, icons, logos are embedded).
sub rd{local $/;open my $f,"<",$_[0] or die $_[0];my $c=<$f>;$c=~s/\s+$//;$c}
my $h=rd("src/app.html");
my %r=("/*\@FONT\@*/"=>rd("src/font.css"),"/*\@ICONS\@*/"=>rd("src/icons.js"),"\@LOGO_BLACK\@"=>rd("src/logo-typo-black.txt"),"\@LOGO_WHITE\@"=>rd("src/logo-typo-white.txt"),"\@LOGO_GOLD\@"=>rd("src/logo-single-gold.txt"));
for my $k (keys %r){my $q=quotemeta $k; $h=~s/$q/$r{$k}/g}
open my $o,">","landing-builder.html";print $o $h;
