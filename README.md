<p align="center">
  <img src="bildirimaracıbanner.png" alt="bildirim aracı banner" width="1080">
</p>

# 🔔 Discord Bildirim Aracı

> Belirlediğin Discord kanallarını anahtar kelimeler için izleyen ve [ntfy.sh](https://ntfy.sh) üzerinden telefonuna anlık bildirim gönderen masaüstü uygulaması.

<div align="center">

![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python&logoColor=white)
![PyQt6](https://img.shields.io/badge/Arayüz-PyQt6-41CD52?logo=qt&logoColor=white)
![discord.py](https://img.shields.io/badge/discord.py-2.3%2B-5865F2?logo=discord&logoColor=white)
![Lisans](https://img.shields.io/badge/Lisans-MIT-yellow)
![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?logo=windows&logoColor=white)

</div>

---

## 📋 İçindekiler

- [Özellikler](#-özellikler)
- [Gereksinimler](#-gereksinimler)
- [Kurulum](#-kurulum)
- [Yapılandırma](#%EF%B8%8F-yapılandırma)
- [Kullanım](#-kullanım)
- [EXE Olarak Derleme](#-exe-olarak-derleme)
- [config.json Referansı](#-configjson-referansı)
- [Katkıda Bulunma](#-katkıda-bulunma)
- [Lisans](#-lisans)

---

## ✨ Özellikler

- **Anahtar Kelime İzleme** — Seçili kanallarda istediğin kelime veya ifadeleri takip et
- **Anlık Bildirim** — [ntfy.sh](https://ntfy.sh) üzerinden telefonuna ücretsiz push bildirimi
- **Modern Karanlık Arayüz** — PyQt6 ile geliştirilmiş şık masaüstü GUI
- **Çoklu Sunucu Desteği** — Botun üye olduğu tüm sunuculardaki kanalları izle
- **Kalıcı Kayıtlar** — Zaman damgası, sunucu, kanal, kullanıcı ve mesaj önizlemesiyle 200'e kadar algılama geçmişi
- **Test Bildirimi** — Tek tıkla ntfy bağlantını doğrula
- **Taşınabilir EXE** — `build.bat` ile tek dosya `.exe` oluştur, Python gerektirmez

---

## 🖥️ Gereksinimler

- Python **3.10+**
- Windows (`.bat` derleme betiği için; Python kodu platformdan bağımsızdır)
- Discord bot token'ı ([Nasıl alınır?](#%EF%B8%8F-yapılandırma))
- Telefonunda [ntfy uygulaması](https://ntfy.sh) (ücretsiz)

---

## 📦 Kurulum

```bash
# 1. Repoyu klonla
git clone https://github.com/KULLANICI_ADIN/discord-bildirim-araci.git
cd discord-bildirim-araci

# 2. Bağımlılıkları kur
pip install -r requirements.txt

# 3. Çalıştır
python main.py
```

---

## ⚙️ Yapılandırma

### 1. Discord Botu Oluştur

1. [discord.com/developers/applications](https://discord.com/developers/applications) adresine git
2. **New Application** → bir isim ver
3. **Bot** sekmesine geç
4. **Reset Token** ile token'ını kopyala
5. **Privileged Gateway Intents** altında **Message Content Intent**'i etkinleştir ✅
6. **OAuth2 → URL Generator** bölümünde `bot` kapsamını ve `Read Messages` iznini seç
7. Oluşturulan URL ile botu sunucuna davet et

### 2. ntfy Kurulumu

1. Telefonuna **ntfy** uygulamasını kur ([Android](https://play.google.com/store/apps/details?id=io.heckel.ntfy) / [iOS](https://apps.apple.com/us/app/ntfy/id1625396347))
2. Benzersiz bir konu adı seç (örn. `discord-bildirimlerim-xyz`)
3. Uygulamada `https://ntfy.sh/discord-bildirimlerim-xyz` adresine abone ol

### 3. Uygulamayı Yapılandır

Uygulamayı aç → **Ayarlar** sayfasına gir:
- **Discord Bot Token**'ını yapıştır
- **ntfy URL**'ini gir (örn. `https://ntfy.sh/discord-bildirimlerim-xyz`)
- **Kaydet ve Uygula** butonuna tıkla

---

## 🚀 Kullanım

1. **Botu Başlat** — Dashboard'da **Botu Başlat** butonuna tıkla
2. **Kanal Seç** — **Kanallar** sayfasında izlemek istediğin kanalları işaretle, **Seçimi Kaydet**'e tıkla
3. **Kelime Ekle** — **Kelimeler** sayfasında bildirim almak istediğin kelime veya ifadeleri ekle
4. **Bildirimleri Al** — İzlenen kanalda anahtar kelime geçtiğinde telefonuna anında bildirim gelir

**Kayıtlar** sayfasında tüm algılamaların geçmişi; tarih, saat, sunucu, kanal, kullanıcı ve mesaj önizlemesiyle birlikte tutulur.

---

## 📦 EXE Olarak Derleme

> Python kurulu olmayan bilgisayarlarda çalışan tek dosya `.exe` üretir.

```bat
build.bat
```

Betik sırasıyla şunları yapar:
1. Python kurulumunu kontrol eder
2. Tüm bağımlılıkları yükler
3. Önceki derleme dosyalarını temizler
4. PyInstaller ile `--onefile --noconsole` modunda derler
5. `config.json`'ı EXE'nin yanına kopyalar

> ⚠️ **Not:** `config.json` her zaman `.exe` ile aynı klasörde olmalıdır.

---

## 📁 config.json Referansı

Uygulama `config.json`'ı otomatik okur ve yazar. İstersen elle de düzenleyebilirsin:

```jsonc
{
  "token": "DISCORD_BOT_TOKEN",            // Discord Developer Portal'dan alınan bot token'ı
  "ntfy_url": "https://ntfy.sh/konu-adin", // ntfy endpoint URL'i
  "watched_channels": ["123456789"],        // İzlenecek kanal ID'leri (string liste)
  "keywords": ["kelime1", "fırsat"],        // İzlenecek kelimeler (büyük/küçük harf duyarsız)
  "logs": []                                // Otomatik yönetilen algılama geçmişi (maks. 200)
}
```

> ⚠️ **`config.json`'ı asla commit etme** — bot token'ını içerir. `.gitignore` tarafından zaten engellenmektedir.

---

## 🤝 Katkıda Bulunma

Katkılar memnuniyetle karşılanır!

- Hata bildirmek veya özellik önermek için **Issue** aç
- Geliştirme yapmak için **Pull Request** gönder

---

## 📄 Lisans

Bu proje [MIT Lisansı](LICENSE) ile lisanslanmıştır.

---

<div align="center">

 Ast tarafından ❤️ ile yapıldı

</div>
