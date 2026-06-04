# Automated Test Data Generation for Business Rules in Data-Intensive Systems

## Description

This repository contains the complete implementation of a search-based test data 
generation approach that automatically generates schema-valid, multi-table database 
states satisfying business rule conditions encoded in the Decision Model and Notation 
(DMN) standard. The approach targets data-intensive systems with relational database 
backends where business rule conditions are expressed over derived attributes computed 
at evaluation time through SQL aggregation, ratio calculations, temporal expressions, 
and variable-to-variable comparisons. Deccription of what eacch code file does is present below.



---

## Code files  description
Relevant comments regarding what each code file does is also present at the start of each file uploaded.

```
├── main.py                          # Main entry point for grounder to start the predicate grounding step
├── main_sbst.py                     # Main Experiment Runner
├── ga_engine.py                     # Genetic algorithm search procedure (Algorithm 2)
├── grounder.py                      # Three-tier predicate grounding (Algorithm 1)
├── fitness.py                       # Branch-distance fitness function
├── enhanced_operators.py            # Relational-aware genetic operators (O1-O6)
├── schema_parser.py                 # Universal multi-dialect schema parser
├── schema_aware_random.py           # Schema-aware random baseline (Algorithm 3)
├── dmn_parser.py                    # DMN decision table parser
├── cache.py                         # Caching utilities
├── verifier.py                      # Terminal-based interactive verification interface for Tier 2 and Tier 3 groundings.
├── jbillingrules.dmn                # DMN rules for jBilling system 
├── moodle_rules.dmn                 # DMN rules for Moodle system 
├── openimis_rules.dmn               # DMN rules for openIMIS system 
├── jbilling_schema.sql              # Relational schema for jBilling
├── moodle_schema_v4.3.sql           # Relational schema for Moodle version 4.3
├── openimis_schema_develop.sql      # Relational schema for openIMIS (develop branch)
├── jbilling_insert_statements.sql   # Generated test fixtures for jBilling
├── moodlesqlresults.sql             # Generated test fixtures for Moodle
├── openimis_complete_insertsfixturerules.sql  # Generated test fixtures for openIMIS
                     
└── README.md
```

---

## Subject Systems

The approach is evaluated on four data-intensive systems:

| System | Type | Domain | Rules | Tables | Source |
|--------|------|--------|-------|--------|--------|
| Flex | Industrial (confidential) | Academic Management | 60 | 208 | https://flex.nu.edu.pk |
| Moodle | Open-source | Learning Management | 50 | 484 | https://sourceforge.net/projects/moodle/files/Moodle/stable403 |
| jBilling | Open-source | Billing & Subscription | 50 | 39 | https://sourceforge.net/projects/jbilling|
| openIMIS | Open-source | Health Insurance | 70 | 65 | https://github.com/openimis/database_ms_sqlserver |

**Note on Flex:** Business rules and schema for Flex are not included in this 
repository due to confidentiality restrictions imposed by the deploying organisation. 
Full reproducibility is supported using the three open-source systems (Moodle, 
jBilling, openIMIS), which account for 170 of the 230 evaluated rules. All DMN 
rule files and schema files for the open-source systems are included in this 
repository.

---

## Dataset Information

**DMN Rule Files**
Three `.dmn` files containing the expert-modeled business rules for Moodle, 
jBilling, and openIMIS. Rules were modeled by three domain experts (each with 
over 15 years of experience in software systems modeling and Model-Driven 
Engineering) from available system documentation including user guides, 
administrative manuals, and database schemas. Each rule was independently 
reviewed by at least two experts before use. Industry collaboration was 
provided by Questlab (https://www.questlab.pk).

**Schema Files**
Three schema files are provided that are obtained from each subject system,The schema parser (`schema_parser.py`) 
automatically handles dialect differences at runtime — no manual conversion 
is required. 

**SQL Output Files**
Three `.sql` files containing the generated schema-valid INSERT statement 
sets produced by the approach — one set of INSERT statements per covered 
business rule.

---

## Requirements

- Python 3.11 or higher
- SQLite 3.39 (built-in with Python — no installation required)
- All other dependencies are from the Python standard library:
  `re`, `collections`, `os`, `json`

No external packages need to be installed.



## Usage Instructions

### Step 1: Clone the repository

```bash
git clone https://github.com/maheenarshadm/TestdatagenerationImplementationCode.git
navigate to the project directory
cd TestdatagenerationImplementationCode
```
### Step 2: Run the prediate ground step for each of the system 

```bash

python main.py ground --schema <path to schema file of seleted system>  --rules <path to rules of selected system>

```
### Step 3: Run the GA-based test data generation

```bash
python main.py --schema <path_to_schema.sql> --dmn <path_to_rules.dmn>
```

Example for jBilling:
```bash
python main.py --schema jbilling_schema.sql --dmn jbillingrules.dmn
```

Example for Moodle:
```bash
python main.py --schema moodle_schema_v4.3.sql --dmn moodle_rules.dmn
```

Example for openIMIS:
```bash
python main.py --schema openimis_schema_develop.sql --dmn openimis_rules.dmn
```

### Step 4: Run the random baseline for comparison

```bash
python schema_aware_random.py --schema <path_to_schema.sql> --dmn <path_to_rules.dmn>
```


## Methodology

The approach consists of four main components as described in the paper:

**1. Predicate Grounding** (`grounder.py`)
A three-tier semi-automated process that maps each DMN condition attribute 
to its corresponding SQL derivation expression and classifies it into one 
of five structural types: direct column, aggregation, ratio, temporal, 
and variable-to-variable.

**2. FK-Closure Chromosome Representation** (`ga_engine.py`)
Constructs minimal, schema-valid multi-table database states by traversing 
the foreign key dependency graph and enforcing schema validity by construction 
through four layers: topological insertion ordering, immutable FK column sets, 
sequential primary key assignment, and structure-preserving crossover repair.

**3. Branch-Distance Fitness Function** (`fitness.py`)
Provides a continuous gradient signal for condition satisfaction, with support 
for variable-to-variable conditions by reducing them to scalar comparisons 
over derived operands. AND rules use summation aggregation; OR rules use 
minimum aggregation.

**4. Relational-Aware Genetic Operators** (`enhanced_operators.py`)
Six specialised operators (O1-O6) each targeting a specific structural challenge:
- O1: Schema-typed column mutation
- O2: Row count mutation for aggregation-driven attributes
- O3: Coordinated relational mutation for variable-to-variable conditions
- O4: Gradient-guided column mutation
- O5: Temporal window mutation
- O6: Structure-preserving crossover with PK/FK repair

---

## Search Algorithm Configuration

| Parameter | Value | Description |
|-----------|-------|-------------|
| Population size | 30 | Number of individuals per generation |
| Max evaluations per rule | 3,000 | Maximum fitness evaluations per rule |
| Mutation rate | 0.20 | Probability of mutating each attribute |
| Crossover rate | 0.70 | Probability of applying crossover |
| Tournament size | 3 | Individuals in selection tournaments |
| Elite count | 2 | Top individuals preserved each generation |
| Stagnation window | 8 generations | Generations before diversity recovery |

---


## Citation

(Not applicable)


## License
(Not applicable)

