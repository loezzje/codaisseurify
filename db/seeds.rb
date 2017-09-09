


Artist.destroy_all
Song.destroy_all

pearl_jam = Artist.create!(name: "Pearl Jam")
muse = Artist.create!(name: "Muse")
metallica = Artist.create!(name: "Metallica")
lenny_kravitz = Artist.create!(name: "Lenny Kravitz")

Song.create!(name: "Black", artist: pearl_jam)
Song.create!(name: "Infallible", artist: pearl_jam)
Song.create!(name: "Alive", artist: pearl_jam)
Song.create!(name: "Even Flow", artist: pearl_jam)

Song.create!(name: "Absolution", artist: muse)
Song.create!(name: "Black Holes and Revelations", artist: muse)
Song.create!(name: "Psycho", artist: muse)
Song.create!(name: "Hysteria", artist: muse)

Song.create!(name: "Enter Sandman", artist: metallica)
Song.create!(name: "One", artist: metallica)
Song.create!(name: "Sad but True", artist: metallica)
Song.create!(name: "The Unforgiven", lartist: metallica)

Song.create!(name: "Are You Gonna Go My Way", artist: lenny_kravitz)
Song.create!(name: "American Woman", artist: lenny_kravitz)
Song.create!(name: "Fly Away", artist: lenny_kravitz)
Song.create!(name: "Let Love Rule", artist: lenny_kravitz)
