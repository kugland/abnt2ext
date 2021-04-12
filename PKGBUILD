pkgname=abnt2-ext
pkgver=2.1.1
pkgrel=1
pkgdesc="ABNT2 extended keyboard"
arch=(any)
url="https://github.com/kugland/abnt2-ext-arch"
license=('GPL')
depends=(xkeyboard-config)
source=(abnt2_ext)
install=abnt2-ext.install
md5sums=(SKIP)

package() {
  cd "$srcdir/"

  install -D -m 644 -o root -g root abnt2_ext "$pkgdir/usr/share/X11/xkb/symbols/abnt2_ext"
}
