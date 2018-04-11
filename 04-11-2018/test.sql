CREATE TABLE test_no_pk (
    cod1 NUMBER(1),
    cod2 NUMBER(1)
);

CREATE TABLE test_mul_pk (
    cod1 NUMBER(1),
    cod2 NUMBER(1),
    CONSTRAINT test_mul_pk_pk PRIMARY KEY (cod1, cod2)
);
