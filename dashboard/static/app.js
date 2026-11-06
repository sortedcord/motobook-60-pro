"use strict";

const $ = (id) => document.getElementById(id);
const present = (value) => typeof value === "number" && Number.isFinite(value);
const format = (value, digits = 1) => present(value) ? value.toLocaleString(undefined, {maximumFractionDigits: digits, minimumFractionDigits: digits}) : "—";
const timeFormat = new Intl.DateTimeFormat(undefined, {hour: "2-digit", minute: "2-digit"});
const detailTime = new Intl.DateTimeFormat(undefined, {month: "short", day: "numeric", hour: "2-digit", minute: "2-digit", second: "2-digit"});
const shortDate = new Intl.DateTimeFormat(undefined, {month: "short", day: "numeric"});
const app = {range: "6h", day: "latest", live: true, data: null, activity: "cpu_pct", thermal: "cpu_temp_c", systemPower: "cpu_package_w", generation: 0, controller: null, failed: false};
const activityMeta = {
  cpu_package_w: {name: "CPU package power", caption: "Average CPU package power between sampler readings", color: "#80c79d", unit: "W"},
  platform_psys_w: {name: "Platform PSYS power", caption: "Average platform PSYS power; hardware-dependent scope, includes CPU", color: "#8bc5d1", unit: "W"},
  cpu_pct: {name: "CPU utilization", caption: "CPU utilization from consecutive collector samples", color: "#80c79d", unit: "%"},
  memory_pct: {name: "Memory usage", caption: "Used memory = total minus available memory", color: "#b5a6dc", unit: "%"},
  brightness_pct: {name: "Display brightness", caption: "Backlight setting as a share of maximum brightness", color: "#d0b579", unit: "%"},
  cpu_temp_c: {name: "CPU temperature", caption: "Hottest CPU package or core temperature in °C", color: "#d0b579", unit: "°C"},
  hottest_temp_c: {name: "Hottest sensor", caption: "Highest available temperature across all sensors in °C", color: "#dc9f88", unit: "°C"},
  fan_rpm: {name: "Fan speed", caption: "Fastest reported fan in RPM; gaps indicate unavailable or stale readings", color: "#8bc5d1", unit: "RPM"},
};

function setText(id, value) { $(id).textContent = value; }
function metric(id, value, unit, digits = 1) {
  const element = $(id);
  element.replaceChildren(document.createTextNode(format(value, digits)));
  const suffix = document.createElement("span");
  suffix.textContent = unit;
  element.append(suffix);
}
function stat(id, value, unit) {
  const element = $(id);
  element.replaceChildren(document.createTextNode(format(value)));
  const suffix = document.createElement("small");
  suffix.textContent = unit;
  element.append(suffix);
}
function showNotice(message, error = false) {
  $("notice").hidden = !message;
  $("notice").classList.toggle("error", error);
  setText("notice", message);
}
function duration(seconds) {
  if (!present(seconds)) return null;
  const minutes = Math.round(seconds / 60);
  return {hours: Math.floor(minutes / 60), minutes: minutes % 60};
}
function ageLabel(milliseconds) {
  const seconds = Math.max(0, Math.floor(milliseconds / 1000));
  if (seconds < 60) return `${seconds}s ago`;
  if (seconds < 3600) return `${Math.floor(seconds / 60)}m ago`;
  if (seconds < 86400) return `${Math.floor(seconds / 3600)}h ago`;
  return `${Math.floor(seconds / 86400)}d ago`;
}
function updateFreshness() {
  const last = app.data?.latest;
  const dot = $("connection-dot");
  dot.className = "status-dot";
  if (app.failed) {
    dot.classList.add("error");
    setText("connection-label", "Connection lost");
    return;
  }
  if (!last) {
    setText("connection-label", "No recordings");
    return;
  }
  const age = Date.now() - last.time;
  const historical = app.day !== "latest";
  const stale = age > Math.max(60000, last.interval_seconds * 3000);
  dot.classList.add(stale || historical ? "stale" : "connected");
  setText("connection-label", historical ? "Historical view" : stale ? "Collector idle" : "Collector active");
  setText("updated-label", `Last sample ${detailTime.format(new Date(last.time))} · ${ageLabel(age)}`);
  if (app.day === "latest" && stale) {
    showNotice(`The latest sample was recorded ${ageLabel(age)}. Showing recorded data; new samples will appear when the collector resumes.`);
  }
}

function renderMetrics(data) {
  const last = data.latest || {};
  metric("battery-value", last.capacity_pct, "%", 0);
  metric("power-value", last.power_w, "W");
  metric("cpu-package-value", last.cpu_package_w, "W");
  metric("psys-value", last.platform_psys_w, "W");
  setText("system-power-detail", present(last.power_window_seconds) ? `Averaged over ${format(last.power_window_seconds)} seconds · Intel RAPL` : "Power readings unavailable or sampler warming up");
  metric("temperature-value", last.cpu_temp_c, "°C", 0);
  metric("fan-value", last.fan_rpm, "RPM", 0);
  metric("thermal-cpu-value", last.cpu_temp_c, "°C", 0);
  metric("hottest-value", last.hottest_temp_c, "°C", 0);
  setText("hottest-detail", last.hottest_sensor || "Temperature sensors unavailable");
  setText("fan-detail", present(last.fan_rpm) ? last.fan_rpm === 0 ? "Fan stopped · 0 RPM reported" : "Fastest reported fan" : last.fan_status === "stale" ? "Fan reading stale" : last.fan_status === "error" ? "Fan sensor read failed" : "Fan sensor unavailable");
  setText("battery-detail", last.battery_count ? `${last.state} · ${last.battery_name}` : "No system battery reported");
  $("battery-track").style.width = `${Math.max(0, Math.min(100, last.capacity_pct || 0))}%`;
  setText("power-detail", last.state === "Charging" ? "Charging power at the battery" : last.state === "Discharging" ? "Current battery discharge rate" : "Measured at the battery");
  setText("runtime-title", last.state === "Charging" ? "Estimated time to full" : "Estimated remaining");
  const runtime = duration(last.runtime_seconds);
  const runtimeElement = $("runtime-value");
  runtimeElement.replaceChildren();
  if (runtime) {
    for (const [value, unit] of [[runtime.hours, "h"], [runtime.minutes, "m"]]) {
      runtimeElement.append(document.createTextNode(String(value)));
      const span = document.createElement("span");
      span.textContent = unit;
      runtimeElement.append(span);
    }
  } else runtimeElement.textContent = "—";
  setText("runtime-detail", runtime ? "Estimate at the current battery rate" : last.state === "Full" ? "Battery is fully charged" : "No active charge / discharge estimate");
  const temperature = last.cpu_temp_c;
  $("temperature-dot").className = `tiny-dot ${present(temperature) ? temperature >= 80 ? "hot" : "green" : ""}`;
  setText("temperature-detail", present(temperature) ? temperature >= 80 ? "CPU package / cores · elevated" : "CPU package / cores" : "CPU sensor unavailable");
  metric("health-value", last.health_pct, "%");
  $("health-arc").style.strokeDashoffset = 458.67 * (1 - Math.max(0, Math.min(100, last.health_pct || 0)) / 100);
  setText("health-status", !present(last.health_pct) ? "Health unavailable" : last.health_pct >= 100 ? "At or above design capacity" : last.health_pct >= 80 ? "Capacity within 80–100% of design" : "Below 80% of design capacity");
  const model = [last.manufacturer, last.model].filter(Boolean).join(" · ");
  setText("battery-model", model || last.battery_name || "Battery information");
  setText("full-capacity", `${format(last.full_wh)} Wh`);
  setText("design-capacity", `${format(last.design_wh)} Wh`);
  setText("cycle-count", format(last.cycle_count, 0));
  setText("voltage-current", `${format(last.voltage_v, 2)} V / ${format(last.current_a, 2)} A`);
  setText("cpu-current", `${format(last.cpu_pct, 0)}%`);
  setText("memory-current", `${format(last.memory_pct, 0)}%`);
  setText("brightness-current", `${format(last.brightness_pct, 0)}%`);
  stat("average-power", data.summary.average_power_w, "W");
  stat("peak-power", data.summary.peak_power_w, "W");
  stat("energy-used", data.summary.energy_used_wh, "Wh");
  setText("sample-count", data.summary.count.toLocaleString());
  setText("window-tag", app.range === "all" ? "FULL RECORDING" : `${app.range.slice(0, -1)}-HOUR WINDOW`);
  setText("chart-date", data.latest ? shortDate.format(new Date(data.latest.time)) : "—");
  setText("source-detail", `Showing ${data.summary.count.toLocaleString()} samples. ${data.skipped_records} malformed records skipped.${last.battery_count > 1 ? ` ${last.battery_count} system batteries detected; battery metrics show ${last.battery_name}.` : ""}`);
  drawSpark(data.samples);
}

function renderEvents(events) {
  const container = $("events");
  container.replaceChildren();
  setText("event-count", events.length);
  if (!events.length) {
    const empty = document.createElement("div");
    empty.className = "events-empty";
    const icon = document.createElement("span");
    icon.className = "empty-icon";
    icon.innerHTML = '<svg aria-hidden="true"><use href="#i-plug"/></svg>';
    const title = document.createElement("strong");
    title.textContent = app.data?.latest ? "Steady as it goes" : "No recordings yet";
    const description = document.createElement("p");
    description.textContent = app.data?.latest ? "No charging or power-source changes in this window." : "Power-source changes will appear here.";
    empty.append(icon, title, description);
    container.append(empty);
    return;
  }
  for (const event of events) {
    const row = document.createElement("div");
    row.className = "event";
    const icon = document.createElement("span");
    icon.className = "event-icon";
    icon.innerHTML = '<svg aria-hidden="true"><use href="#i-plug"/></svg>';
    const copy = document.createElement("div");
    copy.className = "event-copy";
    const title = document.createElement("strong");
    title.textContent = event.state;
    const description = document.createElement("p");
    description.textContent = `${event.ac_online === null ? "Power source unavailable" : event.ac_online ? "External power connected" : "External power disconnected"} · ${format(event.capacity_pct, 0)}% charge`;
    const time = document.createElement("time");
    time.dateTime = event.timestamp;
    time.textContent = detailTime.format(new Date(event.time));
    copy.append(title, description);
    row.append(icon, copy, time);
    container.append(row);
  }
}

function sessionDuration(seconds) {
  if (!present(seconds)) return "—";
  const minutes = Math.round(seconds / 60);
  return `${Math.floor(minutes / 60)}h ${minutes % 60}m`;
}
function renderSessions(sessions) {
  const container = $("sessions-list");
  const fragment = document.createDocumentFragment();
  if (!sessions.length) {
    const empty = document.createElement("p");
    empty.textContent = "No charging or discharging sessions in this window.";
    fragment.append(empty);
  }
  for (const session of sessions) {
    const card = document.createElement("article");
    card.className = "session-card";
    const heading = document.createElement("strong");
    heading.textContent = `${session.type} · ${session.end_reason === "ongoing" ? "Ongoing" : session.complete ? "Complete" : "Partial"}`;
    const time = document.createElement("p");
    time.textContent = `${detailTime.format(new Date(session.start_time))} → ${detailTime.format(new Date(session.end_time))}`;
    const details = document.createElement("dl");
    const values = [["Battery", `${format(session.start_pct, 0)}% → ${format(session.end_pct, 0)}%`],
      ["Duration", sessionDuration(session.duration_seconds)],
      ["Average battery power", `${format(session.average_power_w)} W`],
      ["Peak battery power", `${format(session.peak_power_w)} W`],
      [session.type === "Charging" ? "Energy charged" : "Energy discharged", `${format(session.energy_wh, 2)} Wh`]];
    if (session.has_gaps) values.push(["Recorded time", sessionDuration(session.observed_seconds)]);
    if (session.type === "Discharging") values.push(["Backlight on (estimate)", sessionDuration(session.screen_on_seconds)]);
    for (const [label, value] of values) {
      const row = document.createElement("div");
      const term = document.createElement("dt"); term.textContent = label;
      const valueElement = document.createElement("dd"); valueElement.textContent = value;
      row.append(term, valueElement); details.append(row);
    }
    card.append(heading, time, details); fragment.append(card);
  }
  container.replaceChildren(fragment);
}

function renderTable(samples) {
  const rows = document.createDocumentFragment();
  for (const sample of samples.slice(-100).reverse()) {
    const row = document.createElement("tr");
    const values = [detailTime.format(new Date(sample.time)), sample.state,
      `${format(sample.capacity_pct, 0)}%`, `${format(sample.power_w)} W`,
      `${format(sample.energy_wh)} Wh`, `${format(sample.cpu_pct)}%`, `${format(sample.cpu_temp_c)} °C`,
      `${format(sample.hottest_temp_c)} °C`, `${format(sample.fan_rpm, 0)} RPM`, `${format(sample.cpu_package_w)} W`, `${format(sample.platform_psys_w)} W`];
    for (const value of values) {
      const cell = document.createElement("td");
      cell.textContent = value;
      row.append(cell);
    }
    rows.append(row);
  }
  if (!samples.length) {
    const row = document.createElement("tr");
    const cell = document.createElement("td");
    cell.colSpan = 11;
    cell.textContent = "No samples available in this window.";
    row.append(cell);
    rows.append(row);
  }
  $("sample-rows").replaceChildren(rows);
}

function renderSensors(last) {
  const rows = document.createDocumentFragment();
  const temperatures = (last?.temperatures || []).map(sensor => ({...sensor,
    reading: `${format(sensor.temp_c)} °C`, high: `${format(sensor.max_c)} °C`, critical: `${format(sensor.crit_c)} °C`}));
  const fans = (last?.fans || []).map(sensor => ({...sensor,
    reading: `${format(sensor.rpm, 0)} RPM`, high: "—", critical: "—"}));
  for (const sensor of [...fans, ...temperatures]) {
    const row = document.createElement("tr");
    for (const value of [`${sensor.name} · ${sensor.label}`, sensor.source, sensor.reading, sensor.high, sensor.critical, sensor.status]) {
      const cell = document.createElement("td");
      cell.textContent = value;
      row.append(cell);
    }
    row.lastChild.dataset.status = sensor.status;
    rows.append(row);
  }
  if (!temperatures.length && !fans.length) {
    const row = document.createElement("tr");
    const cell = document.createElement("td");
    cell.colSpan = 6;
    cell.textContent = "No sensor readings in this sample.";
    row.append(cell);
    rows.append(row);
  }
  $("sensor-rows").replaceChildren(rows);
}

function fitCanvas(canvas) {
  const rect = canvas.getBoundingClientRect();
  const ratio = window.devicePixelRatio || 1;
  canvas.width = Math.round(rect.width * ratio);
  canvas.height = Math.round(rect.height * ratio);
  const ctx = canvas.getContext("2d");
  ctx.setTransform(ratio, 0, 0, ratio, 0, 0);
  return {ctx, width: rect.width, height: rect.height};
}

function drawSpark(samples) {
  const {ctx, width, height} = fitCanvas($("power-spark"));
  const values = samples.slice(-40);
  const max = Math.max(1, ...values.map(s => s.power_w || 0));
  if (!values.length) return;
  ctx.beginPath();
  let active = false;
  values.forEach((s, i) => {
    if (!present(s.power_w)) { active = false; return; }
    const x = i / Math.max(1, values.length - 1) * width;
    const y = height - 3 - s.power_w / max * (height - 6);
    if (active) ctx.lineTo(x, y); else ctx.moveTo(x, y);
    active = true;
  });
  ctx.strokeStyle = "#8fc3a0";
  ctx.lineWidth = 1;
  ctx.stroke();
}

class TimeChart {
  get field() { return this.kind === "power" ? "power_w" : this.kind === "thermal" ? app.thermal : this.kind === "system-power" ? app.systemPower : app.activity; }
  constructor(canvasId, tooltipId, emptyId, kind) {
    this.canvas = $(canvasId);
    this.tooltip = $(tooltipId);
    this.empty = $(emptyId);
    this.kind = kind;
    this.samples = [];
    this.index = null;
    this.canvas.addEventListener("pointermove", e => this.inspect(e));
    this.canvas.addEventListener("pointerleave", () => this.clear());
    this.canvas.addEventListener("blur", () => this.clear());
    this.canvas.addEventListener("keydown", e => {
      if (!["ArrowLeft", "ArrowRight", "Escape", "Home", "End"].includes(e.key)) return;
      e.preventDefault();
      if (e.key === "Escape") { this.clear(); return; }
      if (!this.samples.length) return;
      let index = this.index ?? this.samples.length - 1;
      if (e.key === "Home") index = 0;
      else if (e.key === "End") index = this.samples.length - 1;
      else index += e.key === "ArrowRight" ? 1 : -1;
      this.index = Math.min(this.samples.length - 1, Math.max(0, index));
      this.draw();
      this.showTooltip();
    });
    new ResizeObserver(() => { this.draw(); if (this.index !== null) this.showTooltip(); }).observe(this.canvas.parentElement);
  }
  update(samples) {
    this.samples = samples;
    this.index = null;
    this.tooltip.hidden = true;
    this.draw();
  }
  clear() { this.index = null; this.tooltip.hidden = true; this.draw(); }
  inspect(event) {
    if (!this.samples.length || !this.bounds) return;
    const x = event.clientX - this.canvas.getBoundingClientRect().left;
    const target = this.start + (x - this.bounds.left) / this.bounds.width * (this.end - this.start);
    // Binary search keeps hovering cheap even for long recordings.
    let low = 0, high = this.samples.length - 1;
    while (low < high) {
      const mid = Math.floor((low + high) / 2);
      if (this.samples[mid].time < target) low = mid + 1; else high = mid;
    }
    if (low > 0 && Math.abs(this.samples[low - 1].time - target) < Math.abs(this.samples[low].time - target)) low--;
    this.index = low;
    this.draw();
    this.showTooltip();
  }
  showTooltip() {
    const sample = this.samples[this.index];
    if (!sample || !this.bounds) return;
    this.tooltip.replaceChildren();
    const time = document.createElement("strong");
    time.textContent = detailTime.format(new Date(sample.time));
    this.tooltip.append(time);
    const meta = activityMeta[this.field];
    const rows = this.kind === "power" ? [["Battery power", `${format(sample.power_w)} W`], ["Charge", `${format(sample.capacity_pct, 0)}%`], ["State", sample.state]] : [[meta.name, `${format(sample[this.field])} ${meta.unit}`]];
    for (const [name, value] of rows) {
      const row = document.createElement("div");
      row.className = "tooltip-row";
      const label = document.createElement("span");
      label.textContent = name;
      const number = document.createElement("b");
      number.textContent = value;
      row.append(label, number);
      this.tooltip.append(row);
    }
    this.tooltip.hidden = false;
    const x = this.x(sample.time);
    this.tooltip.style.left = `${Math.max(5, Math.min(this.canvas.clientWidth - this.tooltip.offsetWidth - 5, x + 12))}px`;
    this.tooltip.style.top = "15px";
  }
  x(time) { return this.bounds.left + (time - this.start) / (this.end - this.start) * this.bounds.width; }
  draw() {
    const {ctx, width, height} = fitCanvas(this.canvas);
    if (!width || !height) return;
    const power = this.kind === "power";
    const left = this.field === "fan_rpm" ? 58 : width < 350 ? 36 : 42;
    const right = power ? 40 : 18;
    this.bounds = {left, width: Math.max(1, width - left - right), top: 15, height: height - 45};
    const b = this.bounds;
    const samples = this.samples;
    const field = this.field;
    const meta = activityMeta[field];
    const available = samples.some(s => present(s[field]) || (power && present(s.capacity_pct)));
    this.empty.hidden = available;
    this.start = samples.length ? samples[0].time : 0;
    this.end = samples.length ? samples[samples.length - 1].time : 1;
    if (this.start === this.end) { this.start -= 30000; this.end += 30000; }
    // Rounded grid levels keep watt-axis labels easy to scan.
    let peak = 0;
    let minimum = 0;
    for (const sample of samples) if (present(sample[field])) {
      peak = Math.max(peak, sample[field]);
      minimum = Math.min(minimum, sample[field]);
    }
    const step = peak <= 8 ? 2 : peak <= 20 ? 5 : peak <= 40 ? 10 : peak <= 100 ? 25 : Math.ceil(peak / 4 / 10) * 10;
    const max = power || meta.unit === "W" ? Math.max(step * 4, Math.ceil(peak / step) * step) :
      field === "fan_rpm" ? Math.max(1000, Math.ceil(peak / 1000) * 1000) :
      this.kind === "thermal" ? Math.max(100, Math.ceil(peak / 25) * 25) : 100;
    const min = this.kind === "thermal" ? Math.floor(minimum / 25) * 25 : 0;
    const y = (v, cap = max) => b.top + b.height - (Math.max(min, Math.min(cap, v)) - min) / (cap - min) * b.height;
    ctx.font = "9px system-ui, sans-serif";
    ctx.lineWidth = 1;
    for (let i = 0; i <= 4; i++) {
      const gridY = b.top + b.height * i / 4;
      ctx.strokeStyle = "#2c4033";
      ctx.setLineDash([3, 4]);
      ctx.beginPath(); ctx.moveTo(left, gridY); ctx.lineTo(left + b.width, gridY); ctx.stroke();
      ctx.setLineDash([]);
      ctx.fillStyle = "#9fb398";
      ctx.textAlign = "right";
      ctx.fillText(`${format(max - (max - min) * i / 4, max < 4 ? 1 : 0)}${power || field === "fan_rpm" ? "" : meta.unit}`, left - 9, gridY + 3);
      if (power) {
        ctx.textAlign = "left";
        ctx.fillStyle = "#b5a6dc";
        ctx.fillText(`${100 - i * 25}%`, left + b.width + 9, gridY + 3);
      }
    }
    const ticks = width < 350 ? 3 : width < 500 ? 4 : 5;
    if (samples.length) {
      for (let i = 0; i < ticks; i++) {
        const fraction = i / (ticks - 1);
        const time = this.start + fraction * (this.end - this.start);
        ctx.fillStyle = "#9fb398";
        ctx.textAlign = i === 0 ? "left" : i === ticks - 1 ? "right" : "center";
        const date = new Date(time);
        const label = this.end - this.start > 86400000 ? shortDate.format(date) + " " + timeFormat.format(date) : timeFormat.format(date);
        ctx.fillText(label, left + fraction * b.width, height - 10);
      }
    }
    const line = (key, cap, color, dashed = false, area = false) => {
      const segments = [];
      let segment = [];
      let previous = null;
      for (const sample of samples) {
        const gap = previous && sample.time - previous.time > Math.max(60000, previous.interval_seconds * 3000);
        if (!present(sample[key]) || gap) {
          if (segment.length) segments.push(segment);
          segment = [];
        }
        if (present(sample[key])) segment.push([this.x(sample.time), y(sample[key], cap)]);
        previous = sample;
      }
      if (segment.length) segments.push(segment);
      ctx.save();
      ctx.beginPath(); ctx.rect(left - 2, b.top - 3, b.width + 4, b.height + 6); ctx.clip();
      for (const points of segments) {
        if (area && points.length > 1) {
          const gradient = ctx.createLinearGradient(0, b.top, 0, b.top + b.height);
          gradient.addColorStop(0, color + "28"); gradient.addColorStop(1, color + "03");
          ctx.fillStyle = gradient;
          ctx.beginPath(); ctx.moveTo(points[0][0], b.top + b.height);
          for (const [x, py] of points) ctx.lineTo(x, py);
          ctx.lineTo(points[points.length - 1][0], b.top + b.height); ctx.closePath(); ctx.fill();
        }
        ctx.strokeStyle = color; ctx.lineWidth = dashed ? 1.7 : 1.8;
        ctx.setLineDash(dashed ? [4, 4] : []);
        ctx.beginPath();
        points.forEach(([x, py], i) => i ? ctx.lineTo(x, py) : ctx.moveTo(x, py));
        ctx.stroke();
        if (points.length === 1) {
          ctx.fillStyle = color;
          ctx.beginPath(); ctx.arc(points[0][0], points[0][1], 2.5, 0, Math.PI * 2); ctx.fill();
        }
      }
      ctx.restore();
    };
    line(field, max, power ? "#80c79d" : meta.color, false, true);
    if (power) line("capacity_pct", 100, "#b5a6dc", true);
    const active = samples[this.index];
    if (active) {
      const x = this.x(active.time);
      ctx.strokeStyle = "#718a72"; ctx.setLineDash([3, 3]); ctx.lineWidth = 1;
      ctx.beginPath(); ctx.moveTo(x, b.top); ctx.lineTo(x, b.top + b.height); ctx.stroke(); ctx.setLineDash([]);
      if (present(active[field])) {
        ctx.fillStyle = power ? "#80c79d" : meta.color;
        ctx.strokeStyle = "#17251f"; ctx.lineWidth = 2;
        ctx.beginPath(); ctx.arc(x, y(active[field]), 4, 0, Math.PI * 2); ctx.fill(); ctx.stroke();
      }
    }
    this.canvas.setAttribute("aria-label", `${power ? "Battery power and charge" : `${meta.name} (${meta.unit})`} over time. ${samples.length} samples.${active ? ` Selected ${detailTime.format(new Date(active.time))}: ${format(active[field])} ${power ? "watts" : meta.unit}.` : " Use left and right arrow keys to inspect readings."}`);
  }
}

const powerChart = new TimeChart("power-chart", "power-tooltip", "power-empty", "power");
const activityChart = new TimeChart("activity-chart", "activity-tooltip", "activity-empty", "activity");
const systemPowerChart = new TimeChart("system-power-chart", "system-power-tooltip", "system-power-empty", "system-power");
const thermalChart = new TimeChart("thermal-chart", "thermal-tooltip", "thermal-empty", "thermal");

async function loadData() {
  const generation = ++app.generation;
  app.controller?.abort();
  const controller = new AbortController();
  app.controller = controller;
  const timeout = setTimeout(() => controller.abort(), 30000);
  $("refresh-button").disabled = true;
  const query = new URLSearchParams({range: app.range, date: app.day});
  $("export-button").href = `/api/export.csv?${query}`;
  try {
    const response = await fetch(`/api/telemetry?${query}`, {signal: controller.signal, cache: "no-store"});
    if (!response.ok) throw new Error(`Server returned ${response.status}`);
    const data = await response.json();
    if (generation !== app.generation) return;
    app.data = data;
    app.failed = false;
    showNotice("");
    const select = $("date-select");
    const values = ["latest", ...data.dates.slice().reverse()];
    if (app.day !== "latest" && !values.includes(app.day)) values.push(app.day);
    const dates = document.createDocumentFragment();
    for (const value of values) {
      const option = document.createElement("option");
      option.value = value;
      option.textContent = value === "latest" ? "Latest recordings" : new Intl.DateTimeFormat(undefined, {month: "short", day: "numeric", year: "numeric"}).format(new Date(`${value}T12:00:00`));
      option.selected = value === app.day;
      dates.append(option);
    }
    select.replaceChildren(dates);
    renderMetrics(data);
    renderEvents(data.events);
    renderSessions(data.sessions || []);
    renderTable(data.samples);
    renderSensors(data.latest);
    powerChart.update(data.samples);
    activityChart.update(data.samples);
    thermalChart.update(data.samples);
    systemPowerChart.update(data.samples);
    if (!data.latest) {
      showNotice(data.dates.length ? "No readings for this date. Choose another recording date." : "No collector logs found. Run python3 power_a2z/collect.py or start the power-a2z.timer to begin recording.");
      setText("updated-label", "Waiting for first reading");
    }
    updateFreshness();
  } catch (error) {
    if (generation !== app.generation) return;
    app.failed = true;
    showNotice(error.name === "AbortError" ? "The data request timed out. Refresh to try again; any displayed readings are from the last successful request." : `Could not load telemetry. Check that the dashboard server is running. ${error.message}`, true);
    updateFreshness();
  } finally {
    clearTimeout(timeout);
    if (generation === app.generation) $("refresh-button").disabled = false;
  }
}

for (const button of document.querySelectorAll("[data-range]")) {
  button.addEventListener("click", () => {
    app.range = button.dataset.range;
    for (const other of document.querySelectorAll("[data-range]")) {
      const selected = other === button;
      other.classList.toggle("selected", selected);
      other.setAttribute("aria-pressed", String(selected));
    }
    loadData();
  });
}
for (const button of document.querySelectorAll("[data-activity]")) {
  button.addEventListener("click", () => {
    app.activity = button.dataset.activity;
    for (const other of document.querySelectorAll("[data-activity]")) {
      const selected = other === button;
      other.classList.toggle("selected", selected);
      other.setAttribute("aria-pressed", String(selected));
    }
    setText("activity-caption", activityMeta[app.activity].caption);
    activityChart.update(app.data?.samples || []);
  });
}
for (const button of document.querySelectorAll("[data-thermal]")) {
  button.addEventListener("click", () => {
    app.thermal = button.dataset.thermal;
    for (const other of document.querySelectorAll("[data-thermal]")) {
      const selected = other === button;
      other.classList.toggle("selected", selected);
      other.setAttribute("aria-pressed", String(selected));
    }
    setText("thermal-caption", activityMeta[app.thermal].caption);
    thermalChart.update(app.data?.samples || []);
  });
}
$("date-select").addEventListener("change", event => { app.day = event.target.value; loadData(); });
$("refresh-button").addEventListener("click", loadData);
$("live-button").addEventListener("click", () => {
  app.live = !app.live;
  $("live-button").setAttribute("aria-pressed", String(app.live));
  $("live-button").querySelector("span:last-child").textContent = app.live ? "Auto-refresh on" : "Updates paused";
  if (app.live) loadData();
});
$("about-button").addEventListener("click", () => $("about-dialog").showModal());
$("close-dialog").addEventListener("click", () => $("about-dialog").close());
$("dismiss-dialog").addEventListener("click", () => $("about-dialog").close());
document.addEventListener("visibilitychange", () => { if (!document.hidden && app.live) loadData(); });
new ResizeObserver(() => { if (app.data) drawSpark(app.data.samples); }).observe($("power-spark"));
setInterval(() => { if (app.live && !document.hidden && !$("refresh-button").disabled) loadData(); }, 10000);
setInterval(updateFreshness, 10000);
loadData();

for (const button of document.querySelectorAll("[data-system-power]")) {
  button.addEventListener("click", () => {
    app.systemPower = button.dataset.systemPower;
    for (const other of document.querySelectorAll("[data-system-power]")) {
      const selected = other === button;
      other.classList.toggle("selected", selected);
      other.setAttribute("aria-pressed", String(selected));
    }
    setText("system-power-caption", activityMeta[app.systemPower].caption);
    systemPowerChart.update(app.data?.samples || []);
  });
}


const fanControl = {token: null, busy: false, dirty: false, initialized: false, generation: 0};
function updateFanControlForm() {
  const manual = $("fan-control-mode").value === "manual";
  $("fan-control-manual").hidden = !manual;
  $("fan-control-rpm").disabled = !manual || fanControl.busy;
  $("fan-control-slider").disabled = !manual || fanControl.busy;
  $("fan-control-mode").disabled = fanControl.busy;
  $("fan-control-apply").disabled = fanControl.busy || !fanControl.token;
  $("fan-control-apply").textContent = fanControl.busy ? "Applying…" : manual ? "Apply fan speed" : "Apply auto mode";
}
function renderFanControl(data) {
  const state = data.state || {};
  const requested = state.mode === "manual" ? `Manual · requested ${format(state.rpm, 0)} RPM` : state.mode === "auto" ? "Auto · firmware controlled" : "No recorded control request";
  setText("fan-control-current", `${requested} · measured ${format(data.measured_rpm, 0)} RPM`);
  if (!fanControl.dirty) {
    if (state.mode === "auto" || state.mode === "manual") $("fan-control-mode").value = state.mode;
    if (state.mode === "manual" && present(state.rpm)) {
      $("fan-control-rpm").value = state.rpm;
      $("fan-control-slider").value = state.rpm;
    }
    fanControl.initialized = true;
  }
  updateFanControlForm();
}
async function loadFanControl() {
  if (fanControl.busy) return;
  const generation = ++fanControl.generation;
  try {
    const response = await fetch("/api/fan-control", {cache: "no-store", signal: AbortSignal.timeout(15000)});
    const data = await response.json();
    if (generation !== fanControl.generation) return;
    if (!response.ok) throw new Error(data.error || "Fan-control service unavailable");
    fanControl.token = data.csrf_token;
    renderFanControl(data);
    if (!fanControl.dirty) setText("fan-control-status", "Controls apply to the live fan. Settings are not reapplied after reboot.");
  } catch (error) {
    if (generation !== fanControl.generation) return;
    fanControl.token = null;
    setText("fan-control-status", `Fan control unavailable: ${error.message}`);
    updateFanControlForm();
  }
}
$("fan-control-mode").addEventListener("change", () => { fanControl.dirty = true; updateFanControlForm(); });
for (const [source, target] of [["fan-control-slider", "fan-control-rpm"], ["fan-control-rpm", "fan-control-slider"]]) {
  $(source).addEventListener("input", () => { fanControl.dirty = true; $(target).value = $(source).value; });
}
$("fan-control-form").addEventListener("submit", async event => {
  event.preventDefault();
  if (fanControl.busy || !fanControl.token) return;
  const mode = $("fan-control-mode").value;
  const command = {mode};
  if (mode === "manual") {
    const rpm = Number($("fan-control-rpm").value);
    if (!Number.isInteger(rpm) || rpm < 1500 || rpm > 5400 || rpm % 100) {
      setText("fan-control-status", "Enter 1,500–5,400 RPM in steps of 100.");
      return;
    }
    command.rpm = rpm;
  }
  ++fanControl.generation;
  fanControl.busy = true;
  updateFanControlForm();
  setText("fan-control-status", "Applying fan setting…");
  try {
    const response = await fetch("/api/fan-control", {method: "POST", headers: {"Content-Type": "application/json", "X-CSRF-Token": fanControl.token}, body: JSON.stringify(command), signal: AbortSignal.timeout(15000)});
    const data = await response.json();
    if (!response.ok) throw new Error(data.error || "Fan setting failed");
    fanControl.dirty = false;
    renderFanControl(data);
    setText("fan-control-status", "Request applied. Allow a few seconds for fan speed to settle.");
  } catch (error) {
    setText("fan-control-status", `Could not apply fan setting: ${error.message}`);
  } finally {
    fanControl.busy = false;
    updateFanControlForm();
  }
});
setInterval(() => { if (!document.hidden) loadFanControl(); }, 10000);
loadFanControl();
