<div class="sidebar" id="sidebar">
	<div class="sidebar-inner slimscroll">
		<div id="sidebar-menu" class="sidebar-menu">
			<ul>
				<li>
				<a href="<?=base_url();?>"><img src="<?=base_url();?>assets/img/icons/dashboard.svg" alt="img"><span> Beranda</span> </a>
				</li>
				<?php if($level==11) { ?>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/product.svg" alt="img"><span> Berita </span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>artikel">Artikel</a></li>
				<li><a href="<?=base_url();?>wikipedia">Wikipedia</a></li>
				</ul>
				</li>
				<?php } ?>
              <?php if($level==11){ ?>
              	<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/product.svg" alt="img"><span> Setting Aplikasi</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>setting-tahun-ajaran">Tahun Ajaran</a></li>
				<li><a href="<?=base_url();?>setting-rombel">Rombel</a></li>
				<li><a href="<?=base_url();?>peserta-didik">Daftar Siswa</a></li>
				<li><a href="<?=base_url();?>tambah-siswa">Tambah Siswa</a></li>
				<li><a href="<?=base_url();?>hari-libur">Hari Libur</a></li>
				<li><a href="<?=base_url();?>shift-kerja">Pengaturan Jam Kerja</a></li>
				<li><a href="<?=base_url();?>pengguna">Daftar Pengguna</a></li>
				<li><a href="<?=base_url();?>ptk">Daftar PTK</a></li>
				<li><a href="<?=base_url();?>tambah-ptk">Tambah PTK</a></li>
				<li><a href="<?=base_url();?>id-pegawai">ID Pegawai</a></li>
				<li><a href="<?=base_url();?>absensi-pegawai">Absensi PTK</a></li>
				<li><a href="<?=base_url();?>penggajian">Sistem Gaji</a></li>
				<li><a href="<?=base_url();?>gaji-bulanan">Gaji Bulanan</a></li>
				</ul>
				</li>
				<?php } ?>
				<?php if($level==11) { ?>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/product.svg" alt="img"><span> Berita Acara</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>berita-acara">Berita Acara</a></li>
				</ul>
				</li>
				<?php } ?>
				<?php if($level==98 or $level==97 or $level==11){ ?>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/sales1.svg" alt="img"><span> Daftar Siswa</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>rombel">Kelasku</a></li>
                <li><a href="<?=base_url();?>whatsapp">Nomor Whatsapp</a></li>
				<?php if($level==11) { ?>
                <li><a href="<?=base_url();?>siswa-baru">Calon Siswa Baru</a></li>
				<li><a href="<?=base_url();?>penempatan">Penempatan</a></li>
				<?php } ?>
				<li><a href="<?=base_url();?>absensi">Absensi Siswa</a></li>
				</ul>
				</li>
				<?php } ?>
				<?php if($level==98 or $level==97 or $level==11){ ?>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/return1.svg" alt="img"><span> Data Isian Semester</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>kesehatan">Kesehatan</a></li>
				<li><a href="<?=base_url();?>prestasi">Prestasi</a></li>
				<li><a href="<?=base_url();?>ekstrakurikuler">Ekstrakurikuler</a></li>
				<li><a href="<?=base_url();?>saran-dan-pesan">Saran dan Pesan</a></li>
				<li><a href="<?=base_url();?>data-absensi">Data Absensi</a></li>
				</ul>
				</li>
				<?php } ?>
				<!-- Mulai Kurikulum -->
				<?php if($kurikulum=="Kurikulum 2013"){ ?>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/purchase1.svg" alt="img"><span> Administrasi Kelas</span> <span class="menu-arrow"></span></a>
				<ul>
				<?php if($level==98 or $level==97 or $level==11){ ?>
				<li><a href="<?=base_url();?>tema">Tema</a></li>
				<?php } ?>
				<li><a href="<?=base_url();?>kompetensi-dasar">Kompetensi Dasar</a></li>
				<li><a href="<?=base_url();?>pemetaan-kd">Pemetaan KD</a></li>
				<li><a href="<?=base_url();?>kkm">KKM</a></li>
				</ul>
				</li>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/expense1.svg" alt="img"><span> Penilaian Sikap</span> <span class="menu-arrow"></span></a>
				<ul>
				<?php if($level==96 or $level==11){ ?>
				<li><a href="<?=base_url();?>spiritual">Spiritual</a></li>
				<?php } ?>
				<?php if($level==98 or $level==97 or $level==11){ ?>
				<li><a href="<?=base_url();?>sosial">Sosial</a></li>
				<?php } ?>
				</ul>
				</li>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/quotation1.svg" alt="img"><span> Penilaian Harian</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>pengetahuan">Pengetahuan</a></li>
				<li><a href="<?=base_url();?>ketrampilan">Ketrampilan</a></li>
				</ul>
				</li>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/transfer1.svg" alt="img"><span> Penilaian Semester</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>penilaian-tengah-semester">Tengah Semester</a></li>
				<li><a href="<?=base_url();?>penilaian-akhir-semester">Akhir Semester</a></li>
				</ul>
				</li>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/users1.svg" alt="img"><span> Generate Rapor</span> <span class="menu-arrow"></span></a>
				<ul>
				<?php if($level==96 or $level==11){ ?>
				<li><a href="<?=base_url();?>rapor-spiritual">Rapor Spiritual</a></li>
				<?php } ?>
				<?php if($level==98 or $level==97 or $level==11){ ?>
				<li><a href="<?=base_url();?>rapor-sosial">Rapor Sosial</a></li>
				<?php } ?>
				<li><a href="<?=base_url();?>rapor-pengetahuan">Rapor Pengetahuan</a></li>
				<li><a href="<?=base_url();?>rapor-ketrampilan">Rapor Ketrampilan</a></li>
				</ul>
				</li>
				<?php if($level==98 or $level==97 or $level==11){ ?>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/places.svg" alt="img"><span> Cetak</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>cetak-rapor">Cetak Rapor</a></li>
				<li><a href="<?=base_url();?>rekap-rapor">Rekap Rapor</a></li>
				<li><a href="<?=base_url();?>laporan-perkembangan">Laporan Perkembangan</a></li>
				</ul>
				</li>
				<?php } ?>
				<?php } ?>
				<!--Mulai IKM-->
				<?php if($kurikulum=="Kurikulum Merdeka"){ ?>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/purchase1.svg" alt="img"><span> Administrasi Kelas</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>lingkup-materi">Lingkup Materi</a></li>
				<li><a href="<?=base_url();?>tujuan-pembelajaran">Tujuan Pembelajaran</a></li>
				</ul>
				</li>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/expense1.svg" alt="img"><span> Penilaian Harian</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>formatif">Formatif</a></li>
				<li><a href="<?=base_url();?>sumatif">Sumatif</a></li>
				</ul>
				</li>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/transfer1.svg" alt="img"><span> Penilaian Semester</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>sumatif-tengah-semester">Tengah Semester</a></li>
				<li><a href="<?=base_url();?>sumatif-akhir-semester">Akhir Semester</a></li>
				</ul>
				</li>
				<?php if($level==98 or $level==97 or $level==11){ ?>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/users1.svg" alt="img"><span> Rapor P5</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>input-proyek">Input Proyek</a></li>
				<li><a href="<?=base_url();?>pemetaan-proyek">Pemetaan Proyek</a></li>
				<li><a href="<?=base_url();?>penilaian-proyek">Penilaian Proyek</a></li>
				<li><a href="<?=base_url();?>cetak-rapor-p5">Cetak Rapor P5</a></li>
				</ul>
				</li>
				<?php } ?>
				<li class="submenu">
				<a href="javascript:void(0);"><img src="<?=base_url();?>assets/img/icons/users1.svg" alt="img"><span> Generate Rapor</span> <span class="menu-arrow"></span></a>
				<ul>
				<li><a href="<?=base_url();?>generate-rapor-ikm">Generate Rapor</a></li>
				<li><a href="<?=base_url();?>cetak-rapor-ikm">Cetak Rapor</a></li>
				<li><a href="<?=base_url();?>rekap-rapor-ikm">Rekap Rapor</a></li>
				</ul>
				</li>
				<?php } ?>
				
			</ul>
		</div>
	</div>
</div>