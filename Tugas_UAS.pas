program PengelompokanNilaiSiswa;
uses crt;
type
Siswa = record
    nama: string;
    nilai: integer;
    kategori: char; // A, B, C, atau D untuk kategori nilai siswa
end;

var
    daftarSiswa: array[1..100] of Siswa;
    jumlahSiswa: integer;
    pilihan: integer;
    rataRata: real;
procedure MasukkanDataSiswa(); // untuk menginput data siswa dan langsung menklasifikasikan nilai siswa 
label 1;
var
    i: integer;
begin
    clrscr;
    write('Masukkan jumlah siswa: ');
    readln(jumlahSiswa);
    writeln('Masukkan data siswa:');
    for i := 1 to jumlahSiswa do
    begin
        clrscr;
        writeln('Siswa ', i, ':');
        write('     Nama   : ');
        readln(daftarSiswa[i].nama);
        1:
        write('     Nilai  : ');
        readln(daftarSiswa[i].nilai);

        if (daftarSiswa[i].nilai >= 85) and (daftarSiswa[i].nilai <= 100) then//85 - 100 = A
            daftarSiswa[i].kategori := 'A'
        else if (daftarSiswa[i].nilai >= 70) and (daftarSiswa[i].nilai < 85) then//70 - 85 = B
            daftarSiswa[i].kategori := 'B'
        else if (daftarSiswa[i].nilai >= 50) and (daftarSiswa[i].nilai < 70) then//50 - 70 = C
            daftarSiswa[i].kategori := 'C'
        else if (daftarSiswa[i].nilai >= 0) and (daftarSiswa[i].nilai < 50) then//0 - 50 = D
            daftarSiswa[i].kategori := 'D' 
        else 
            begin 
                writeln;
                writeln('           INPUT TIDAK VALID!!');//selain dari 1 - 100 dianggap tidak valid
                writeln('Masukkan input nilai dengan benar (1 - 100)');//user dipaksa untuk menginput nilai dengan benar
                goto 1;
            end;
    end;
end;

function HitungRataRata(): real; //Menghitung rata rata dari seluruh inputan nilai siswa
var
    i, totalNilai: integer;
begin
    clrscr;
    totalNilai := 0;
    for i := 1 to jumlahSiswa do
    begin
        totalNilai := totalNilai + daftarSiswa[i].nilai;
    end;
    HitungRataRata := totalNilai / jumlahSiswa;
end;

procedure TampilkanKelompok(); //untuk menampilkan data siswa dengan nilai yang sudah dikelompokan
var
    i: integer;
begin
    clrscr;
    writeln('Kelompok Nilai:');
    writeln('A (85 - 100):');
    for i := 1 to jumlahSiswa do
        if daftarSiswa[i].kategori = 'A' then
            writeln('  ', daftarSiswa[i].nama);

    writeln('B (70 - 84):');
    for i := 1 to jumlahSiswa do
        if daftarSiswa[i].kategori = 'B' then
            writeln('  ', daftarSiswa[i].nama);

    writeln('C (50 - 69):');
    for i := 1 to jumlahSiswa do
        if daftarSiswa[i].kategori = 'C' then
            writeln('  ', daftarSiswa[i].nama);

    writeln('D (< 50):');
    for i := 1 to jumlahSiswa do
        if daftarSiswa[i].kategori = 'D' then
            writeln('  ', daftarSiswa[i].nama);
end;

begin //main program
    clrscr;
    jumlahSiswa := 0;

    repeat
        writeln('==== Sistem Pengelompokan Nilai Siswa ====');
        writeln('1. Masukkan Data Siswa');
        writeln('2. Hitung Rata-Rata Nilai');
        writeln('3. Tampilkan Kelompok Siswa');
        writeln('4. Keluar'); //tampilan untuk pilihan ingin menginput atau rata rata atau menampilkan data siswa yang sudah dikelompokan
        write('Pilihan Anda: ');
        readln(pilihan);

        case pilihan of
            1: MasukkanDataSiswa();//memulai sub program untuk menginput
            2: begin
                    rataRata := HitungRataRata();
                    writeln('Rata-rata nilai siswa: ', rataRata:0:2);// rata rata dari semua nilai siswa
               end;
            3: TampilkanKelompok(); //memulai sub program untuk menampilan data siswa sesuai dengan pengelompokannya
        end;

        writeln;
    until pilihan = 4;

    writeln('Terima kasih telah menggunakan program ini.');
end.