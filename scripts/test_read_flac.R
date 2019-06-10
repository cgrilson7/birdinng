library(seewave)
library(tuneR)
library(readr)
library(dplyr)

# Set working directory to input data folder
setwd("~/birdinng/input/british-birdsong-dataset/")

# Read in metadata
song_meta <- read_csv("birdsong_metadata.csv")

# Choose file_id
ex_id <- song_meta %>%
  filter(genus == "Picus") %>% ## European Green Woodpecker
  slice(1) %>% ## Get first row
  pull(file_id) ## Pull out file_id, store in ex_id

# Choose example file:
fname_base <- paste0("songs/xc",ex_id)
fname_flac <- paste0(fname_base, ".flac")
fname_wav <- paste0(fname_base, ".wav")

# Convert .flac to .wav
# Note: must download flac binary ($ brew install flac) before using wav2flac()
seewave::wav2flac(fname_flac, reverse=T)

# Play .wav
tuneR::setWavPlayer('/usr/bin/afplay')
tuneR::play(fname_wav)

ex_wave <- tuneR::readWave(fname_wav)
ex_wave_mono <- mono(ex_wave, "left")