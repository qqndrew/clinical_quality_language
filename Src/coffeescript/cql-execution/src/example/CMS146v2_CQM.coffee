module.exports = {
   "library" : {
      "identifier" : {
         "id" : "CMS146",
         "version" : "2"
      },
      "schemaIdentifier" : {
         "id" : "urn:hl7-org:elm",
         "version" : "r1"
      },
      "usings" : {
         "def" : [ {
            "localIdentifier" : "System",
            "uri" : "urn:hl7-org:elm:r1"
         }, {
            "localIdentifier" : "QUICK",
            "uri" : "http://hl7.org/fhir"
         } ]
      },
      "parameters" : {
         "def" : [ {
            "name" : "MeasurementPeriod",
            "accessLevel" : "Public",
            "default" : {
               "lowClosed" : true,
               "highClosed" : false,
               "type" : "Interval",
               "low" : {
                  "name" : "DateTime",
                  "type" : "FunctionRef",
                  "operand" : [ {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "2013",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "1",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "1",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  } ]
               },
               "high" : {
                  "name" : "DateTime",
                  "type" : "FunctionRef",
                  "operand" : [ {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "2014",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "1",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "1",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "0",
                     "type" : "Literal"
                  } ]
               }
            }
         } ]
      },
      "valueSets" : {
         "def" : [ {
            "name" : "Acute Pharyngitis",
            "id" : "2.16.840.1.113883.3.464.1003.102.12.1011",
            "accessLevel" : "Public"
         }, {
            "name" : "Acute Tonsillitis",
            "id" : "2.16.840.1.113883.3.464.1003.102.12.1012",
            "accessLevel" : "Public"
         }, {
            "name" : "Ambulatory/ED Visit",
            "id" : "2.16.840.1.113883.3.464.1003.101.12.1061",
            "accessLevel" : "Public"
         }, {
            "name" : "Antibiotic Medications",
            "id" : "2.16.840.1.113883.3.464.1003.196.12.1001",
            "accessLevel" : "Public"
         }, {
            "name" : "Group A Streptococcus Test",
            "id" : "2.16.840.1.113883.3.464.1003.198.12.1012",
            "accessLevel" : "Public"
         } ]
      },
      "statements" : {
         "def" : [ {
            "name" : "Patient",
            "context" : "Patient",
            "expression" : {
               "type" : "SingletonFrom",
               "operand" : {
                  "dataType" : "{http://hl7.org/fhir}Patient",
                  "templateId" : "cqf-patient",
                  "type" : "Retrieve"
               }
            }
         }, {
            "name" : "InDemographic",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "And",
               "operand" : [ {
                  "type" : "GreaterOrEqual",
                  "operand" : [ {
                     "precision" : "Year",
                     "type" : "CalculateAgeAt",
                     "operand" : [ {
                        "path" : "birthDate",
                        "type" : "Property",
                        "source" : {
                           "name" : "Patient",
                           "type" : "ExpressionRef"
                        }
                     }, {
                        "type" : "Start",
                        "operand" : {
                           "name" : "MeasurementPeriod",
                           "type" : "ParameterRef"
                        }
                     } ]
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "2",
                     "type" : "Literal"
                  } ]
               }, {
                  "type" : "Less",
                  "operand" : [ {
                     "precision" : "Year",
                     "type" : "CalculateAgeAt",
                     "operand" : [ {
                        "path" : "birthDate",
                        "type" : "Property",
                        "source" : {
                           "name" : "Patient",
                           "type" : "ExpressionRef"
                        }
                     }, {
                        "type" : "Start",
                        "operand" : {
                           "name" : "MeasurementPeriod",
                           "type" : "ParameterRef"
                        }
                     } ]
                  }, {
                     "valueType" : "{urn:hl7-org:elm:r1}Integer",
                     "value" : "18",
                     "type" : "Literal"
                  } ]
               } ]
            }
         }, {
            "name" : "Pharyngitis",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Union",
               "operand" : [ {
                  "dataType" : "{http://hl7.org/fhir}Condition",
                  "templateId" : "cqf-condition",
                  "codeProperty" : "code",
                  "type" : "Retrieve",
                  "codes" : {
                     "name" : "Acute Pharyngitis",
                     "type" : "ValueSetRef"
                  }
               }, {
                  "dataType" : "{http://hl7.org/fhir}Condition",
                  "templateId" : "cqf-condition",
                  "codeProperty" : "code",
                  "type" : "Retrieve",
                  "codes" : {
                     "name" : "Acute Tonsillitis",
                     "type" : "ValueSetRef"
                  }
               } ]
            }
         }, {
            "name" : "Antibiotics",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "dataType" : "{http://hl7.org/fhir}MedicationPrescription",
               "templateId" : "cqf-medicationprescription",
               "codeProperty" : "medication.code",
               "type" : "Retrieve",
               "codes" : {
                  "name" : "Antibiotic Medications",
                  "type" : "ValueSetRef"
               }
            }
         }, {
            "name" : "TargetEncounters",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Query",
               "source" : [ {
                  "alias" : "E",
                  "expression" : {
                     "dataType" : "{http://hl7.org/fhir}Encounter",
                     "templateId" : "cqf-encounter",
                     "codeProperty" : "type",
                     "type" : "Retrieve",
                     "codes" : {
                        "name" : "Ambulatory/ED Visit",
                        "type" : "ValueSetRef"
                     }
                  }
               } ],
               "relationship" : [ {
                  "alias" : "P",
                  "type" : "With",
                  "expression" : {
                     "name" : "Pharyngitis",
                     "type" : "ExpressionRef"
                  },
                  "suchThat" : {
                     "type" : "OverlapsAfter",
                     "operand" : [ {
                        "lowClosed" : true,
                        "highClosed" : true,
                        "type" : "Interval",
                        "low" : {
                           "path" : "onsetDateTime",
                           "scope" : "P",
                           "type" : "Property"
                        },
                        "high" : {
                           "path" : "abatementDateTime",
                           "scope" : "P",
                           "type" : "Property"
                        }
                     }, {
                        "path" : "period",
                        "scope" : "E",
                        "type" : "Property"
                     } ]
                  }
               }, {
                  "alias" : "A",
                  "type" : "With",
                  "expression" : {
                     "name" : "Antibiotics",
                     "type" : "ExpressionRef"
                  },
                  "suchThat" : {
                     "type" : "In",
                     "operand" : [ {
                        "precision" : "Day",
                        "type" : "DurationBetween",
                        "operand" : [ {
                           "path" : "dateWritten",
                           "scope" : "A",
                           "type" : "Property"
                        }, {
                           "type" : "Start",
                           "operand" : {
                              "path" : "period",
                              "scope" : "E",
                              "type" : "Property"
                           }
                        } ]
                     }, {
                        "lowClosed" : true,
                        "highClosed" : false,
                        "type" : "Interval",
                        "low" : {
                           "type" : "Negate",
                           "operand" : {
                              "valueType" : "{urn:hl7-org:elm:r1}Integer",
                              "value" : "3",
                              "type" : "Literal"
                           }
                        },
                        "high" : {
                           "valueType" : "{urn:hl7-org:elm:r1}Integer",
                           "value" : "0",
                           "type" : "Literal"
                        }
                     } ]
                  }
               } ],
               "where" : {
                  "type" : "IncludedIn",
                  "operand" : [ {
                     "path" : "period",
                     "scope" : "E",
                     "type" : "Property"
                  }, {
                     "name" : "MeasurementPeriod",
                     "type" : "ParameterRef"
                  } ]
               }
            }
         }, {
            "name" : "TargetDiagnoses",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Query",
               "source" : [ {
                  "alias" : "P",
                  "expression" : {
                     "name" : "Pharyngitis",
                     "type" : "ExpressionRef"
                  }
               } ],
               "relationship" : [ {
                  "alias" : "E",
                  "type" : "With",
                  "expression" : {
                     "name" : "TargetEncounters",
                     "type" : "ExpressionRef"
                  },
                  "suchThat" : {
                     "type" : "OverlapsAfter",
                     "operand" : [ {
                        "lowClosed" : true,
                        "highClosed" : true,
                        "type" : "Interval",
                        "low" : {
                           "path" : "onsetDateTime",
                           "scope" : "P",
                           "type" : "Property"
                        },
                        "high" : {
                           "path" : "abatementDateTime",
                           "scope" : "P",
                           "type" : "Property"
                        }
                     }, {
                        "path" : "period",
                        "scope" : "E",
                        "type" : "Property"
                     } ]
                  }
               } ]
            }
         }, {
            "name" : "HasPriorAntibiotics",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Exists",
               "operand" : {
                  "type" : "Query",
                  "source" : [ {
                     "alias" : "A",
                     "expression" : {
                        "name" : "Antibiotics",
                        "type" : "ExpressionRef"
                     }
                  } ],
                  "relationship" : [ {
                     "alias" : "D",
                     "type" : "With",
                     "expression" : {
                        "name" : "TargetDiagnoses",
                        "type" : "ExpressionRef"
                     },
                     "suchThat" : {
                        "type" : "In",
                        "operand" : [ {
                           "precision" : "Day",
                           "type" : "DurationBetween",
                           "operand" : [ {
                              "path" : "dateWritten",
                              "scope" : "A",
                              "type" : "Property"
                           }, {
                              "path" : "onsetDateTime",
                              "scope" : "D",
                              "type" : "Property"
                           } ]
                        }, {
                           "lowClosed" : false,
                           "highClosed" : true,
                           "type" : "Interval",
                           "low" : {
                              "valueType" : "{urn:hl7-org:elm:r1}Integer",
                              "value" : "0",
                              "type" : "Literal"
                           },
                           "high" : {
                              "valueType" : "{urn:hl7-org:elm:r1}Integer",
                              "value" : "30",
                              "type" : "Literal"
                           }
                        } ]
                     }
                  } ]
               }
            }
         }, {
            "name" : "HasTargetEncounter",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Exists",
               "operand" : {
                  "name" : "TargetEncounters",
                  "type" : "ExpressionRef"
               }
            }
         }, {
            "name" : "InInitialPopulation",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "And",
               "operand" : [ {
                  "name" : "InDemographic",
                  "type" : "ExpressionRef"
               }, {
                  "name" : "HasTargetEncounter",
                  "type" : "ExpressionRef"
               } ]
            }
         }, {
            "name" : "InDenominator",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "valueType" : "{urn:hl7-org:elm:r1}Boolean",
               "value" : "true",
               "type" : "Literal"
            }
         }, {
            "name" : "InDenominatorExclusions",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "name" : "HasPriorAntibiotics",
               "type" : "ExpressionRef"
            }
         }, {
            "name" : "InNumerator",
            "context" : "Patient",
            "accessLevel" : "Public",
            "expression" : {
               "type" : "Exists",
               "operand" : {
                  "type" : "Query",
                  "source" : [ {
                     "alias" : "R",
                     "expression" : {
                        "dataType" : "{http://hl7.org/fhir}DiagnosticReport",
                        "templateId" : "cqf-diagnosticreport",
                        "codeProperty" : "name",
                        "type" : "Retrieve",
                        "codes" : {
                           "name" : "Group A Streptococcus Test",
                           "type" : "ValueSetRef"
                        }
                     }
                  } ],
                  "relationship" : [ ],
                  "where" : {
                     "type" : "And",
                     "operand" : [ {
                        "type" : "In",
                        "operand" : [ {
                           "path" : "issued",
                           "scope" : "R",
                           "type" : "Property"
                        }, {
                           "name" : "MeasurementPeriod",
                           "type" : "ParameterRef"
                        } ]
                     }, {
                        "type" : "Not",
                        "operand" : {
                           "type" : "IsNull",
                           "operand" : {
                              "path" : "result",
                              "scope" : "R",
                              "type" : "Property"
                           }
                        }
                     } ]
                  }
               }
            }
         } ]
      }
   }
}
