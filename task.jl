dir = dirname(dirname(@__DIR__))

src = "$dir/Research/Data/INDAQ/plots/index.html"
dst = "$dir/Web/lognitilab.github.io/assets/plotly/index.html"
cp(src, dst, force=true)
run(`git -C $dir/Web/lognitilab.github.io add $dst`)
run(`git -C $dir/Web/lognitilab.github.io commit -m "update index.html"`)
run(`git -C $dir/Web/lognitilab.github.io push origin main`)

src = "$dir/Research/Data/INDAQ/plots/level.html"
dst = "$dir/Web/lognitilab.github.io/assets/plotly/level.html"
cp(src, dst, force=true)
run(`git -C $dir/Web/lognitilab.github.io add $dst`)
run(`git -C $dir/Web/lognitilab.github.io commit -m "update level.html"`)
run(`git -C $dir/Web/lognitilab.github.io push origin main`)

src = "$dir/Research/Data/INDAQ/plots/pollutant.html"
dst = "$dir/Web/lognitilab.github.io/assets/plotly/pollutant.html"
cp(src, dst, force=true)
run(`git -C $dir/Web/lognitilab.github.io add $dst`)
run(`git -C $dir/Web/lognitilab.github.io commit -m "update pollutant.html"`)
run(`git -C $dir/Web/lognitilab.github.io push origin main`)