var e = document.getElementById("crm-main");
if (e !== null) {
    e.innerHTML = "";
    var n = {
            chart: { height: 127, width: 100, type: "radialBar" },
            series: [48],
            colors: ["rgba(255,255,255,0.9)"],
            plotOptions: {
                radialBar: {
                    hollow: { margin: 0, size: "55%", background: "#fff" },
                    dataLabels: {
                        name: {
                            offsetY: -10,
                            color: "#4b9bfa",
                            fontSize: ".625rem",
                            show: !1,
                        },
                        value: {
                            offsetY: 5,
                            color: "#4b9bfa",
                            fontSize: ".875rem",
                            show: !0,
                            fontWeight: 600,
                        },
                    },
                },
            },
            stroke: { lineCap: "round" },
            labels: ["Status"],
        },
        l = new ApexCharts(document.querySelector("#crm-main"), n);
    l.render();
}
var e = document.getElementById("crm-total-customers");
if (e !== null) {
    e.innerHTML = "";
    var t = {
            chart: {
                type: "line",
                height: 40,
                width: 100,
                sparkline: { enabled: !0 },
            },
            stroke: {
                show: !0,
                curve: "smooth",
                lineCap: "butt",
                colors: void 0,
                width: 1.5,
                dashArray: 0,
            },
            fill: {
                type: "gradient",
                gradient: { opacityFrom: 0.9, opacityTo: 0.9, stops: [0, 98] },
            },
            series: [{ name: "Value", data: [20, 14, 19, 10, 23, 20, 22, 9, 12] }],
            yaxis: { min: 0, show: !1, axisBorder: { show: !1 } },
            xaxis: { show: !1, axisBorder: { show: !1 } },
            tooltip: { enabled: !1 },
            colors: ["rgb(132, 90, 223)"],
        },
        t = new ApexCharts(document.querySelector("#crm-total-customers"), t);
    t.render();
}
var e = document.getElementById("crm-total-revenue");
if (e !== null) {
    e.innerHTML = "";
    var a = {
            chart: {
                type: "line",
                height: 40,
                width: 100,
                sparkline: { enabled: !0 },
            },
            stroke: {
                show: !0,
                curve: "smooth",
                lineCap: "butt",
                colors: void 0,
                width: 1.5,
                dashArray: 0,
            },
            fill: {
                type: "gradient",
                gradient: { opacityFrom: 0.9, opacityTo: 0.9, stops: [0, 98] },
            },
            series: [{ name: "Value", data: [20, 14, 20, 22, 9, 12, 19, 10, 25] }],
            yaxis: { min: 0, show: !1, axisBorder: { show: !1 } },
            xaxis: { show: !1, axisBorder: { show: !1 } },
            tooltip: { enabled: !1 },
            colors: ["rgb(35, 183, 229)"],
        },
        a = new ApexCharts(document.querySelector("#crm-total-revenue"), a);
    a.render();
}
var e = document.getElementById("crm-conversion-ratio");
if (e !== null) {
    e.innerHTML = "";
    var o = {
            chart: {
                type: "line",
                height: 40,
                width: 100,
                sparkline: { enabled: !0 },
            },
            stroke: {
                show: !0,
                curve: "smooth",
                lineCap: "butt",
                colors: void 0,
                width: 1.5,
                dashArray: 0,
            },
            fill: {
                type: "gradient",
                gradient: { opacityFrom: 0.9, opacityTo: 0.9, stops: [0, 98] },
            },
            series: [{ name: "Value", data: [20, 20, 22, 9, 14, 19, 10, 25, 12] }],
            yaxis: { min: 0, show: !1, axisBorder: { show: !1 } },
            xaxis: { show: !1, axisBorder: { show: !1 } },
            tooltip: { enabled: !1 },
            colors: ["rgb(38, 191, 148)"],
        },
        o = new ApexCharts(document.querySelector("#crm-conversion-ratio"), o);
    o.render();
}
var e = document.getElementById("crm-total-deals");
if (e !== null) {
    e.innerHTML = "";
    var s = {
            chart: {
                type: "line",
                height: 40,
                width: 100,
                sparkline: { enabled: !0 },
            },
            stroke: {
                show: !0,
                curve: "smooth",
                lineCap: "butt",
                colors: void 0,
                width: 1.5,
                dashArray: 0,
            },
            fill: {
                type: "gradient",
                gradient: { opacityFrom: 0.9, opacityTo: 0.9, stops: [0, 98] },
            },
            series: [{ name: "Value", data: [20, 20, 22, 9, 12, 14, 19, 10, 25] }],
            yaxis: { min: 0, show: !1, axisBorder: { show: !1 } },
            xaxis: { show: !1, axisBorder: { show: !1 } },
            tooltip: { enabled: !1 },
            colors: ["rgb(245, 184, 73)"],
        },
        s = new ApexCharts(document.querySelector("#crm-total-deals"), s);
    s.render();
}
var e = document.getElementById("crm-revenue-analytics");
if (e !== null) {
    e.innerHTML = "";
    var n = {
            series: [{
                    type: "line",
                    name: "Profit",
                    data: [
                        { x: "Jan", y: 100 },
                        { x: "Feb", y: 210 },
                        { x: "Mar", y: 180 },
                        { x: "Apr", y: 454 },
                        { x: "May", y: 230 },
                        { x: "Jun", y: 320 },
                        { x: "Jul", y: 656 },
                        { x: "Aug", y: 830 },
                        { x: "Sep", y: 350 },
                        { x: "Oct", y: 350 },
                        { x: "Nov", y: 210 },
                        { x: "Dec", y: 410 },
                    ],
                },
                {
                    type: "line",
                    name: "Revenue",
                    chart: {
                        dropShadow: {
                            enabled: !0,
                            enabledOnSeries: void 0,
                            top: 5,
                            left: 0,
                            blur: 3,
                            color: "#000",
                            opacity: 0.1,
                        },
                    },
                    data: [
                        { x: "Jan", y: 180 },
                        { x: "Feb", y: 620 },
                        { x: "Mar", y: 476 },
                        { x: "Apr", y: 220 },
                        { x: "May", y: 520 },
                        { x: "Jun", y: 780 },
                        { x: "Jul", y: 435 },
                        { x: "Aug", y: 515 },
                        { x: "Sep", y: 738 },
                        { x: "Oct", y: 454 },
                        { x: "Nov", y: 525 },
                        { x: "Dec", y: 230 },
                    ],
                },
                {
                    type: "area",
                    name: "Sales",
                    chart: {
                        dropShadow: {
                            enabled: !0,
                            enabledOnSeries: void 0,
                            top: 5,
                            left: 0,
                            blur: 3,
                            color: "#000",
                            opacity: 0.1,
                        },
                    },
                    data: [
                        { x: "Jan", y: 200 },
                        { x: "Feb", y: 530 },
                        { x: "Mar", y: 110 },
                        { x: "Apr", y: 130 },
                        { x: "May", y: 480 },
                        { x: "Jun", y: 520 },
                        { x: "Jul", y: 780 },
                        { x: "Aug", y: 435 },
                        { x: "Sep", y: 475 },
                        { x: "Oct", y: 738 },
                        { x: "Nov", y: 454 },
                        { x: "Dec", y: 480 },
                    ],
                },
            ],
            chart: {
                height: 350,
                animations: { speed: 500 },
                dropShadow: {
                    enabled: !0,
                    enabledOnSeries: void 0,
                    top: 8,
                    left: 0,
                    blur: 3,
                    color: "#000",
                    opacity: 0.1,
                },
            },
            colors: [
                "rgb(132, 90, 223)",
                "rgba(35, 183, 229, 0.85)",
                "rgba(119, 119, 142, 0.05)",
            ],
            dataLabels: { enabled: !1 },
            grid: { borderColor: "#f1f1f1", strokeDashArray: 3 },
            stroke: { curve: "smooth", width: [2, 2, 0], dashArray: [0, 5, 0] },
            xaxis: { axisTicks: { show: !1 } },
            yaxis: {
                labels: {
                    formatter: function(r) {
                        return "$" + r;
                    },
                },
            },
            tooltip: {
                y: [{
                        formatter: function(r) {
                            return r !== void 0 ? "$" + r.toFixed(0) : r;
                        },
                    },
                    {
                        formatter: function(r) {
                            return r !== void 0 ? "$" + r.toFixed(0) : r;
                        },
                    },
                    {
                        formatter: function(r) {
                            return r !== void 0 ? r.toFixed(0) : r;
                        },
                    },
                ],
            },
            legend: {
                show: !0,
                customLegendItems: ["Profit", "Revenue", "Sales"],
                inverseOrder: !0,
            },
            title: {
                text: "Revenue Analytics with sales & profit (USD)",
                align: "left",
                style: {
                    fontSize: ".8125rem",
                    fontWeight: "semibold",
                    color: "#8c9097",
                },
            },
            markers: { hover: { sizeOffset: 5 } },
        },
        l = new ApexCharts(document.querySelector("#crm-revenue-analytics"), n);
    l.render();
}
var e = document.getElementById("crm-profits-earned");
if (e !== null) {
    e.innerHTML = "";
    var d = {
            series: [
                { name: "Profit Earned", data: [44, 42, 57, 86, 58, 55, 70] },
                { name: "Total Sales", data: [34, 22, 37, 56, 21, 35, 60] },
            ],
            chart: { type: "bar", height: 180, toolbar: { show: !1 } },
            grid: { borderColor: "#f1f1f1", strokeDashArray: 3 },
            colors: ["rgb(132, 90, 223)", "#e4e7ed"],
            plotOptions: {
                bar: {
                    colors: {
                        ranges: [
                            { from: -100, to: -46, color: "#ebeff5" },
                            { from: -45, to: 0, color: "#ebeff5" },
                        ],
                    },
                    columnWidth: "60%",
                    borderRadius: 5,
                },
            },
            dataLabels: { enabled: !1 },
            stroke: { show: !0, width: 2, colors: void 0 },
            legend: { show: !1, position: "top" },
            yaxis: {
                title: {
                    style: {
                        color: "#adb5be",
                        fontSize: "13px",
                        fontFamily: "poppins, sans-serif",
                        fontWeight: 600,
                        cssClass: "apexcharts-yaxis-label",
                    },
                },
                labels: {
                    formatter: function(i) {
                        return i.toFixed(0) + "";
                    },
                },
            },
            xaxis: {
                type: "week",
                categories: ["S", "M", "T", "W", "T", "F", "S"],
                axisBorder: {
                    show: !0,
                    color: "rgba(119, 119, 142, 0.05)",
                    offsetX: 0,
                    offsetY: 0,
                },
                axisTicks: {
                    show: !0,
                    borderType: "solid",
                    color: "rgba(119, 119, 142, 0.05)",
                    width: 6,
                    offsetX: 0,
                    offsetY: 0,
                },
                labels: { rotate: -90 },
            },
        },
        c = new ApexCharts(document.querySelector("#crm-profits-earned"), d);
    c.render();
}