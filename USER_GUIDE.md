# Robot Framework UI Automation - User Guide

## Projenin Amacı

Bu proje, Robot Framework ve `SeleniumLibrary` kullanılarak SauceDemo üzerinde Web UI test otomasyonu geliştirmek amacıyla hazırlanmıştır.
(API testleri ayrı `RobotFramework_API_Automation` projesinde bulunur.)

Test tekrarlarını azaltmak için ortak işlemler resource dosyasına taşınmış ve custom keyword'ler oluşturulmuştur.

---

## Kullanılan Teknolojiler

- Python 3.13
- Robot Framework 7.4.2
- SeleniumLibrary
- Google Chrome
- SauceDemo

---

## Proje Yapısı

```text
RobotFramework_UI_Automation/
├── resources/
│   └── ui_keywords.robot
├── tests/
│   ├── login.robot
│   └── product.robot
├── results/
├── venv/
├── requirements.txt
└── USER_GUIDE.md
```

`tests` gerçek test senaryolarını, `resources` ise tekrar kullanılan keyword ve değişkenleri içerir.

---

## Kurulum

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

---

## Robot Framework Temel Yapısı

Robot Framework, keyword-driven çalışan bir test otomasyon framework'üdür.

`.robot` dosyalarında temel olarak şu bölümler kullanılır:

- `*** Settings ***` → Library, Resource, Setup ve Teardown tanımları
- `*** Variables ***` → URL, kullanıcı bilgileri gibi değişkenler
- `*** Test Cases ***` → Test senaryoları
- `*** Keywords ***` → Tekrar kullanılabilir custom keyword'ler

Örnek:

```robot
*** Test Cases ***
Successful Login
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Page Should Contain    Products
```

---

## Login Testleri

`login.robot` içerisinde:

- Başarılı login
- Yanlış şifre ile login
- Boş bilgiler ile login

senaryoları bulunmaktadır.

Her test öncesinde browser açmak ve test sonunda kapatmak için:

```robot
Test Setup       Open Login Page
Test Teardown    Close Browser
```

kullanılmıştır.

Ortak login işlemleri `resources/ui_keywords.robot` içerisine taşınmıştır.

```robot
Login With Credentials
    [Arguments]    ${username}    ${password}
```

şeklinde parametre alan custom keyword oluşturulmuştur.

## Product Testi

`product.robot` içerisinde şu akış test edilmektedir:

```text
Login
→ Sauce Labs Backpack sepete ekle
→ Sepet badge değerinin 1 olduğunu doğrula
→ Sepete git
→ Sauce Labs Backpack ürününün sepette olduğunu doğrula
```

---

## Tag Kullanımı

```robot
[Tags]    ui    smoke    login
[Tags]    ui    regression    login
```

Smoke testlerini çalıştırmak:

```bash
robot --include smoke --outputdir results tests
```

Regression testlerini çalıştırmak:

```bash
robot --include regression --outputdir results tests
```

Smoke test, temel özelliklerin çalıştığını hızlıca kontrol eder.
Regression test ise yapılan değişikliklerin daha önce çalışan özellikleri bozup bozmadığını kontrol eder.

---

## Testlerin Çalıştırılması

Tüm UI testleri:

```bash
robot --outputdir results tests
```

Tek dosya:

```bash
robot --outputdir results tests/login.robot
```

---

## Raporlama

Koşum sonunda `results` klasöründe oluşur:

- `report.html` → Genel PASS/FAIL özeti
- `log.html` → Test adımlarının ve keyword'lerin detaylı kaydı
- `output.xml` → Ham test sonucu

---

## Bu Projede Öğrenilenler

- Robot Framework
- Keyword-driven testing
- SeleniumLibrary
- UI test otomasyonu
- Custom keyword ve Resource kullanımı
- Test Setup / Teardown
- Tag kullanımı
- Smoke ve Regression testleri
- Robot Framework HTML raporlama
