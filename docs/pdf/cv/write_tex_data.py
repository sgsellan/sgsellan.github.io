import os
import yaml


########### READ YML FILES INTO DICTIONARY ###########

cv_directory = './../../../data/cv'
base_directory = './../../../data'  # Assuming both cv_directory and additional_dirs reside inside data

additional_dirs = ["publications", "software"]

feedback_dirs = ['teaching', 'mentoring']

def read_yaml_file(filepath):
    """Read the contents of a YAML file and return it as a dictionary."""
    with open(filepath, 'r') as file:
        return yaml.safe_load(file)

cv_data = {}

# Function to read a directory and populate cv_data
def process_directory(directory, is_feedback=False):
    for filename in os.listdir(directory):
        if filename.endswith('.yml'):
            filepath = os.path.join(directory, filename)
            file_data = read_yaml_file(filepath)
            
            # Decide directory name for feedback or regular entry
            dir_name = "feedback_" + os.path.basename(os.path.dirname(directory)) if is_feedback else os.path.basename(directory)

            if dir_name not in cv_data:
                cv_data[dir_name] = []
            
            cv_data[dir_name].append(file_data)
            cv_data[dir_name].sort(key=lambda x: (str(x.get('order', float('inf'))).zfill(3),
                                                  str(x.get('date', x.get('dates', float('inf'))))), reverse=True)

# Loop over each directory in the CV directory
for subdir in os.listdir(cv_directory):
    subdir_path = os.path.join(cv_directory, subdir)
    
    # Check if it's a directory
    if os.path.isdir(subdir_path):
        process_directory(subdir_path)

        # Check if there's a feedback subdirectory
        if subdir in feedback_dirs:
            feedback_path = os.path.join(subdir_path, 'feedback')
            if os.path.exists(feedback_path):
                process_directory(feedback_path, is_feedback=True)

# Loop over each directory in additional_dirs
for subdir in additional_dirs:
    subdir_path = os.path.join(base_directory, subdir)
    if os.path.isdir(subdir_path):
        process_directory(subdir_path)


######################################################



########### WRITE DATA TO .TEX FILES #################


keys_mapping = {
    'awards': ['name', 'agency', 'amount', 'dates', 'description'],
    'academic_service': ['name', 'position', 'dates', 'description'],
    'departmental_service': ['name', 'position', 'dates', 'description'],
    'education': ['institution', 'degree', 'dates', 'description'],
    'experience': ['institution', 'position', 'dates', 'supervisor', 'description'],
    'mentoring': ['name', 'position', 'dates', 'description'],
    'teaching': ['name', 'position', 'dates', 'description'],
    'news': ['name', 'dates', 'description'],
    'organizing': ['name', 'position', 'dates', 'description'],
    'referee_service': ['name', 'dates'],
    'volunteering': ['name', 'position', 'dates', 'description'],
    'patents': ['name', 'authors', 'description'],
    'publications': ['name', 'authors', 'venue', 'description'],
    'software': ['name', 'authors', 'description'],
    'other_publications': ['name', 'authors', 'venue', 'description']
}

# Special treatment for directories with "authors" key
special_dirs = ['publications', 'patents', 'software', 'other_publications']

sections_directory = './sections'

if not os.path.exists(sections_directory):
    os.makedirs(sections_directory)

def process_text(text):
    """Remove every occurrence of '\' from the given text."""
    processed_text = text.replace("\\", "")
    processed_text = processed_text.replace("&", "\&")
    return processed_text

def write_to_tex(filename, data, category):
    """Write the data to a .tex file."""
    print(filename)
    category_print = category.replace('_', '')  # Remove underscores from the category name
    with open(filename, 'w') as file:
        for entry in data:
            tex_command = "\\" + category_print
            tex_params = []

            # Loop through the keys defined in keys_mapping for this category
            for key in keys_mapping[category]:
                if key in entry:
                    # Special treatment for the "authors" key
                    if category in special_dirs and key == 'authors':
                        authors = [author if "Silvia Sellán" not in author else f"\\textbf{{{author}}}" for author in entry[key]]
                        tex_params.append(", ".join(authors))
                    else:
                        tex_params.append(process_text(entry[key]))
                else:
                    tex_params.append('')  # Empty placeholder for missing keys

            file.write(tex_command + "{" + "}{".join(tex_params) + "}\n")

def write_talks_to_tex(filename, data):
    """Specific function to write the talks data to a .tex file."""
    # Sorting the talks by the order attribute
    sorted_data = sorted(data, key=lambda x: x.get('order', float('inf')), reverse=True)
    
    with open(filename, 'w') as file:
        for entry in sorted_data:  # Using sorted_data here
            # Write the talk title
            name = process_text(entry['name'])
            file.write(f"\\talktitle{{{name}}}\n")

            # Write each session
            for session in entry['sessions']:
                venue = process_text(session.get('venue', ''))
                description = process_text(session.get('description', ''))
                where = process_text(session.get('where', ''))
                when = process_text(session.get('when', ''))
                
                file.write(f"\\talkvenue{{{venue}}}{{{description}}}{{{where}}}{{{when}}}\n")


def write_feedback_to_tex(filename, data):
    """Specific function to write the feedback data to a .tex file."""
    with open(filename, 'w') as file:
        for entry in data:
            # Write the feedback title
            name = process_text(entry.get('name', ''))
            date = process_text(entry.get('date', ''))
            description = process_text(entry.get('description', ''))
            file.write(f"\\feedbacktitle{{{name}}}{{{date}}}{{{description}}}\n")

            # Write each feedback item
            for item in entry['items']:
                text = process_text(item.get('text', ''))
                file.write(f"\\feedbackitem{{{text}}}\n")

# main loop:
for subdir, entries in cv_data.items():
    tex_filepath = os.path.join(sections_directory, f"{subdir}.tex")
    
    # Special handling for talks
    if subdir == 'talks':
        write_talks_to_tex(tex_filepath, entries)
    # Special handling for feedback
    elif subdir.startswith('feedback_'):
        write_feedback_to_tex(tex_filepath, entries)
    else:
        write_to_tex(tex_filepath, entries, subdir)



######################################################