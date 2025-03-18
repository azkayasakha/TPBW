const express = require('express');
const puppeteer = require('puppeteer');
const cors = require('cors');

const app = express();
const PORT = 3000;

app.use(cors());  // 🔥 Tambahkan ini agar request dari luar localhost diizinkan

app.get('/fare', async (req, res) => {
    const { from, to } = req.query;
    
    if (!from || !to) {
        return res.status(400).json({ error: 'Missing from or to parameter' });
    }

    const browser = await puppeteer.launch({ headless: true });
    const page = await browser.newPage();
    
    await page.goto('https://commuterline.id/perjalanan-krl/info-tarif', { waitUntil: 'networkidle2' });

    // Pilih stasiun asal dan tujuan
    await page.select('#st-from', from);
    await page.select('#st-to', to);

    // Klik tombol submit
    await page.click('.submitBtn');

    // Tunggu hingga elemen tarif diperbarui
    await page.waitForFunction(() => {
        const fareText = document.querySelector('#ongkos')?.innerText.trim();
        return fareText && fareText !== 'Rp';
    }, { timeout: 5000 }).catch(() => console.log('Timeout: Data tidak muncul.'));

    // Ambil hasil tarif
    const fareData = await page.evaluate(() => {
        return {
            route: document.querySelector('#from-to')?.innerText.trim() || '-',
            fare: document.querySelector('#ongkos')?.innerText.trim() || 'Rp'
        };
    });

    await browser.close();
    res.json(fareData);
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
