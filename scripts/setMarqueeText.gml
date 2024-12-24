/// setMarqueeText(string);

var text = argument0;
var buffer = "";

for(var i=0; i<MARQUEE.count; i++) {
    buffer += " ";
}

text = (buffer + text); // this first buffer ensures the start and end of the text is clear while looping

// we need to pad out the text so it uses all the marquee spaces
var missingChars = (MARQUEE.count - string_length(text));

if (missingChars > 0) {
    for(var i=0; i<missingChars; i++) {
        emptyString += " ";
    }
    
    text = (emptyString + text);
}

MARQUEE.text = text;
MARQUEE.index = 1;
