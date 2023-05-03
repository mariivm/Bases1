-- +FlywayNonRepeatable
insert into precioXpunto (unidadBase, precio, fechaInicial, fechaFinal, paisId,
checksum) values
(1,1000, '2023-01-01', '9999-12-12', 1,'checksum'),
(1,5000, '2023-01-01', '9999-12-12', 2, 'checksum'),
(1,4000, '2023-01-01', '9999-12-12', 3,'checksum'),
(1,3000, '2023-01-01', '9999-12-12', 4, 'checksum'),
(1,6000, '2023-01-01', '9999-12-12', 5, 'checksum');

insert into precioXkm (unidadBase, precio, fechaInicial, fechaFinal, paisId, checksum)
values
(1,10000, '2023-01-01', '9999-12-12', 1,'checksum' ),
(1,9000, '2023-01-01', '9999-12-12', 2, 'checksum'),
(1,11000, '2023-01-01', '9999-12-12', 3, 'checksum' ),
(1,8000, '2023-01-01', '9999-12-12', 4, 'checksum' ),
(1,12000, '2023-01-01', '9999-12-12', 5,'checksum' );