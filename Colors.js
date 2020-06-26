.pragma library

const Work = "#f05b56";
const ShortBreak = "#4cbca9";
const LongBreak= "#498fc1"
const Stroke = "#99ffffff";
const Text = "white";
const WhiteOpacity = "#19ffffff";
const BlackOpacity = "#26000000";

let _background = Work;

function setBackground(color) {
 _background = color;
}

function background() {
    return _background;
}


