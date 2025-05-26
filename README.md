১.PostgresSql কি?
উত্তর: PostgresSql হলো একটি রিলেশনাল ডাটাবেস ম্যানেজমেন্ট  স্টিটেম যেখানে ডাটা ‍রাখা হয়। 
এটি SQL (Structured Query Language) ব্যবহার করে ডেটা ম্যানিপুলেট করে এবং অনেক আধুনিক ফিচার সাপোর্ট করে।

উদাহরণ: একটি কলেজের ছাত্রদের তথ্য রাখতে হলে PostgreSQL দিয়ে টেবিল তৈরি করে সেই তথ্য সংরক্ষণ ও প্রসেস করা যায়।

২.Primary key of Foregine key কী?
উত্তর:
Primary key: এটি একটি কলামের ‍সেট যা ঐ কলামের প্রতিটি রো কে ‍আলাদা ভাবে চিহ্নিত করতে সাহায্য  করো এটি কখনো null  বা duplicate  হতে পারে না ।

উদাহরণ: ranger_id  হচ্ছে  primary key।

Create table rangers(
ranger_id Primary Key,
name VARCHAR(50),
regions VARCHAR(50)
);

Foreign Key:  কোনো টেবিল এর সর্ম্পূন ডাটা কে না নিয়ে ঐ টেবিলের primary key কে অন্য একটে টেবিলে রাখা  হয় তখন তাকে  Foregine key বলে।

উদাহরণ: ranger_id  হচ্ছে  Foregine key।

Create table sighting(
sighting_id Primary Key,
ranger_id INT Reffernces rangers(ranger_id),
name VARCHAR(50),
regions VARCHAR(50)
);

৩. VARCHAR এবং  CHAR এর মাধ্যে পার্থক্য কী?

Varchar:
Varchar String ভেরিয়েবল এর লেন্থ যতটুকু প্রোয়োজন ততটুকুই নেয় যা অনেক জায়গায় বাচায় এবং  প্রোগ্রাম এর গতি অনেকটা বাডায় ।
উদাহরণ: name Varchar(50) 

char:
char String ভেরিয়েবল এর লেন্থ   পুরোটাই  নিয়ে  নেয় যা অনেক জায়গায় নষ্ঠ করে এবং  প্রোগ্রাম এর গতি অনেকটা কমিয়ে দেয় ।
উদাহরণ: name char(50) 


৪.Select স্টেটমেন্ট এ Where ক্লোজ এর কাজ কি?
উত্তর: ডাটা query  করার ‍ ‍সময় যেনো কনডিশন প্রোয়োগ করে  ডাটা ফিল্টার করতে  Where ক্লোজ ব্যবহার করা 
হয়।
উদাহরণ: SELECT * FROM sighting WHERE sighting_id = 3;



৫.UPDATE  দিয়ে ডেটা কীভাবে পরিবর্তন করা হয়?

উত্তর: সাধারণত টেবিলের ডেটা পরিবর্তন করার জন্য  UPDATE স্টেটমেন্ট সাথে where ক্লজ ব্যবহার করা হয় যেন সব রো আপডেট না হয়ে শুধু প্রয়োজনীয় ডাটা আপডেট  হয়।

উদাহরণ: Update  species
set conservation_status = 'Historic'
Where discovery_date < '1800-01-01';


