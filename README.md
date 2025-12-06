![Aleataar Platform](Gemini_Generated_Image_3dklqc3dklqc3dkl.png)

# Aleataar – Product Authenticity Verification Platform  
### Built with Flutter Web + Firebase  
### Developed by Ahmed Aljbry

**Aleataar** is a secure, scalable, and web-based product-verification platform built with **Flutter Web** and **Firebase**, allowing consumers to verify the authenticity of products (pharmaceuticals, cosmetics, or any serialized goods) via serial codes or QR codes.  

This platform provides a robust public interface for users to check product authenticity, and an internal admin dashboard for authorized personnel to manage batches, serials, and verification logs.

---

## 🌟 Core Features

### 🧪 Product Verification  
- Users enter or scan product serial/QR code  
- Real-time verification against database  
- Response returns: product details, batch info, expiry date, verification status, first verification timestamp, usage count  
- Detection of reused, invalid or tampered codes  
- Clear feedback to user about authenticity or fraud alert  

### 🏷 Multi-Brand / Multi-Site Support  
- Handles multiple brands or vendors under one platform  
- Each brand can have its own set of products, batch codes, and themes  
- Easy expansion to add new brand catalogs  

### 🛠 Admin Dashboard  
- Add / edit / delete products and batches  
- Generate new serials / codes  
- View verification logs and statistics  
- Export logs (CSV / Excel) for auditing  
- Manage blacklist (invalid codes)  

### 🔐 Security & Data Integrity  
- Firebase Authentication for admin access  
- Firestore security rules to prevent unauthorized data manipulation  
- Logging of each verification attempt (timestamp, IP, location if enabled)  
- Rate-limiting or CAPTCHA for public verification endpoint (recommended)  

### 📡 Public Website  
- Clean, responsive UI (desktop + mobile)  
- Easy-to-use verification form  
- Localized language support (e.g. Arabic + English) — optional  

---

## 🚀 Tech Stack

| Layer         | Technology / Tool           |
|--------------|-----------------------------|
| **Frontend** | Flutter Web                 |
| **Backend / DB** | Firebase Firestore          |
| **Auth**     | Firebase Authentication     |
| **Hosting**  | Firebase Hosting (or any static hosting) |
| **QR / Serial Generator** | Custom code / Utilities       |
| **Exports / Reports** | CSV / Excel generation         |
| **Logging & Analytics** | Firebase / External analytics  |

---

## 🧱 Recommended Project Structure

```text
lib/
  core/
    config/            # API endpoints, constants, themes
    services/          # Firestore, Auth, export logic
    utils/             # code generators, helpers, validators

  features/
    verification/      # public verification UI & logic
    admin/             # dashboard interface (protected)
    products/          # product & batch management
    auth/              # login/logout/admin auth

  app.dart
  main.dart
