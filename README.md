# APINS-2023.a
Aplikasi Penilaian dan Informasi Nilai Siswa 2023.a
Ubah config.php yang ada di folder config sesuaikan alamat URL dengan alamat web
ubah settingan database pada db_connect.php dan db.php
ubah params di index.php
jika alamat nya http://localhost/apins
maka params[0] = localhost
params[1] = apins
ubah 
$halaman = $params[3];
$tipe = count($params)>4 ? $params[4] : '';
$act = count($params)>5 ? $params[5] : '';

menjadi 

$halaman = $params[2];
$tipe = count($params)>3 ? $params[3] : '';
$act = count($params)>4 ? $params[4] : '';

php versi 7.2

masuk menggunakan
username : faridah
password : 20258088
