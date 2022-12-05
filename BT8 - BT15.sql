--Cau 8
SELECT GIA
FROM SANPHAM
WHERE GIA >= 500

--Cau 9
SELECT MAKH, SL
FROM HOADON, CTHD
WHERE HOADON.SOHD = CTHD.SOHD AND SL >= 1

--Cau 10
SELECT MAKH, NGSINH, NGDK
FROM KHACHHANG
WHERE YEAR(NGDK) > YEAR(NGSINH)

--Cau 11
SELECT KHACHHANG.MAKH, NGHD, NGDK
FROM KHACHHANG, HOADON
WHERE KHACHHANG.MAKH = HOADON.MAKH AND DAY(NGDK) <= DAY(NGHD)

--Cau 12
SELECT NHANVIEN.MANV, NGHD, NGVL
FROM NHANVIEN, HOADON
WHERE NHANVIEN.MANV = HOADON.MANV AND DAY(NGVL) <= DAY(NGHD)

--Cau 13
SELECT HOADON.SOHD
FROM HOADON, CTHD
WHERE HOADON.SOHD = CTHD.SOHD

--Cau 14
DECLARE @tong float
SET @tong = (SELECT SL * GIA FROM CTHD, SANPHAM)
SELECT HOADON.SOHD, @tong AS 'TONG THANH TIEN'
FROM HOADON, CTHD
WHERE HOADON.SOHD = CTHD.SOHD

--Cau 15
DECLARE @ds FLOAT
SET @ds = (SELECT SUM(TRIGIA) FROM HOADON)
SELECT KHACHHANG.MAKH, SOHD, @ds AS 'DOANH SO'
FROM HOADON, KHACHHANG
WHERE KHACHHANG.MAKH = HOADON.MAKH