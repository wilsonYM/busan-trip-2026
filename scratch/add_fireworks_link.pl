use strict;
use warnings;

my $file = 'index.html';
open my $fh, '<:raw', $file or die "Cannot open $file: $!";
my $content = do { local $/; <$fh> };
close $fh;

# Target the action buttons in D4-4 card:
my $target = q{            <div class="flex gap-2 pt-1">
              <a href="https://maps.app.goo.gl/4jXF3bVpKU2MtBty7" target="_blank" class="flex-1 bg-blue-600 hover:bg-blue-500 text-white text-xs font-bold py-2 rounded-lg text-center flex items-center justify-center gap-1">
                <i class="fa-solid fa-map-location-dot"></i> Google Maps
              </a>
              <a href="https://naver.me/xzxmzK1j" target="_blank" class="flex-1 bg-emerald-600 hover:bg-emerald-500 text-white text-xs font-bold py-2 rounded-lg text-center flex items-center justify-center gap-1">
                <i class="fa-solid fa-compass"></i> Naver Map
              </a>
            </div>};

my $replacement = q{            <!-- 2026 釜山國際煙火節 官方節目時程表連結 -->
            <a href="https://busanfireworks.com/program/schedule.php" target="_blank" class="w-full bg-gradient-to-r from-amber-400 via-orange-400 to-amber-300 hover:from-amber-300 hover:to-orange-300 text-slate-950 font-black text-xs py-2 px-3 rounded-xl flex items-center justify-center gap-1.5 shadow-md transition-all active:scale-[0.98]">
              <i class="fa-solid fa-fire text-rose-600"></i>
              <span>釜山國際煙火節 官方完整節目表 (點此開啟)</span>
              <i class="fa-solid fa-arrow-up-right-from-square text-[10px] ml-1"></i>
            </a>

            <div class="flex gap-2 pt-1">
              <a href="https://maps.app.goo.gl/4jXF3bVpKU2MtBty7" target="_blank" class="flex-1 bg-blue-600 hover:bg-blue-500 text-white text-xs font-bold py-2 rounded-lg text-center flex items-center justify-center gap-1">
                <i class="fa-solid fa-map-location-dot"></i> Google Maps
              </a>
              <a href="https://naver.me/xzxmzK1j" target="_blank" class="flex-1 bg-emerald-600 hover:bg-emerald-500 text-white text-xs font-bold py-2 rounded-lg text-center flex items-center justify-center gap-1">
                <i class="fa-solid fa-compass"></i> Naver Map
              </a>
            </div>};

if (index($content, $target) == -1) {
    die "Target not found in index.html";
}

$content =~ s/\Q$target\E/$replacement/;

open my $out, '>:raw', $file or die "Cannot write $file: $!";
print $out $content;
close $out;

print "SUCCESS: Added fireworks schedule link to D4-4!\n";

