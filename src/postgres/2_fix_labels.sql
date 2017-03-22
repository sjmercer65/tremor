/*table accel_dem contains the demographic information associated with
accelerometer data (in another table) by healthCode

updating datagroup labels where they were missing
from some but not all records for this healthcode

the SQL below auto-generates SQL to update missing healthcodes
(included here to show how the script below was generated)
use \o out.sql to save the SQL-fomatted output to a file.

SELECT healthcode, 'UPDATE accel_dem SET datagroups = ', datagroups, ' WHERE recordid =', recordId, ';' FROM accel_dem WHERE healthcode IN (SELECT healthcode FROM accel_dem GROUP BY healthcode HAVING COUNT(recordId) > 1) ORDER BY healthcode ASC;
*/

 update accel_dem set datagroups = 'parkinson'  where recordid = '43bc5de9-2737-4973-93d5-be53d9fcefac';
 update accel_dem set datagroups = 'parkinson'  where recordid = '6e4157a2-bf0d-4770-b2f4-91153c63bdce';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'c709d3fe-00d4-42f7-a68f-ea1154011d60';
 update accel_dem set datagroups = 'parkinson'  where recordid = '2ed2fb24-171a-4b48-96cc-d8abdd4b69bc';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'da4e2fca-a2a4-4904-bf71-f81a3180bfd8';
 update accel_dem set datagroups = 'parkinson'  where recordid = '0c93503d-ac4d-46f0-9779-09435f9b9e54';

 update accel_dem set datagroups = 'control'  where recordid = '8983adbb-0dfd-4da3-9267-77ed3138b1fc';
 update accel_dem set datagroups = 'control'  where recordid = 'b3e49cef-780a-43ee-b3d6-7dffae4c735f';

 update accel_dem set datagroups = 'control'  where recordid = 'e35dbfbd-edd5-4079-b315-99e713d239f5';
 update accel_dem set datagroups = 'control'  where recordid = '89751994-040c-44b8-b0d6-438b9345f24e';
 update accel_dem set datagroups = 'control'  where recordid = '8e67fee2-fa2c-4be5-827d-43dcf22e38d4';

 update accel_dem set datagroups = 'control'  where recordid = '4332bb1b-88fa-4da0-9289-560986ecc638';
 update accel_dem set datagroups = 'control'  where recordid = 'b3c153cb-8c27-46be-808f-3b766d7b0302';

 update accel_dem set datagroups = 'parkinson'  where recordid = '5d85767e-e44b-407f-9013-b65b6c323657';
 update accel_dem set datagroups = 'parkinson'  where recordid = '23558e6c-9672-40de-8259-5b616cd473a0';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'a99e712b-942a-4911-843a-ede8c556dbb7';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'e959f9f6-6cb1-4f3a-80ca-b2c2b50adfe4';
 update accel_dem set datagroups = 'parkinson'  where recordid = '3c7ab6f5-1d08-40bc-b8fd-4937594f5408';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'fdff07ca-431e-4d2e-811e-a76a6bab30a5';
 update accel_dem set datagroups = 'parkinson'  where recordid = '70726df5-fac8-4ac1-869e-444489ebb057';
 update accel_dem set datagroups = 'parkinson'  where recordid = '9a1210e5-2001-4c5d-a7b5-1e3a323857e1';

 update accel_dem set datagroups = 'control'  where recordid = '9be3a985-241b-4eb1-bd95-5f298c084f9b';
 update accel_dem set datagroups = 'control'  where recordid = '7ad54bc4-d0ce-4575-b656-16b9528403f0';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'e668925f-0a1f-4f03-b741-2022eccf9855';
 update accel_dem set datagroups = 'parkinson'  where recordid = '9f4c8478-ca26-4ce4-a07a-36106a3d1d7d';
 update accel_dem set datagroups = 'parkinson'  where recordid = '31cc54ec-c68b-42f3-8655-7dbc602e18d1';
 update accel_dem set datagroups = 'parkinson'  where recordid = '6f99b44d-d3a5-4330-8fdd-9d980fb5895d';
 update accel_dem set datagroups = 'parkinson'  where recordid = '1d7850c4-67b0-4084-81c1-0f64d31329ac';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'bfa41430-c4a1-4ed9-b0e4-20a6122df4fe';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'ecae01c3-31f2-4547-be1d-08328ba66b0b';

 update accel_dem set datagroups = 'control'  where recordid = '1e072252-414d-4a7e-856d-e8513354d2c4';
 update accel_dem set datagroups = 'control'  where recordid = 'd34f2d63-0ddb-48ce-83ed-f21c07fa69a9';

 update accel_dem set datagroups = 'parkinson'  where recordid = '4dfc3af7-ed15-452e-a97a-1f26e89cee9b';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'cf5eb2aa-a8c4-42bd-834d-63ed6a2b0c93';

 update accel_dem set datagroups = 'control'  where recordid = '7372abee-abb9-4862-a17e-cf474af6ee42';
 update accel_dem set datagroups = 'control'  where recordid = '465a5dae-97a9-4117-b563-2eb9d715e2dc';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'b3b7585c-3187-4134-83c2-bdc9fe226a4b';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'bfb696a5-9f77-4817-b018-b3b8e9275eec';
 update accel_dem set datagroups = 'parkinson'  where recordid = '4dee458c-dc5e-4eca-bfb3-26f664e97d02';

 update accel_dem set datagroups = 'parkinson'  where recordid = '1afaa0d3-2e62-472a-9c75-6737817824ce';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'd0aa3d0e-9857-4eb9-bea5-8c402f2afc3c';
 update accel_dem set datagroups = 'parkinson'  where recordid = '0c9f9338-76d6-4dda-af3b-5f7ca437eb2a';
 update accel_dem set datagroups = 'parkinson'  where recordid = '8ff34e5e-a1ce-4e58-99ce-af46d4f1406d';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'c0932eb9-1863-4172-8e90-519e84fbe6c9';
 update accel_dem set datagroups = 'parkinson'  where recordid = '43fbcdfb-3cd7-4389-8a7f-724e21a50e96';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'c1e3f5dd-1e4f-48c1-bc1e-1d8cab5189fa';
 update accel_dem set datagroups = 'parkinson'  where recordid = '20c82e4c-d5a1-4609-91b9-34b0c1fca130';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'ad5c65f9-82a6-49e5-aba5-eec0d5913d3a';

 update accel_dem set datagroups = 'control'  where recordid = 'd9796f37-3c76-496b-917a-33cab4ef5ace';
 update accel_dem set datagroups = 'control'  where recordid = '9a7adc1c-0751-4321-a4b3-a43f6ff2d738';

 update accel_dem set datagroups = 'control'  where recordid = '4e544587-2bed-4d46-81f0-d51895d0776c';
 update accel_dem set datagroups = 'control'  where recordid = 'f8b3f2c0-334a-4082-9675-a0e13ec0df01';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'bbf8bd27-144c-408b-945d-419be6d5c994';
 update accel_dem set datagroups = 'parkinson'  where recordid = '92a2ffb5-eeec-421a-977d-75d9942f3901';

 update accel_dem set datagroups = 'parkinson'  where recordid = '406deaa5-a7b3-483c-ad52-414479ae12c8';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'e18f639b-ac8b-4a29-af7e-87512aa4dc03';

 update accel_dem set datagroups = 'parkinson'  where recordid = '06ba8d59-f4d8-4d6b-b49e-4ae76b9956de';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'ac20b5c9-b7d6-4392-a8ec-4483c9375559';

 update accel_dem set datagroups = 'control'  where recordid = 'd6150649-db4c-4e7c-a12d-8b738478832e';
 update accel_dem set datagroups = 'control'  where recordid = 'e0309cdc-ea6a-4fc4-a949-86643ffc7a2d';

 update accel_dem set datagroups = 'parkinson'  where recordid = '26c2ac21-4e3e-4b30-b68e-4b81fe80e1a5';
 update accel_dem set datagroups = 'parkinson'  where recordid = '76485765-b79a-4f7a-b597-737d8a033132';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'd6d79dbc-0d7a-440b-acb5-d6c462be289e';

 update accel_dem set datagroups = 'parkinson'  where recordid = '9758287d-9881-46ac-b13b-59a075bf487c';
 update accel_dem set datagroups = 'parkinson'  where recordid = '78f23d53-587f-47a6-8e7f-336deed0b494';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'f1c8d9a0-8314-494c-86e2-d4d3fa67e91b';

 update accel_dem set datagroups = 'parkinson'  where recordid = '24903bf6-ae88-411a-bb4f-f821e5af1197';
 update accel_dem set datagroups = 'parkinson'  where recordid = '2e1bc6f2-c653-42d3-b8d2-5d0c030298cd';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'd3d3f410-329f-4ad3-83d5-24a37956315a';

 update accel_dem set datagroups = 'parkinson'  where recordid = '219ffab1-499e-4660-83ca-827aae834218';
 update accel_dem set datagroups = 'parkinson'  where recordid = '171fb25d-6fda-496d-8d58-bda3b734c5c1';

 update accel_dem set datagroups = 'control'  where recordid = '43930e36-f4cf-4a0c-8b3e-ac3874300eb9';
 update accel_dem set datagroups = 'control'  where recordid = 'cdf65a43-8e83-4f01-82db-aeee09c6cdc7';
 update accel_dem set datagroups = 'control'  where recordid = 'a5fb7a5c-893d-415f-a53f-b170f86e578b';

 update accel_dem set datagroups = 'parkinson'  where recordid = '5c3800e2-d2a4-46b2-8d0d-b7652b3c8d7a';
 update accel_dem set datagroups = 'parkinson'  where recordid = '40352f6c-5c36-4771-bdb5-dce78a23608a';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'f7f514df-8de9-4086-97f2-e7f75a5a12bb';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'ec02f4d0-c174-4992-a2b3-d82825901181';

 update accel_dem set datagroups = 'control'  where recordid = '92616b6b-6a0a-4acf-8f6b-9f81be1800d3';
 update accel_dem set datagroups = 'control'  where recordid = '3f704005-98f1-4b26-be2f-5e60a923c781';

 update accel_dem set datagroups = 'parkinson'  where recordid = '9c181035-b87c-49cb-955b-4c8417a3ad6d';
 update accel_dem set datagroups = 'parkinson'  where recordid = '814d58ba-29c7-453c-baf4-cf269af51930';
 update accel_dem set datagroups = 'parkinson'  where recordid = '8911ec97-ef38-4bd5-ae4c-7369198b827a';

 update accel_dem set datagroups = 'control'  where recordid = '8d485fbe-709b-49c5-a1fa-dc9a4534b8af';
 update accel_dem set datagroups = 'control'  where recordid = '662df00f-3765-4936-bb26-8ca0d1fa382b';

 update accel_dem set datagroups = 'control'  where recordid = '719364b6-5c28-4b7f-93b7-ebf02d6a3146';
 update accel_dem set datagroups = 'control'  where recordid = '19f25c36-403b-4c5f-aaa7-538c87218212';

 update accel_dem set datagroups = 'parkinson'  where recordid = '1ad5631c-8411-4db4-9cb3-9f865ae38b18';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'ec181f03-d11a-4f77-ab6d-b3e190ef82be';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'cf39aa13-f755-4f44-ac01-e4d9726fda5e';
 update accel_dem set datagroups = 'parkinson'  where recordid = '327a0bf0-bd5a-4a0d-b2b2-dbadeb796951';
 update accel_dem set datagroups = 'parkinson'  where recordid = '327a0bf0-bd5a-4a0d-b2b2-dbadeb796951';
 update accel_dem set datagroups = 'parkinson'  where recordid = '272b2aae-1a1f-496a-bfe3-74ea7477db5e';

 update accel_dem set datagroups = 'control'  where recordid = '8aeafdf8-343a-4153-878e-25301d809f7f';
 update accel_dem set datagroups = 'control'  where recordid = '8859bf84-8169-47f0-81a2-6953e8b9280c';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'cf5d27d1-ef57-41b4-8553-c6477de20527';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'bf465dbc-0ade-45b3-8539-c03ab3b2c362';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'fb7d2005-ba18-4912-8df5-42907fb0741b';
 update accel_dem set datagroups = 'parkinson'  where recordid = '3408c318-42f2-4ab1-83ac-008386a13cef';
 update accel_dem set datagroups = 'parkinson'  where recordid = '0e4b520e-099c-4677-b39e-2b1c7ba7e9fb';
 update accel_dem set datagroups = 'parkinson'  where recordid = '4d8852ba-755c-4e07-9679-a723339621d0';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'a020f505-3198-4f90-84a8-897bb4dd7889';

 update accel_dem set datagroups = 'parkinson'  where recordid = '8d164984-1754-4c82-9c6b-ebf8eb502977';
 update accel_dem set datagroups = 'parkinson'  where recordid = '243c6ded-7848-47ef-85f6-1e2f5c97bd42';

 update accel_dem set datagroups = 'parkinson'  where recordid = '3833936d-3ec0-49d9-a1cf-eccae689a0f7';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'c1dffe47-ed59-40ae-9b6d-1b517afab235';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'b93eaacc-1365-41ef-adb6-c8a3a8b28586';
 update accel_dem set datagroups = 'parkinson'  where recordid = '288d8ee7-ce2d-4a64-a0d5-811c12e5ec67';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'bc1de18a-2f0b-4c5d-9e13-8a475329a029';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'c1a9c1b5-a490-47a9-954c-28f02f88e4b0';
 update accel_dem set datagroups = 'parkinson'  where recordid = '709f389f-5b7b-4ea4-8b98-940f440a78ac';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'a0805cad-b61a-4a8b-aab6-72b94b03c19d';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'd0563a4d-af79-4dd6-9f71-c22c146504e6';
 update accel_dem set datagroups = 'parkinson'  where recordid = '2592b55a-a721-4169-97b5-d0f31337e780';

 update accel_dem set datagroups = 'parkinson'  where recordid = '0788a93e-7c3c-4002-bf88-03c2e7fbc7a8';
 update accel_dem set datagroups = 'parkinson'  where recordid = '328d8e03-2698-4713-ad9f-39de9f1f7745';
 update accel_dem set datagroups = 'parkinson'  where recordid = '9c6f3ce0-4077-496c-9adf-e484f3576a25';
 update accel_dem set datagroups = 'parkinson'  where recordid = '125cf151-a6b9-47ac-a01e-91fc50abe71d';

 update accel_dem set datagroups = 'parkinson'  where recordid = '470f8eb1-5d28-44e8-8244-96bd7a471717';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'cd6fbc04-4a8f-4549-a8ad-f23f8769c0ae';
 update accel_dem set datagroups = 'parkinson'  where recordid = '2682d595-d5d6-49eb-8adf-d5ebc02cc81b';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'be6064f6-409c-4846-8500-ebf8d49df271';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'be6064f6-409c-4846-8500-ebf8d49df271';
 update accel_dem set datagroups = 'parkinson'  where recordid = '2b74aac8-0952-4f8d-a5d7-56a190fb6e44';
 update accel_dem set datagroups = 'parkinson'  where recordid = '0963c549-b530-4f8b-ab33-99e8a2d55ac7';

 update accel_dem set datagroups = 'parkinson'  where recordid = '2a435a9f-32f1-42da-9beb-957024a5f5fa';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'ce5546fc-ebaa-4187-80cf-31b63914fd02';
 update accel_dem set datagroups = 'parkinson'  where recordid = '758ce31f-b43e-4f5a-afe2-1cafc9f4581c';

 update accel_dem set datagroups = 'parkinson'  where recordid = '74bc7560-1556-46c4-8ece-c35e69ade0ef';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'a2853ff0-66f9-4df7-9762-e64e5ab32f7a';

 update accel_dem set datagroups = 'parkinson'  where recordid = '1401a183-3a61-4da8-adf0-25722e03dccd';
 update accel_dem set datagroups = 'parkinson'  where recordid = '2ffff827-d44e-409a-86f7-1217831cc732';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'c19b973c-8f1b-4de6-8c11-01967ff7e57e';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'ef850258-d4ed-4144-a89e-df32ff984e6e';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'cbb167ad-0b2c-4e5e-a26a-234efe3028ac';

 update accel_dem set datagroups = 'parkinson'  where recordid = '97c048d4-d9ac-4cdd-aad6-e2f99e606885';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'e213abf1-cbd9-4829-ae9d-25c2c08b4f16';
 update accel_dem set datagroups = 'parkinson'  where recordid = '6bf76cfb-30a9-43e0-85f8-4d1daa62da5f';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'c55c5a9f-2692-4a38-b897-c32d43dbd09e';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'cbadb5e8-f105-4951-8cd2-f6fe14ab2778';

 update accel_dem set datagroups = 'control'  where recordid = 'bd07d1e0-843b-45b2-80f6-a113dbe91c12';
 update accel_dem set datagroups = 'control'  where recordid = '89c9bddd-af24-4e55-b3ef-499a5a17a49d';

 update accel_dem set datagroups = 'control'  where recordid = '2c2dbcb9-20d7-4f2d-996f-b3ebc848b2b1';
 update accel_dem set datagroups = 'control'  where recordid = '701c1342-5b64-4efd-a575-3007159c81f1';

 update accel_dem set datagroups = 'control'  where recordid = 'db15b7e1-8afe-4696-8fb8-6718fb4993f6';
 update accel_dem set datagroups = 'control'  where recordid = '3dd961cf-0300-4b20-b93f-948844dcf2ba';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'fd9fb4ea-2bda-4dc6-9dda-bc2239757f64';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'f11cf94b-d1c1-42d6-94ec-456b6eb5796e';
 update accel_dem set datagroups = 'parkinson'  where recordid = '587afd20-7bec-46a4-b01c-a3792b7d9dd0';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'aec43e2b-6626-45bc-a07b-fa66a1d1672d';

 update accel_dem set datagroups = 'control'  where recordid = '08205fea-5ab3-40fe-a388-2af8efa00514';
 update accel_dem set datagroups = 'control'  where recordid = 'cf29a3ae-3a8d-4d1f-b852-7d2e08268a40';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'bcddcc6d-3512-4e0b-b355-6acd81292995';
 update accel_dem set datagroups = 'parkinson'  where recordid = '9d07967a-524e-44dc-b9d3-1544a61b1792';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'b97be8d2-fea0-46b8-89b9-bdca80b71462';
 update accel_dem set datagroups = 'parkinson'  where recordid = '70233c59-a370-4c42-8bee-be77964f9d97';

 update accel_dem set datagroups = 'control'  where recordid = '95a6f265-493b-47a4-81ca-9199d572de72';
 update accel_dem set datagroups = 'control'  where recordid = '048984a0-3914-4ed9-a7f3-892a7439db3f';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'a9122601-9c17-4d9f-88fb-9e3d2cfdd451';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'e41feed2-83d6-4229-95e2-95f2623c878c';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'aa77c03f-4912-489e-ba46-9db750df023c';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'a44d5cf7-1d8a-444b-808a-3f8f3a9383db';

 update accel_dem set datagroups = 'control'  where recordid = 'b64a02f2-63cc-4c54-bf5c-247d30a9f623';
 update accel_dem set datagroups = 'control'  where recordid = '88bee1d4-1e0d-44c3-8be3-18ff3c195010';

 update accel_dem set datagroups = 'parkinson'  where recordid = '54b7f47b-bdd3-4f90-ad62-664aa36a25d0';
 update accel_dem set datagroups = 'parkinson'  where recordid = '7cf487be-904b-49d4-9eb1-87dab93ec16b';
 update accel_dem set datagroups = 'parkinson'  where recordid = '091598cf-5cbc-4b80-bedf-10962346c3f1';

 update accel_dem set datagroups = 'parkinson'  where recordid = '13c344c6-b87a-4057-9614-42a35c675821';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'cacbbb0b-a2a0-4c4f-bd38-80b93591413d';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'c6240cf3-64e8-45c7-abcf-115e9b15d54c';
 update accel_dem set datagroups = 'parkinson'  where recordid = '45b2c3f8-a2cd-4be9-9e29-07d89d0db61e';

 update accel_dem set datagroups = 'control'  where recordid = '901b3578-3234-47fa-9bd8-b1f4e336ede0';
 update accel_dem set datagroups = 'control'  where recordid = '5df7bd39-69f6-40e0-917e-d08c3ad205cb';

 update accel_dem set datagroups = 'control'  where recordid = '103924b0-a069-4d46-96af-a4b5ae676e4b';
 update accel_dem set datagroups = 'control'  where recordid = '622fd155-5a89-4070-a612-53afbebd86d1';

 update accel_dem set datagroups = 'control'  where recordid = '5e356818-88d5-47dc-82c5-68200e9892a3';
 update accel_dem set datagroups = 'control'  where recordid = '2f478105-3e7c-494c-8058-0c8558e366a1';

 update accel_dem set datagroups = 'parkinson'  where recordid = '622c93f3-8cbc-4ec0-b540-f61142c8f2a7';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'f9088875-b5eb-4147-a0ea-8f57b2533bd4';

 update accel_dem set datagroups = 'parkinson'  where recordid = '69ff715b-f06e-4b1c-9fa5-ff26331fab0a';
 update accel_dem set datagroups = 'parkinson'  where recordid = '2e4e6475-213a-46af-8c1e-a0405864784f';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'efa5c850-b69b-4a26-a1bc-285c6d5a7d12';

 update accel_dem set datagroups = 'parkinson'  where recordid = '611f14b2-b07f-4aa4-bee8-de779ee88ed0';
 update accel_dem set datagroups = 'parkinson'  where recordid = '7e3fcae5-312e-4dda-8dac-53bc9de9b779';

 update accel_dem set datagroups = 'parkinson'  where recordid = '79be9689-7a54-4c51-94e9-a5fee30503cf';
 update accel_dem set datagroups = 'parkinson'  where recordid = '625c7b32-a667-41dd-afc3-7663d6e73dec';
 update accel_dem set datagroups = 'parkinson'  where recordid = '3029130d-0e76-48fb-9e6a-631886a0cb59';
 update accel_dem set datagroups = 'parkinson'  where recordid = '0513adbb-f8eb-4885-bbf7-a3136f12bc57';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'a8db4bcd-e899-482a-8acf-d27c42395465';
 update accel_dem set datagroups = 'parkinson'  where recordid = '1e5d0e25-d117-44a8-80c2-a243776e046c';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'f3a06a40-a2b2-4050-940e-ac6a7db33a44';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'b2782491-8c2c-4699-b51c-09a64cf93463';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'fd2bf697-f84e-4fce-8555-6d39e47faf67';
 update accel_dem set datagroups = 'parkinson'  where recordid = '4ca07183-9601-4094-9944-22690ec449c4';
 update accel_dem set datagroups = 'parkinson'  where recordid = '10bbad0a-eb9e-4ea2-a428-68e156a61e5b';

 update accel_dem set datagroups = 'parkinson'  where recordid = '5289a3a5-1702-4ff3-b351-3f4b7fafe0b7';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'd4244ff2-ef2f-4f31-9832-262297f80b14';

 update accel_dem set datagroups = 'parkinson'  where recordid = '26585675-00b3-4d69-a541-a0a7ba6da05f';
 update accel_dem set datagroups = 'parkinson'  where recordid = '13f24d83-1203-4550-b7c4-3b450ca4137f';
 update accel_dem set datagroups = 'parkinson'  where recordid = '21cc7f04-cb72-42fb-950c-c99042560aa6';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'cb51d213-844f-4248-b1cc-7b42f8ac06f1';
 update accel_dem set datagroups = 'parkinson'  where recordid = '4584371d-8eb2-4bbe-b2ec-78a033a3f445';
 update accel_dem set datagroups = 'parkinson'  where recordid = '8de10c0c-bfb9-4484-a6a7-514ab4a46e74';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'eab3c79f-2b03-4525-8687-12a6d57c0155';
 update accel_dem set datagroups = 'parkinson'  where recordid = '9960d6db-c55a-46a5-b665-f483268c300f';

 update accel_dem set datagroups = 'control'  where recordid = '14cea8c7-96c5-4b9f-a0a2-dd3b3c81f735';
 update accel_dem set datagroups = 'control'  where recordid = 'f1d8e496-464f-46e9-b500-c50de804ca53';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'ad966ed4-2e0b-490b-81f1-1ca2826f0b77';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'f77ddbb0-0e63-416f-8a79-b962e5cc9573';
 update accel_dem set datagroups = 'parkinson'  where recordid = '90670f5e-9f97-44a9-8dde-dcf35d70c270';

 update accel_dem set datagroups = 'parkinson'  where recordid = '0cf870c8-8d4a-454d-8334-57b410724016';
 update accel_dem set datagroups = 'parkinson'  where recordid = '374228d9-2550-4761-8c4c-0f3f0f76e4e5';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'f20f4b1a-3119-4910-904f-a050640a30b3';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'f97ec4e4-beb2-4a24-8ae4-71fc994e81ad';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'dfa12c8a-302f-422e-b4de-99df2e123f28';

 update accel_dem set datagroups = 'parkinson'  where recordid = '10a0cbef-63b4-43ca-aae6-07a49ceb8d12';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'e3e3375e-8f12-44b4-a368-a564da42b96c';

 update accel_dem set datagroups = 'parkinson'  where recordid = '520d06c0-62eb-4bf6-8d18-cebed94e92e6';
 update accel_dem set datagroups = 'parkinson'  where recordid = '75687a99-b3f7-4263-b1d7-c761b0561b13';

 update accel_dem set datagroups = 'control'  where recordid = '9f48a1fd-dbc1-412b-b66d-89131ae57cec';
 update accel_dem set datagroups = 'control'  where recordid = '30679b66-e572-47da-9d37-166f800af377';

 update accel_dem set datagroups = 'control'  where recordid = 'efbaf315-c7ba-4140-8daf-26532e3660d2';
 update accel_dem set datagroups = 'control'  where recordid = 'f73fc189-b3be-464e-b707-ec03a1cddef3';
 update accel_dem set datagroups = 'control'  where recordid = '696ce527-823f-4a94-b285-94ad19cb1075';

 update accel_dem set datagroups = 'control'  where recordid = 'dfa443c2-11de-4255-9cd2-1e99be2c47a0';
 update accel_dem set datagroups = 'control'  where recordid = '9caf9cbc-62f4-4153-9f76-8085a62cff9b';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'afad404a-2d6b-4f5f-b794-001807023181';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'a08491a8-bef3-4718-9f46-9adc4f360346';
 update accel_dem set datagroups = 'parkinson'  where recordid = '084916bf-795f-42d1-80ae-ba411ce85650';

 update accel_dem set datagroups = 'control'  where recordid = '9c43e8b3-36f7-484f-8a46-5cd33165baa2';
 update accel_dem set datagroups = 'control'  where recordid = '67ed53e7-8107-40f2-8d42-56d9fee75ebe';

 update accel_dem set datagroups = 'parkinson'  where recordid = '3576436b-9ab9-42cb-b822-729565a76a6a';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'fd0e0614-1f9a-406f-b454-2da352f285a7';

 update accel_dem set datagroups = 'control'  where recordid = '2bc217c1-a848-4d6f-84d2-ede2d8663718';
 update accel_dem set datagroups = 'control'  where recordid = '73de115f-c3ca-4f17-b829-ad841b80757a';
 update accel_dem set datagroups = 'control'  where recordid = '98d4ce30-081e-473a-bf11-ecf8133eb057';
 update accel_dem set datagroups = 'control'  where recordid = '2cb98491-89cb-447e-af4e-fd479d92b3e7';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'acd2a34a-e87d-45a6-a8c5-afdb47fb0307';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'c6e0cc88-8c0f-44d4-8d7c-a9c4fda1339b';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'b334bd00-6987-446a-95cd-fa4823b4ba7d';
 update accel_dem set datagroups = 'parkinson'  where recordid = '107499c3-ff50-4e7c-ae6d-eaf2a3846752';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'afee6b2b-0dd9-47ef-ad11-59c596d389b2';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'afee6b2b-0dd9-47ef-ad11-59c596d389b2';
 update accel_dem set datagroups = 'parkinson'  where recordid = '9a724702-3d72-4874-92cb-aa003c4d9860';

 update accel_dem set datagroups = 'control'  where recordid = '84e78669-9de5-4f3d-b6f0-95fe1c613c34';
 update accel_dem set datagroups = 'control'  where recordid = 'ef477cc6-38b8-443e-8b70-cb59a5bdf77a';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'd3f6c5e0-7cf9-4ffb-aa20-059fb5b42159';
 update accel_dem set datagroups = 'parkinson'  where recordid = '7a5bacf2-1666-41ac-a72e-480769778bec';

 update accel_dem set datagroups = 'control'  where recordid = 'dd9fb9cf-ac13-4c5a-8cbb-dd05f2f7618f';
 update accel_dem set datagroups = 'control'  where recordid = '211fc88b-d235-4232-8250-6912df08e941';
 update accel_dem set datagroups = 'control'  where recordid = '030c07c4-5332-4270-87a3-c24e373d28af';
 update accel_dem set datagroups = 'control'  where recordid = '262db1f3-d4d4-44f9-9894-7df2231526e3';

 update accel_dem set datagroups = 'parkinson'  where recordid = '37be17f7-01c6-4f1a-bf2b-4e7080e8b6ed';
 update accel_dem set datagroups = 'parkinson'  where recordid = '52f02d8a-d804-4018-bb8f-819ef9eca953';
 update accel_dem set datagroups = 'parkinson'  where recordid = '30ab9b64-1613-4185-86c4-fbd78b2636e1';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'feda72f0-0eab-4334-aa78-616a3ca6275d';
 update accel_dem set datagroups = 'parkinson'  where recordid = '89ca06f9-4227-45af-859f-34f04d9457e1';
 update accel_dem set datagroups = 'parkinson'  where recordid = '6bf37521-0208-488a-b1ee-e3f87c5bdd2d';

 update accel_dem set datagroups = 'control'  where recordid = '06e7e105-3038-4252-be59-577f84356a63';
 update accel_dem set datagroups = 'control'  where recordid = 'c86b4889-512e-4746-9247-8ee1dbe19384';
 update accel_dem set datagroups = 'control'  where recordid = 'e47aa172-42f1-4eee-a47c-acdfe0e5914d';

 update accel_dem set datagroups = 'parkinson'  where recordid = '06d92f37-1431-486b-aee9-dc66639bf811';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'f2180eea-2202-418e-b20c-0f801948ffba';

 update accel_dem set datagroups = 'parkinson'  where recordid = '6bbfe849-fcf5-4d79-9c86-f419feb2a305';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'a3fabb05-b180-403a-8a2c-50ad0a48b643';
 update accel_dem set datagroups = 'parkinson'  where recordid = 'dce4d6ba-e1cf-4154-ba26-8e9c8a4ec622';
 update accel_dem set datagroups = 'parkinson'  where recordid = '186576d2-d14b-4d27-9b71-a2b951416b79';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'bb631eff-562c-41e2-a0d9-ab7b2dec1478';
 update accel_dem set datagroups = 'parkinson'  where recordid = '89239511-7db3-403a-a6b3-7db0ee8983d8';

 update accel_dem set datagroups = 'parkinson'  where recordid = 'a74cf61f-1889-4a1b-9fc7-b86bd614ec3a';
 update accel_dem set datagroups = 'parkinson'  where recordid = '30c3cab6-dd34-4221-ba2d-09152c38c0ad';

 update accel_dem set datagroups = 'control'  where recordid = 'cadd3943-cc7b-4137-a0df-e174d974463e';
 update accel_dem set datagroups = 'control'  where recordid = 'd3a4260d-a67e-4bdf-a262-e3a9b9f799c5';
 update accel_dem set datagroups = 'control'  where recordid = '3c857534-c2f8-4d0e-a3b9-68f8d2e5003a';
 update accel_dem set datagroups = 'control'  where recordid = 'b316f151-ec0f-4bfc-8419-1d4f89b73365';
