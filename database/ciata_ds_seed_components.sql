USE ciata_ds;

INSERT INTO platforms (slug,name,sort_order) VALUES
  ('other','Outra',999)
ON DUPLICATE KEY UPDATE name=VALUES(name),sort_order=VALUES(sort_order),active=1;

INSERT INTO components (component_code,slug,name,repository_path,lifecycle_status) VALUES
  ('CMP-0001','button','Button','components/button','experimental'),
  ('CMP-0002','text-field','Text Field','components/text-field','experimental'),
  ('CMP-0003','checkbox','Checkbox','components/checkbox','experimental'),
  ('CMP-0004','radio','Radio','components/radio','experimental'),
  ('CMP-0005','select-combobox','Select / Combobox','components/select-combobox','experimental'),
  ('CMP-0006','link','Link','components/link','experimental'),
  ('CMP-0007','alert-status','Alert / Status','components/alert-status','experimental'),
  ('CMP-0008','modal-dialog','Modal / Dialog','components/modal-dialog','experimental'),
  ('CMP-0009','loading-progress','Loading / Progress','components/loading-progress','experimental'),
  ('CMP-0010','card-interativo','Card interativo','components/interactive-card','experimental'),
  ('CMP-0011','pagination','Pagination','components/pagination','experimental'),
  ('CMP-0012','toast','Toast','components/toast','experimental'),
  ('CMP-0013','tabs','Tabs','components/tabs','experimental'),
  ('CMP-0014','accordion','Accordion','components/accordion','experimental'),
  ('CMP-0015','menu','Menu','components/menu','experimental'),
  ('CMP-0016','breadcrumb','Breadcrumb','components/breadcrumb','experimental'),
  ('CMP-0017','tooltip','Tooltip','components/tooltip','experimental'),
  ('CMP-0018','bottom-sheet','Bottom Sheet','components/bottom-sheet','experimental'),
  ('CMP-0019','date-picker','Date Picker','components/date-picker','experimental'),
  ('CMP-0020','file-upload','File Upload','components/file-upload','experimental'),
  ('CMP-0021','search','Search','components/search','experimental'),
  ('CMP-0022','autocomplete','Autocomplete','components/autocomplete','experimental')
ON DUPLICATE KEY UPDATE
  name=VALUES(name),
  repository_path=VALUES(repository_path);
