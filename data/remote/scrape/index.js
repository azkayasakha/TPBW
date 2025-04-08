const express = require('express');
const puppeteer = require('puppeteer');
const cors = require('cors');

const app = express();
const PORT = 3000;

app.use(cors());

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

app.get('/schedule', async (req, res) => {
    const { station, fromTime, toTime } = req.query;
    if (!station || !fromTime || !toTime) {
        return res.status(400).json({ error: 'Missing parameters: station, fromTime, toTime' });
    }

    const browser = await puppeteer.launch({ headless: true });
    const page = await browser.newPage();
    await page.goto('https://commuterline.id/perjalanan-krl/jadwal-kereta', { waitUntil: 'networkidle2' });

    // Pilih stasiun
    await page.select('#st-to', station);
    // Pilih jam awal dan jam akhir
    await page.select('#jam-from', fromTime);
    await page.select('#jam-to', toTime);
    
    // Klik tombol
    await page.click('.submitBtn');

    // Tunggu elemen muncul
    await page.waitForSelector('.row.jadwal-response', { timeout: 10000 }).catch(() => console.log("Jadwal tidak ditemukan atau timeout"));
    await new Promise(r => setTimeout(r, 3000));

    // Cek apakah elemen ditemukan
    const scheduleData = await page.evaluate(() => {
        let rows = document.querySelectorAll('.row.jadwal-response');
        let data = [];
        rows.forEach(row => {
            let destinations = row.querySelectorAll('.sta-name h3'); 
            let lines = row.querySelectorAll('.sta-name h4'); 
            let times = row.querySelectorAll('.sta-time .time-est');

            destinations.forEach((dest, index) => {
                let destination = dest?.innerText.trim() || 'N/A';
                let line = lines[index]?.innerText.trim() || 'N/A';
                let time = times[index]?.innerText.trim() || 'N/A';
                data.push({ destination, line, time });
            });
        });
        return data;
    });

    await browser.close();
    res.json(scheduleData);
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
