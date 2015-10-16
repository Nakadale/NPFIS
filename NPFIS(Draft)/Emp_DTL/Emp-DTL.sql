CREATE TABLE emp_dtl (
   EMP_ID CHAR(7), 
   SEX_C CHAR(1), 
   CIVIL_STAT CHAR(1), 
   MAIDEN_M CHAR(25), 
   SPOUSE_M CHAR(35), 
   SPOUSE_OCC CHAR(20), 
   TIN CHAR(11), 
   GSIS_POL_N CHAR(15), 
   CITIZEN CHAR(10), 
   BIRTH_DATE DATETIME, 
   BIRTH_MUN CHAR(30), 
   BIRTH_PROV CHAR(30), 
   HEIGHT DECIMAL, 
   WEIGHT DECIMAL, 
   ADDR_ST CHAR(50), 
   ADDR_MUN CHAR(30), 
   ADDR_PROV CHAR(30), 
   TEL_NO CHAR(15), 
   FATHER_M CHAR(35), 
   FATHER_DB DATETIME, 
   FATHER_PB CHAR(30), 
   MOTHER_M CHAR(35), 
   MOTHER_DB DATETIME, 
   MOTHER_PB CHAR(30), 
   DATE_HIRED DATETIME, 
   FIRST_DAY DATETIME, 
   FDAY_MM INTEGER, 
   FDAY_DD INTEGER, 
   FDAY_YY INTEGER, 
   PAY_IND INTEGER, 
   SPCL_SKILL CHAR(100), 
   OTHERS CHAR(100), 
   BLOOD_T CHAR(3), 
   PAG_IBIG CHAR(15), 
   PH_NO CHAR(15), 
   CEL_NO CHAR(15), 
   EMAIL CHAR(25), 
   PADDR_ST CHAR(50), 
   PADDR_MUN CHAR(30), 
   PADDR_PROV CHAR(30), 
   PTEL_NO CHAR(15), 
   PAR_ADD CHAR(100), 
   ADDR_ZP CHAR(10), 
   PADDR_ZP CHAR(10), 
   F_FIRST CHAR(25), 
   F_MIDDLE CHAR(25), 
   F_LAST CHAR(25), 
   M_FIRST CHAR(25), 
   M_MIDDLE CHAR(25), 
   M_LAST CHAR(25), 
   S_FIRST CHAR(25), 
   S_MIDDLE CHAR(25), 
   S_LAST CHAR(25), 
   BUS_NAME CHAR(30), 
   BUS_ADD CHAR(50), 
   BUS_TEL CHAR(15), 
   GSIS_ID_NO CHAR(15), 
   SSS_NO CHAR(15), 
   RELIGION CHAR(50), 
   EYE_COLOR CHAR(20), 
   HAIR_COLOR CHAR(20), 
   O_ID_DATA CHAR(50), 
   RMC CHAR(100), 
   ICE_NAME CHAR(100), 
   ICE_ADD CHAR(100), 
   ICE_NO CHAR(25));

INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0018", "2", "2", "", "Lourdes A. Africa", "housewife", "125-235-483", "", "FILIPINO", "15/6/1960", "GERONA", "TARLAC", 1.65, 85, "Poblacion #1", "Gerona", "Tarlac", "", "JACINTO AFRICA", "30/12/1899", "MONCADA, TARLAC", "EVALINA CRUZ AFRICA", "30/12/1899", "GERONA, TARLAC", "1/10/1988", "18/8/1980", 0, 0, 0, 0, "SURVEYING AIDE, MAGNETIC OBSERVATORY OBSERVER", "BUKOD KABATAAN ASSN. BASKETBALL,VOLLEYBALL", "AB", "0002193757-05", "19000431470-4", "", "", "same as above", "", "", "", "", "2302", "", "Evangelina", "Tabago", "Cruz", "Jacinta", "Layno", "Africa", "Lourdes", "Navarro", "Angeles", "", "", "", "B60LFMCA012", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0022", "1", "2", "Agosto", "Buenaventura Reyes,Jr.", "I.T.", "125-235-521", "Cm 285842", "Filipino", "23/4/1965", "Caoayan", "Ilocos Sur", 1.65, 65, "18 B Chesa St. Zone 1 Signal Village", "Taguig", "Metro, Manila", "", "Andres Agosto", "30/12/1899", "Ilocos Sur", "Asuncion Quevada", "30/12/1899", "Ilocos Sur", "1/10/1988", "25/5/1982", 0, 0, 0, 1, "word processing, typing, filing", "bowling, volleyball,swimming", "O", "000219376005", "19-000677806-6", "", "eqareyes@yahoo.com", "General Luna St.", "Sariaya", "Quezon", "", "Manangat, Caoayan, Ilocos Sur", "", "", "Andres", "Naungayan", "Agosto", "Aparicion", "Aslor", "Quibada", "Buenaventura,Jr.", "Lacopia", "Reyes", "Accenture", "", "", "B665042300246", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0025", "2", "2", "", "Marcelina Aguilar", "Housewife", "125-235-562", "", "Filipino", "8/4/1962", "", "Baguio City", 1.6, 47, "37 Upper Mkt. Subdivision, Camp Allen", "Baguio City", "", "", "Bonifacio Aguilar", "30/12/1899", "La Union", "Concordia Aguilar", "30/12/1899", "La Union", "1/10/1988", "1/7/1986", 7, 1, 86, 1, "surveying, plotting, mapping, typing", "singing,basketball,darts,table tennis,chess", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0026", "1", "2", "Zorayda Lagnada", "Evaristo Aguilar", "Electrical Engineer", "125-235-570", "", "Filipino", "19/11/1962", "", "Quezon City", 1.55, 50, "B14 L39 Molino Homes II", "Salitran III, Dasmari帶s", "Cavite", "", "Antonio Lagnada (Deceased)", "30/12/1899", "Cebu City", "Teresita Lagnada", "30/12/1899", "Dagupan City", "1/10/1988", "1/7/1987", 0, 0, 0, 0, "Estimating, drafting, sketching, typing", "Playing guitar, swimming, dancing, cooking", "B", "", "19-000419680-9", "", "", "same as above", "", "", "", "", "", "", "deceased", "", "", "Teresita", "Mamayson", "Soriano", "Evaristo,Jr.", "Nebrida", "Aguilar", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0041", "2", "2", "", "Beatriz N Algaba", "Housekeeper", "125-235-731", "", "Filipino", "21/11/1955", "", "Zambales", 1.7, 65, "Cantoria 2, Luna,", "La Union", "", "", "Martin A. Algaba", "30/12/1899", "Zambales", "Fausta Algaba", "30/12/1899", "Pangasinan", "1/10/1988", "18/8/1980", 0, 0, 0, 0, "GPS Observations & Data Processing,", "Magnetic & solar observations, writer", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0043", "2", "2", "", "Aile Alim", "Housekeeper", "125-235-764", "LP58060800217", "Filipino", "8/6/1958", "Tondo", "Manila", 1.62, 54, "309 G. Simon St", "Tondo", "Manila", "none", "Jose Alim (deceased)", "30/12/1899", "Sorsogon", "Eva Alim", "30/12/1899", "Albay", "1/10/1988", "16/1/1978", 1, 16, 78, 1, "refrigeration,airconditioning,electricals", "basketball, swimming,singing,playing guitar", "O", "0002193777-10", "19-000420636-7", "", "", "same as above", "", "", "", "", "1013", "", "deceased", "", "", "Eva", "Iba庸z", "Millabas", "Aile", "Abarca", "Alim", "", "", "", "B58L8AMA019", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0044", "2", "2", "", "", "Housewife", "125-235-780", "CM 148138", "Filipino", "31/8/1961", "Paete", "Laguna", 1.7, 84, "Blk. 4 Lot 25 Carissa Homes II", "Teresa", "Rizal", "", "Melchor Almeda Sr (deceased)", "30/12/1899", "Paete, Laguna", "Eldifonsa Santos", "30/12/1899", "Tanay, Rizal", "1/10/1988", "16/6/1982", 6, 16, 82, 1, "offset press operations, cutting machine operation", "swimming, basketball", "AB", "102001287990", "19-000429498-3", "09153428962", "", "same as above", "", "", "", "", "1880", "", "Melchor, Sr.", "Bagayan", "Almeda", "Ildefonsa", "Santos", "Almeda", "Ronelyn", "Poguy", "Almeda", "", "", "", "61083100264", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0055", "2", "2", "", "Leonila Isla", "Housewife", "125-235-889", "", "Filipino", "29/12/1952", "Tondo", "Manila", 1.6, 48, "753 Int.22 Raxabago Street", "Tondo", "Manila", "", "Hilarion Ampil", "30/12/1899", "Manila", "Teofila Gonzales", "30/12/1899", "Tarlac", "1/10/1988", "24/10/1972", 10, 24, 72, 1, "Cartographic work, surveying, typing", "basketball, chess", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0057", "2", "2", "", "Herminia Buan", "C.E. Draftsman", "125-235-898", "", "Filipino", "18/7/1949", "", "Manila", 1.57, 56, "2858-J Aurora Blvd", "Sta. Cruz", "Manila", "711-14-08", "Leonarda Andres", "30/12/1899", "Nueva Ecija", "Basilisa Arenas", "30/12/1899", "Nueva Ecija", "1/10/1988", "17/12/1985", 12, 17, 85, 1, "Cartographic works, charting, remote sensing works", "art works, drafting construction plan", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0064", "1", "2", "Delia Cueva", "Edgar Antonio", "Gov't Employee", "125-235-985", "", "Filipino", "15/5/1954", "Bagamanoc", "Catanduanes", 1.57, 45, "Blk. 30 Lot 9 Phase 2, Mabuhay Homes 2000", "Paliparan 2, Dasmari帶s", "Cavite City", "", "Juan Cueva", "30/12/1899", "Catanduanes", "Serafina Villamor", "30/12/1899", "Catanduanes", "1/10/1988", "21/4/1983", 4, 1, 83, 1, "typing", "Member, Ladies Club", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0067", "1", "1", "", "", "", "125-236-041", "", "Filipino", "27/7/1967", "", "Pasay City", 1.52, 41, "2 Aguilar St. Santos Vill Zapote", "Las Pinas", "Metro Manila", "none", "Mariano Aquiler", "30/12/1899", "Camarines Sur", "Lourdes Aquiler (deceased)", "30/12/1899", "Camarines Sur", "1/10/1988", "1/12/1988", 12, 1, 88, 1, "Computer maintenance, typing, driving", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0072", "2", "1", "", "", "none", "125-236-092", "LP60011001095", "Filipino", "10/1/1960", "Pulilan", "Bulacan", 1.63, 60, "47 Tibag", "Pulilan", "Bulacan", "50-59-91", "Prudencio Arceo", "30/12/1899", "Bulacan", "Librada Cueto", "30/12/1899", "Bulacan", "1/10/1988", "1/6/1982", 0, 0, 0, 0, "Plate-making, offset operator                    P", "Playing basketball", "O", "0002193800-08", "19-000429708-7", "", "", "same as above", "", "", "", "", "", "", "Prudencio", "De Guzman", "Arceo", "Librada", "", "Arceo", "Rowena", "Talucad", "Arceo", "", "", "", "60011001095", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0088", "2", "2", "", "Raquel Aida Azucena", "Housewife", "125-236-284", "247361", "Filipino", "8/11/1961", "San Pablo City", "Laguna", 1.57, 50, "#175 Dona Emiliana St., Teomora Vill.", "Subd.,", "San Pablo City", "049 562-46-30", "Cleodoveo A. Azucena (deceased)", "30/12/1899", "Laguna", "Ester C. Azucena (deceased)", "30/12/1899", "Batangas", "1/10/1988", "17/10/1983", 10, 17, 83, 1, "Repairs of computers", "", "O", "0002-193822-09", "19-000420228-0", "0919 4034392", "ced@namria.gov.ph", "# 175 Do帶 Emiliana St.", "Teomora Village", "San Pablo City", "049-562-46-30", "", "4000", "4000", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0089", "1", "1", "", "", "", "125-236-293", "292281", "Filipino", "5/12/1960", "", "Caloocan City", 1.62, 55, "NAMRIA Staffhouse", "Lawton Ave.", "Ft. Bonifacio, Tagui", "4302266", "Magno Montoya", "30/12/1899", "Pampanga", "Perseveranda Baltazar", "30/12/1899", "Nueva Ecija", "1/10/1988", "7/10/1981", 8, 1, 83, 1, "Dental works", "cooking, playing piano", "B", "000297727209", "100004201861", "", "", "Blk. 9 Lot 48 Witholding St. BIR Village", "West Fairview", "Quezon City", "43012266", "", "1201", "1118", "deceased", "", "", "BErnardita", "Amante", "Guillen", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0100", "2", "2", "", "Alma Campasano", "Housekeeper", "143056319", "", "Filipino", "21/3/1956", "Balanga", "Bataan", 1.67, 72, "Blk. 99 Lot 13 J. P. Rizal St", "Brgy. Rizal", "Nakati City", "", "Bienvenido Baluyot", "30/12/1899", "Balanga, Bataan", "Aurora Vosotros", "30/12/1899", "Tabaco, Albay", "1/10/1988", "1/4/1981", 4, 1, 81, 0, "Paper cutter operator,folding machine operator", "chess, bowling", "O", "000219383903", "19000429204-2", "", "", "same as above", "", "", "", "", "", "", "Bienvinido", "Banzon", "Baluyot", "Aurora", "Borromeo", "Baluyot", "Alma", "Camposano", "Baluyot", "", "", "", "56032100746", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0132", "2", "2", "", "MA. ANGELICA R. BESANA", "Self Employed", "143056368", "CM 667801", "FILIPINO", "3/3/1958", "SAN JUAN", "METRO. MANILA", 1.64, 72, "23 J. BASA ST.", "SAN JUAN", "METRO. MANILA", "7213330", "DECEASED", "30/12/1899", "", "ROSARIO A. BESANA", "30/12/1899", "CAVITE", "1/10/1988", "1/1/1977", 1, 1, 77, 0, "CONTACT PRINTING, PROCESS CAMERA OPERATION", "READING, WATCHING T.V.", "B", "0002193870-09", "19-00429305-7", "", "", "same as above", "", "", "", "", "", "", "Melchor", "Bulilan", "Besana", "Rosario", "Del Rosario", "Alcantara", "Ma. Angelica", "Delos Reyes", "Besana", "Charings Meat Shop", "San Juan M.M.", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0140", "2", "2", "", "Cepriana Borja", "Housewife", "125-236-890", "", "Filipino", "26/1/1953", "", "Zamboanga del Sur", 1.7, 50, "46-A Tirona St.", "Proj. 4", "Q. C.", "none", "Joaguin Borja", "30/12/1899", "Abra", "Estrella Bergado", "30/12/1899", "Negros Occ.", "1/10/1988", "20/6/1974", 0, 0, 0, 0, "Map drafting, screen printing, use of carto. tools", "Member- PNCA, PAMEE, SAGE, PSME", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0143", "2", "2", "", "Armi-Corazon Braganza", "C.P.A.", "125-236-912", "", "Filipino", "23/12/1955", "Lingayen", "Pangasinan", 1.65, 60, "19 Gardenia St.,Don Aguedo Bernabe Subd,", "San Antonio,", "Paranaque, Metro Manila", "", "Perfecto Braganza", "30/12/1899", "Pangasinan", "Clarita Braganza", "30/12/1899", "Pangasinan", "1/10/1988", "2/2/1979", 0, 0, 0, 0, "Project Planning Mgt.;Forest land surveying", "Bowling; driving", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0147", "2", "2", "", "Ruby Bungue", "Housewife", "125-236-961", "LP58122100365", "Filipino", "21/12/1958", "Mobo", "Masbate", 1.55, 55, "38 Road 1,", "Pag-asa", "Quezon City", "95-15-45", "Sancino Bungue", "30/12/1899", "Masbate", "Perpetua Bungue", "30/12/1899", "Masbate", "1/10/1988", "1/2/1982", 0, 0, 0, 0, "Scribing, auto mechanic", "Reading books", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0151", "2", "2", "", "Clara Fe Serquina", "Nurse", "138599968", "CM616607", "Filipino", "31/1/1956", "San Nicolas", "Pangasinan", 1.72, 75, "B57 Lot28 Misa de Gallo St. Lagro Subd.", "Novaliches", "Q. C.", "8899944", "Jose A. Cabanayan (deceased)", "30/12/1899", "Pangasinan", "Crisanta Callanta", "30/12/1899", "Pangasinan", "1/10/1988", "1/6/1977", 0, 0, 0, 0, "Aerial photo inter., photogrammetry & geodesy", "Basic computer programming; swimming", "O", "102001449980", "19000429948-9", "09173411255", "jccabanayan@yahoo.com", "same as above", "", "", "", "", "1118", "", "Jose", "Alcantara", "Cabanayan,Sr.", "Crisanta", "Paroni", "Callanta", "Clara Fe", "S.", "Cabanayan", "Bronx Lebanon Hospital", "New York, USA", "", "CRN0000994965-8", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0154", "2", "2", "", "Esper Cabilan", "Housewife", "125-237-025", "", "Filipino", "16/9/1962", "", "Mindanao", 1.68, 67, "Blk. 2 Row 7 Unit 240 Habitat", "Baseco Port Area", "Manila", "", "Pascual Cabilan", "30/12/1899", "Leyte", "Juanita Cabilan", "30/12/1899", "Mindanao", "1/10/1988", "1/8/1985", 0, 0, 0, 0, "Drawing and printing", "", "AB", "0002193892-10", "19-200584418-1", "", "", "same as above", "", "", "", "", "1018", "", "Ma. Vilma", "Alejan", "Cabilan", "Juanita", "Mantowa", "Galano", "Ma. Vilma", "Alejan", "Cabilan", "", "", "", "B62SGEGC012", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0161", "2", "2", "", "Cresencia T. Cadiente", "Employee", "125-237-082", "lp59071101155", "Filipino", "11/7/1959", "Makati", "Metro Manila", 1.7, 67, "7352 Adalla St.", "Makati", "Metro Manila", "", "Mariano A. Cadiente", "30/12/1899", "Ilocos Norte", "Nena C. Cadiente", "30/12/1899", "Jaro, Leyte", "1/10/1988", "1/2/1986", 2, 3, 86, 0, "Basic EDP, Flowcharting Proficiency, Cobol, Driving, Drafting, Typing", "Basketball, Cycling, Computer games, Movies, Shopping", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0172", "2", "2", "", "Marjorie Magat", "Gov't. Employee", "125-237-187", "", "Filipino", "19/8/1960", "Jones", "Isabela", 1.6, 87, "", "Centro Jones", "Isabela", "", "Simeon B. Caluya", "30/12/1899", "Isabela", "Eugenia A. Caluya", "30/12/1899", "Isabela", "1/10/1988", "2/8/1982", 3, 1, 83, 0, "Surveying, mapping", "Member-Phil. Society of Photogrammetry", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0175", "2", "2", "", "Flor J. Campana", "Employee", "125-237-218", "", "Filipino", "5/12/1951", "", "Manila", 6.76, 544, "56 Road 13", "Pag-asa", "Quezon City", "", "Rodolfo Campana", "30/12/1899", "Manila", "Lucila Tagle Campana", "30/12/1899", "Manila", "1/10/1988", "1/7/1976", 7, 1, 76, 0, "Driver, Plate Printer, Offset Press Operator", "BCGS Credit Union", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0200", "1", "1", "", "", "", "125-237-419", "", "Filipina", "22/8/1960", "", "Manila", 1.55, 50, "88 Road 1 Pag-asa", "Quezon City", "", "927-83-76", "Oliver F.Castro", "30/12/1899", "Pampanga", "Belen T. Castro", "30/12/1899", "Manila", "1/10/1988", "1/4/1982", 4, 1, 82, 0, "Stereo plotting, photo interpretation,surveying", "Phil.Inst.of Civil Eng'r, Nat'l Asso. of MAPUA Alu", "A""", "0002-193929-02", "", "0916-479-6661", "ephie_castro@yahoo.com", "#88 Road 1 Pag-asa", "Quezon City", "", "", "", "", "", "Oliver (deceased)", "Fajardo", "Castro", "Belen (deceased)", "De Leon", "Castro", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
INSERT INTO emp_dtl
  (EMP_ID, SEX_C, CIVIL_STAT, MAIDEN_M, SPOUSE_M, SPOUSE_OCC, TIN, GSIS_POL_N, CITIZEN, BIRTH_DATE, BIRTH_MUN, BIRTH_PROV, HEIGHT, WEIGHT, ADDR_ST, ADDR_MUN, ADDR_PROV, TEL_NO, FATHER_M, FATHER_DB, FATHER_PB, MOTHER_M, MOTHER_DB, MOTHER_PB, DATE_HIRED, FIRST_DAY, FDAY_MM, FDAY_DD, FDAY_YY, PAY_IND, SPCL_SKILL, OTHERS, BLOOD_T, PAG_IBIG, PH_NO, CEL_NO, EMAIL, PADDR_ST, PADDR_MUN, PADDR_PROV, PTEL_NO, PAR_ADD, ADDR_ZP, PADDR_ZP, F_FIRST, F_MIDDLE, F_LAST, M_FIRST, M_MIDDLE, M_LAST, S_FIRST, S_MIDDLE, S_LAST, BUS_NAME, BUS_ADD, BUS_TEL, GSIS_ID_NO, SSS_NO, RELIGION, EYE_COLOR, HAIR_COLOR, O_ID_DATA, RMC, ICE_NAME, ICE_ADD, ICE_NO)
VALUES
  ("88-0203", "2", "1", "", "", "", "125-237-435", "", "Filipino", "22/6/1963", "Narra", "Palawan", 1.71, 67, "60 K-1st Street", "Kamuning", "Quezon City", "", "Eladio Catapang", "30/12/1899", "Batanes", "Rita Catapang", "30/12/1899", "Quezon", "1/10/1988", "9/1/1984", 1, 9, 84, 0, "Topography, hydrography, leveling, triangulation", "U.E.Alumni Asso., COSOA, Chess, basketball,Sball", "AB", "000219393104", "19-000430996-4", "", "", "", "", "", "", "", "", "", "Eladio", "Ilao", "Catapang", "Rita", "Due帶s", "Lacerna", "", "", "", "", "", "", "63062200032", "", "", "", "", "", "", "", "", "");

COMMIT;

