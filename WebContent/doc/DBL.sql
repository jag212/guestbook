DROP TABLE modifytime CASCADE CONSTRAINTS;

DROP TABLE guestbook CASCADE CONSTRAINTS;

DROP SERIAL guest_seq;

CREATE TABLE guestbook(
seq integer NOT NULL,
email character varying(50),
[password] character varying(16),
content character varying(1000),
logtime datetime
) COLLATE iso88591_bin  REUSE_OID ;

CREATE TABLE modifytime(
seq integer,
moditime datetime
) COLLATE iso88591_bin  REUSE_OID ;

ALTER TABLE guestbook ADD CONSTRAINT pk PRIMARY KEY (seq);

ALTER TABLE modifytime ADD CONSTRAINT  guest_fk FOREIGN KEY (seq) REFERENCES guestbook(seq) ON DELETE CASCADE ON UPDATE RESTRICT;

CREATE SERIAL guest_seq START WITH 5 INCREMENT BY 1 MINVALUE 1 MAXVALUE 10000000000000000000000000000000000000 NOCYCLE NOCACHE;

COMMIT;