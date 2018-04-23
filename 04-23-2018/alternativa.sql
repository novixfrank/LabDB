CREATE OR REPLACE TRIGGER scuderia_gen_pk
    BEFORE INSERT ON scuderia
    FOR EACH ROW
BEGIN
    IF :NEW.id_s IS NULL THEN
        :NEW.id_s := scuderia_autoinc.NEXTVAL;
    END IF;
END;
