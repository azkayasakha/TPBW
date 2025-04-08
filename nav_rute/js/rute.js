const routes = {
	"POK":["KMT", "JNG"],
    "KMT":["POK","GST"],
    "GST":["KMT","PSE"],
    "PSE":["GST","KMO"],
    "KMO":["PSE","RJW"],
    "RJW":["KMO","KPB"],
    "KPB":["RJW","AK","AC","JAKK"],
    "AK":["KPB","DU"],
    "DU":["AK","THB","GRG"],
    "THB":["DU","KAT","PLM"],
    "KAT":["THB","SUDB"],
    "SUDB":["KAT","SUD"],
    "SUD":["SUDB","MRI"],
    "MRI":["SUD","MTR","CKI","TEB"],
    "MTR":["MRI","JNG"],
    "JNG":["MTR","KLD","POK"],
    "KLD":["JNG","BUA"],
    "BUA":["KLD","KLDB"],
    "KLDB":["BUA","CUK"],
    "CUK":["KLDB","KRI"],
    "KRI":["CUK","BKS"],
    "BKS":["KRI","BKST"],
    "BKST":["BKS","TB"],
    "TB":["BKST","CIT"],
    "CIT":["TB","MTM"],
    "MTM":["CIT","CKR"],
    "CKR":["MTM"],
    "JAKK":["JAY","KPB"],
    "JAY":["JAKK","MGB"],
    "MGB":["JAY","SWB"],
    "SWB":["MGB","JUA"],
    "JUA":["SWB","GDD"],
    "GDD":["JUA","CKI"],
    "CKI":["GDD","MRI"],
    "TEB":["MRI","CW"],
    "CW":["TEB","DRN"],
    "DRN":["CW","PSMB"],
    "PSMB":["DRN","PSM"],
    "PSM":["PSMB","TNT"],
    "TNT":["PSM","LNA"],
    "LNA":["TNT","UP"],
    "UP":["LNA","UI"],
    "UI":["UP","POC"],
    "POC":["UI","DPB"],
    "DPB":["POC","DP"],
    "DP":["DPB","CTA"],
    "CTA":["DP","PDRG","BJD"],
    "PDRG":["CTA","CBN"],
    "CBN":["PDRG","NMO"],
    "NMO":["CBN"],
    "BJD":["CTA","CLT"],
    "CLT":["BJD","BOO"],
    "BOO":["CLT"],
    "PLM":["THB","KBY"],
    "KBY":["PLM","PDJ"],
    "PDJ":["KBY","JMU"],
    "JMU":["PDJ","SDM"],
    "SDM":["JMU","RU"],
    "RU":["SDM","SRP"],
    "SRP":["RU","CSK"],
    "CSK":["SRP","CC"],
    "CC":["CSK","PRP"],
    "PRP":["CC","CJT"],
    "CJT":["PRP","DAR"],
    "DAR":["CJT","TEJ"],
    "TEJ":["DAR","TGS"],
    "TGS":["TEJ","CKY"],
    "CKY":["TGS","MJ"],
    "MJ":["CKY","CTR"],
    "CTR":["MJ","RK"],
    "RK":["CTR","JBU"],
    "GRG":["DU","PSG"],
    "PSG":["GRG","TKO"],
    "TKO":["PSG","BOI"],
    "BOI":["TKO","RW"],
    "RW":["BOI","KDS"],
    "KDS":["RW","PI"],
    "PI":["KDS","BPR"],
    "BPR":["PI","TTI"],
    "TTI":["BPR","TNG"],
    "TNG":["TTI"],
    "AC":["KPB","TPK"],
    "TPK":["AC"],
    "JBU":["RK","CT"],
    "CT":["JBU","CKL"],
    "CKL":["CT","WLT"],
    "WLT":["CKL","SG"],
    "SG":["WLT","KRA"],
    "KRA":["SG","TOJB"],
    "TOJB":["KRA","CLG"],
    "CLG":["TOJB","KEN"],
    "KEN":["CLG","MER"],
    "MER":["KEN"],
    "YK":["LPN","WT"],
    "LPN":["YK","MGW"],
    "MGW":["LPN","BBN"],
    "BBN":["MGW","SWT"],
    "SWT":["BBN","KT"],
    "KT":["SWT","CE"],
    "CE":["KT","DL"],
    "DL":["CE","GW"],
    "GW":["DL","PWS"],
    "PWS":["GW","SLO"],
    "SLO":["PWS","SK"],
    "SK":["SLO","PL"],
    "PL":["SK"],
    "WT":["YK","WJ"],
    "WJ":["WT","JN"],
    "JN":["WJ","KTA"],
    "KTA":["JN"],
};

// Menggunakan algoritma BFS
function findRoute(start, end) {
    let queue = [[start]];
    let visited = new Set();

    while (queue.length > 0) {
        let path = queue.shift();
        let current = path[path.length - 1];

        if (current === end) {
            return path;
        }

        if (!visited.has(current)) {
            visited.add(current);
            (routes[current] || []).forEach(neighbor => {
                queue.push([...path, neighbor]);
            });
        }
    }

    return null;
}