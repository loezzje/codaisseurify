


Artist.destroy_all
Song.destroy_all

pearl_jam = Artist.create!(name: "Pearl Jam")
muse = Artist.create!(name: "Muse")
metallica = Artist.create!(name: "Metallica")
lenny_kravitz = Artist.create!(name: "Lenny Kravitz")

Song.create!(name: "Black", length: 3.41, artist: pearl_jam)
Song.create!(name: "Infallible", length: 2.41, artist: pearl_jam)
Song.create!(name: "Alive", length: 3.50, artist: pearl_jam)
Song.create!(name: "Even Flow", length: 4.21, artist: pearl_jam)

Song.create!(name: "Absolution", length: 1.21, artist: muse)
Song.create!(name: "Black Holes and Revelations", length: 3.21, artist: muse)
Song.create!(name: "Psycho", length: 5.31, artist: muse)
Song.create!(name: "Hysteria", length: 2.34, artist: muse)

Song.create!(name: "Enter Sandman", length: 2.31, artist: metallica)
Song.create!(name: "One", length: 6.31, artist: metallica)
Song.create!(name: "Sad but True", length: 2.31, artist: metallica)
Song.create!(name: "The Unforgiven", length: 4.31, artist: metallica)

Song.create!(name: "Are You Gonna Go My Way", length: 5.21, artist: lenny_kravitz)
Song.create!(name: "American Woman", length: 8.53, artist: lenny_kravitz)
Song.create!(name: "Fly Away", length: 3.41, artist: lenny_kravitz)
Song.create!(name: "Let Love Rule", length: 4.32, artist: lenny_kravitz)
