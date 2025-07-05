import pretty_midi
import json


midi_data = pretty_midi.PrettyMIDI(input("MIDI file path: "))

events = []
bpm = int(input("Song BPM: "))
level = int(input("Level: "))
instrument = int(input("Instrument(0/1/2/3): "))
tolerance_time = 1/ (bpm/60)
tolerance_modifier = float(input("Modifier (1/2/3/4): "))

for track in midi_data.instruments:
    for note in track.notes:
        events.append({
            "original_time": note.start,
            "start_time": note.start - pow(0.5, tolerance_modifier) * tolerance_time,
            "end_time": note.start + pow(0.5, tolerance_modifier) * tolerance_time
        })


object = [
    {
        "level": level,
        "instrument": instrument,
        "song_bpm": bpm,
        "tolerance_time": tolerance_time,
        "tolerance_modifier": tolerance_modifier,
        "notes": events
    }
]

with open("output/" + "lvl_" + str(level) + "_inst_" + str(instrument) + "_mod_" + str(int(tolerance_modifier)) + ".json", "w") as f:
    json.dump(object, f, indent=4)

