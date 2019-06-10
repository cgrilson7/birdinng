# Example use of auk and a sample EBD file

# Define PATH to input EBD file
input_file <- system.file("extdata/ebd-sample.txt", package="auk")
# Output file path & name
output_file <- "ebd/canada-jay.txt"

# Build the query
ebd_query_df <- input_file %>%
  # Create a reference to the EBD sample file (input_file)
  auk_ebd() %>%
  # First filter: species one of Canada Jay or Perisoreus canadensis (its scientific name). Can use either
  auk_species(species = c("Canada Jay", "Perisoreus canadensis")) %>%
  # Second filter: state in which the birds were observed is Colorado
  auk_state(state = c("US-CO")) %>%
  # Convert the filters to an AWK script, run the script, write to output_file
  auk_filter(file = output_file, overwrite=T) %>%
  # Read the output EBD file into a data.frame
  read_ebd()