# PsalterApi — Project Overview

🚀 **Centralized Psalther API** for hymn stanzas, antiphons, psalm/canticle verses with stress-accent pointing, scripture reference, responsory, intercessions, concluding prayer.

---

## 📌 Problem Statement

Priest and Alter Servers scatter and duplicate PPT Psalter files for everyday:

- Documents duplicates
- Missing Files for some days
- Different xstructure of files.

**Result:** Document switching, lost information, inconsistent structures.

**Solution:** PsalterApi — **ONE fast, searchable, minimal API for mantaining and generating psalter ppt files.**

---

## 🧑‍💻 Target Users

| Persona         | Primary Need                                    |
| :---------------| :----------------------------------------------- |
| **Priests**     | Choose and download specific ppt files for any day |
| **Sacristans**  | Save prayers, antiphons, psalms, hymns  |
| **Sacristans**  | Create, update and delete Psalters/PsaltherDetails for any particular day of the liturgical year |


---

## ✨ Core Features

### A) Psalter & Psalther Details

Psalters have a **detail**. Sacristans can create psalter details, starting with **prayers** and **Type prayers** (fixed, cannot be edited/deleted): The following table is and example of the tipe of prayers, the system would have more elements of them.

| Type    | Content Kind |  Description                 |
| :------ | :------------ |  :--------------------------- |
| Caratula | Text         | General Info about the day |
| Introduction  | Text         | Short Prayer  |
| Invitatory Antiphon    | Text         | First Antiphon        |


### B) Callendar

- Group Psalters of **any type** for a specific day.

### C) Search

Full-text search across:

- Prayers
- Type Prayers
- Psalters  
- Psalter types
- Calendars

### D) Authentication

- Email + password
- Gmail Auth

### E) Additional Features

- 💾 Export pptFile (JSON/ZIP)
- 🌙 Dark mode (default), light mode optional

## 🗄️ Data Model

### EF

Check the following for more context:

- @Data/SfpptsContext
- @Models/

### Schema Notes

- ⚠️ All changes go through `ef database` 
- Cascade deletes ensure data consistency when users or items are deleted
- Unique constraints prevent duplicate types/collections/tags per user
- Indexes on foreign keys optimize query performance

---

## 🧱 Tech Stack

| Layer             | Technology                                |
| :--------------   | :-----------------------------------------|
| **Framework**     | ASP.NET Core 10.0 minimal-API backend     |
| **Language**      | C#                                        |
| **Database**      | (SQLServer) + EF                          |
| **Auth**          | (Email/Password + Gmail OAuth)            |
| **FileGenerator** | ShapeCrawler                              |

**Key:** Single codebase,minimal API routes for backend.

---

### ppt sample

Refer to the screenshots below as a base for the dashboard UI. It does not have to be exact. Use them as a reference:

- @context/ppt-samples/245MP-OTWeek16Tuesday.pptx