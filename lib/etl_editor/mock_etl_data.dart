class MockEtlData {
  static String pipelineJson = r'''
  [ {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714",
    "@type" : [ "http://linkedpipes.com/ontology/Pipeline" ],
    "http://etl.linkedpipes.com/ontology/version" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#int",
      "@value" : "2"
    } ],
    "http://linkedpipes.com/ontology/profile" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/profile/default"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Miro TEST"
    } ]
  }, {
    "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/component/0808-832e",
    "@type" : [ "http://linkedpipes.com/ontology/Component" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/component/0808-832e/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/x" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#integer",
      "@value" : "557"
    } ],
    "http://linkedpipes.com/ontology/y" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#integer",
      "@value" : "120"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to RDF single graph"
    } ]
  }, {
    "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/component/2e1c-bd23",
    "@type" : [ "http://linkedpipes.com/ontology/Component" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/component/2e1c-bd23/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-pipelineInput/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/x" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#integer",
      "@value" : "348"
    } ],
    "http://linkedpipes.com/ontology/y" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#integer",
      "@value" : "155"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Pipeline input"
    } ]
  }, {
    "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/connection/18b2-a9b5",
    "@type" : [ "http://linkedpipes.com/ontology/Connection" ],
    "http://linkedpipes.com/ontology/sourceBinding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/sourceComponent" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/component/2e1c-bd23"
    } ],
    "http://linkedpipes.com/ontology/targetBinding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/targetComponent" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/component/0808-832e"
    } ]
  }, {
    "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/profile/default",
    "@type" : [ "http://linkedpipes.com/ontology/ExecutionProfile" ],
    "http://linkedpipes.com/ontology/rdfRepositoryPolicy" : [ {
      "@id" : "http://linkedpipes.com/ontology/repository/SingleRepository"
    } ],
    "http://linkedpipes.com/ontology/rdfRepositoryType" : [ {
      "@id" : "http://linkedpipes.com/ontology/repository/NativeStore"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/new/1",
    "@type" : [ "http://plugins.linkedpipes.com/ontology/t-filesToRdfGraph#Configuration" ],
    "http://plugins.linkedpipes.com/ontology/t-filesToRdfGraph#commitSize" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#integer",
      "@value" : "50000"
    } ],
    "http://plugins.linkedpipes.com/ontology/t-filesToRdfGraph#commitSizeControl" : [ {
      "@id" : "http://plugins.linkedpipes.com/resource/configuration/None"
    } ],
    "http://plugins.linkedpipes.com/ontology/t-filesToRdfGraph#mimeType" : [ {
      "@value" : ""
    } ],
    "http://plugins.linkedpipes.com/ontology/t-filesToRdfGraph#mimeTypeControl" : [ {
      "@id" : "http://plugins.linkedpipes.com/resource/configuration/None"
    } ],
    "http://plugins.linkedpipes.com/ontology/t-filesToRdfGraph#softFail" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://plugins.linkedpipes.com/ontology/t-filesToRdfGraph#softFailControl" : [ {
      "@id" : "http://plugins.linkedpipes.com/resource/configuration/None"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/component/0808-832e/configuration"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-pipelineInput/0.0.0/new/1",
    "@type" : [ "http://plugins.linkedpipes.com/ontology/e-pipelineInput#Configuration" ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/pipelines/1611664269714/component/2e1c-bd23/configuration"
} ]
  ''';

  static String componentsJson = r'''
  [ {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/c-files/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#42EBF4"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Quality"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/c-files/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/c-files"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/c-files/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/c-files/0.0.0/dataUnit/expected"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/c-files/0.0.0/dataUnit/actual"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Check files equivalence"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/c-files/0.0.0/dataUnit/actual",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "ActualFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Actual"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/c-files/0.0.0/dataUnit/expected",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "ExpectedFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Expected"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/c-files/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfChunkedTriples/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#42EBF4"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Quality"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/c-rdfChunkedTriples/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/c-rdfChunkedTriples"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/c-rdfChunkedTriples/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfChunkedTriples/0.0.0/dataUnit/expected"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfChunkedTriples/0.0.0/dataUnit/actual"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Check chunked RDF equivalence"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfChunkedTriples/0.0.0/dataUnit/actual",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Actual"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Actual"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfChunkedTriples/0.0.0/dataUnit/expected",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Expected"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Expected"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfChunkedTriples/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfSingleGraph/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#42EBF4"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Quality"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/c-rdfSingleGraph/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/c-rdfSingleGraph"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/c-rdfSingleGraph/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfSingleGraph/0.0.0/dataUnit/expected"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfSingleGraph/0.0.0/dataUnit/actual"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Check RDF single graph equivalence"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfSingleGraph/0.0.0/dataUnit/actual",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Actual"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Actual"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfSingleGraph/0.0.0/dataUnit/expected",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Expected"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Expected"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/c-rdfSingleGraph/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-datasetMetadata/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "(DEPRECATED) Dataset metadata"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Metadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Metadata"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-datasetMetadata/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-dcatap11dataset"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-dcatAp11Dataset/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "metadata"
    }, {
      "@value" : "dataset"
    }, {
      "@value" : "DCAT-AP"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP Dataset"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Metadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP Dataset"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Dataset/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-dcatap11distribution"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-dcatAp11Distribution/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "metadata"
    }, {
      "@value" : "distribution"
    }, {
      "@value" : "DCAT-AP"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP Distribution"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Dataset"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Dataset"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Metadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP Distribution"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-dcatAp11Distribution/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-distributionMetadata/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "(DEPRECATED) Distribution metadata"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "DatasetMetadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DatasetMetadata"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Metadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Metadata"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-distributionMetadata/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-filesfromlocal"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-filesFromLocal/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "local"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files from local"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-ftpFiles/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-ftpfiles"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-ftpFiles/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "FTP"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Extract from FTP"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-ftpFiles/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-httpGetFile/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-httpgetfile"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-httpGetFile/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "HTTP"
    }, {
      "@value" : "get"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-httpgetfiles"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-httpGetFiles/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "HTTP"
    }, {
      "@value" : "get"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/reportOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get list"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0/reportOutput",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "ReportRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Report"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFiles/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-pipelineInput/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-pipelineInput/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-pipelineinput"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-pipelineInput/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "POST"
    }, {
      "@value" : "input"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-pipelineInput/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    }, {
      "@id" : "http://linkedpipes.com/ontology/requirements/InputDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Pipeline input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-pipelineInput/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-pipelineInput/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-sparql"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-sparqlEndpoint/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "query"
    }, {
      "@value" : "endpoint"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-sparqlendpointchunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-sparqlEndpointChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "query"
    }, {
      "@value" : "endpoint"
    }, {
      "@value" : "chunked"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint chunked"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-sparqlendpointchunkedlist"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-sparqlEndpointChunkedList/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "query"
    }, {
      "@value" : "endpoint"
    }, {
      "@value" : "chunked"
    }, {
      "@value" : "list"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/tasks"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/reportOutput"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint chunked list"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/reportOutput",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "ErrorOutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Report"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0/tasks",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/TaskList" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Tasks"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Tasks"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointChunkedList/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-sparqlendpointconstructscrollablecursor"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-sparqlEndpointConstructScrollableCursor/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "query"
    }, {
      "@value" : "endpoint"
    }, {
      "@value" : "construct"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint construct scrollable cursor"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointConstructScrollableCursor/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-sparqlendpointlist"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-sparqlEndpointList/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "query"
    }, {
      "@value" : "endpoint"
    }, {
      "@value" : "list"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/errorOutput"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/tasks"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint list to single graph"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/errorOutput",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "ErrorOutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Report"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0/tasks",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/TaskList" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Tasks"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Tasks"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointList/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-sparqlendpointselect"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-sparqlEndpointSelect/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "query"
    }, {
      "@value" : "endpoint"
    }, {
      "@value" : "select"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint select"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-sparqlendpointselectscrollablecursor"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-sparqlEndpointSelectScrollableCursor/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "query"
    }, {
      "@value" : "endpoint"
    }, {
      "@value" : "select"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint select scrollable cursor"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelectScrollableCursor/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/e-textHolder/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-textholder"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-textHolder/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "text"
    }, {
      "@value" : "file"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0/dataUnit/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Text holder"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0/dataUnit/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#F6D8CE"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Extractor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/configurationDescription"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/e-voiddataset"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/e-voidDataset/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "metadata"
    }, {
      "@value" : "dataset"
    }, {
      "@value" : "VoID"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "VoID Dataset"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Distribution"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP Distribution"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Metadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "VoID Dataset"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-coachDb/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "http://etl.linkedpipes.com/components/l-coachdb"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-coachDb/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "coach"
    }, {
      "@value" : "database"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0/input"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "CoachDB"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-coachDb/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-couchDb/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-couchdb"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-couchDb/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "couch"
    }, {
      "@value" : "database"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0/input"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "CouchDB"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-couchDb/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/configurationDescription"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-dcatap11tockan"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-dcatAp11ToCkan/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "metadata"
    }, {
      "@value" : "CKAN"
    }, {
      "@value" : "DCAT-AP"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/codelists"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP to CKAN"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/codelists",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Codelists"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "EU MDR NALs"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Metadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP v1.1"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatAp11ToCkan/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#FFA500"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-dcatApToCkan/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "(DEPRECATED) Metadata to CKAN"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Metadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Metadata"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "JSON"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-dcatApToCkan/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-filesToLocal/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-filestolocal"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-filesToLocal/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "local"
    }, {
      "@value" : "upload"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to local"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-filesToScp/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-filestoscp"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-filesToScp/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "scp"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to SCP"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-ftpFiles/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-ftpfiles"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-ftpFiles/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "FTP"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0/input"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Load to FTP"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-ftpFiles/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-graphstoreprotocol"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-graphStoreProtocol/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "graph"
    }, {
      "@value" : "store"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/input"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Graph store protocol"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-graphStoreProtocol/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/configurationDescription"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-lodcloud"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-lodCloud/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "metadata"
    }, {
      "@value" : "LOD"
    }, {
      "@value" : "CKAN"
    }, {
      "@value" : "datahub"
    }, {
      "@value" : "DCAT-AP"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/codelists"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP to datahub.io"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/codelists",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Codelists"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "EU MDR NALs"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Metadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP + VoID"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-lodCloud/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-solr/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-solr"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-solr/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "solr"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Load to Solr"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-solr/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-sparqlendpoint"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-sparqlEndpoint/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "query"
    }, {
      "@value" : "endpoint"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/input"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint loader"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpoint/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-sparqlendpointchunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-sparqlEndpointChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "query"
    }, {
      "@value" : "endpoint"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/input"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint loader chunked"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-sparqlEndpointChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/l-wikibase/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/l-wikibase"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/l-wikibase/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "wikibase"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/report"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Wikibase loader"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0/report",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "ReportRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Report"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#FFFFCC"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Quality"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/q-sparqlask"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/q-sparqlAsk/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "ask"
    }, {
      "@value" : "quality"
    }, {
      "@value" : "check"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL ask"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-bingTranslator/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-bingTranslator"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-bingTranslator/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "azure"
    }, {
      "@value" : "bing"
    }, {
      "@value" : "translation"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Bing Translator"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-bingTranslator/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-chunksplitter"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-chunkSplitter/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "chunk"
    }, {
      "@value" : "split"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Chunk splitter"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkSplitter/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-chunkedToFiles"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-chunkedToFiles/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "RDF/XML"
    }, {
      "@value" : "N-Triples"
    }, {
      "@value" : "Turtle"
    }, {
      "@value" : "N3"
    }, {
      "@value" : "TriX"
    }, {
      "@value" : "TriG"
    }, {
      "@value" : "N-Quads"
    }, {
      "@value" : "JSON-LD"
    }, {
      "@value" : "RDF/JSON"
    }, {
      "@value" : "RDFa"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dataUnit/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dataUnit/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dataUnit/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Chunked to Files"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dataUnit/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dataUnit/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputChunked"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dataUnit/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToFiles/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToGraph/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-chunkedToGraph/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-chunkedToGraph"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-chunkedToGraph/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "merge"
    }, {
      "@value" : "rdf"
    }, {
      "@value" : "chunked"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToGraph/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToGraph/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Chunked merger"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToGraph/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToGraph/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToGraph/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToTurtle/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-chunkedToTurtle/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-chunkedToTurtle/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToTurtle/0.0.0/dataUnit/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToTurtle/0.0.0/dataUnit/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Chunked to Turtle"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToTurtle/0.0.0/dataUnit/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputChunked"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToTurtle/0.0.0/dataUnit/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-chunkedToTurtle/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-excelToCsv/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-exceltocsv"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-excelToCsv/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "excel"
    }, {
      "@value" : "csv"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Excel to CSV"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-excelToCsv/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-fileHasher/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-fileHasher/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-filehasher"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-fileHasher/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "hash"
    }, {
      "@value" : "sha1"
    }, {
      "@value" : "check"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-fileHasher/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-fileHasher/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "File hasher"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-fileHasher/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-fileHasher/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-fileHasher/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-fileDecode/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-filesbase64decode"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-filesBase64Decode/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "decode"
    }, {
      "@value" : "base64"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Decode base64"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-filesBase64Decode/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-filesFilter/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-filesfilter"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-filesFilter/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "filter"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files filter"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-filesRenamer/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-filesrenamer"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-filesRenamer/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dataUnit/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dataUnit/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dataUnit/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files renamer"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dataUnit/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dataUnit/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dataUnit/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-filesRenamer/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-filesToRdf/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-filestordf"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-filesToRdf/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "RDF/XML"
    }, {
      "@value" : "N-Triples"
    }, {
      "@value" : "Turtle"
    }, {
      "@value" : "N3"
    }, {
      "@value" : "TriX"
    }, {
      "@value" : "TriG"
    }, {
      "@value" : "N-Quads"
    }, {
      "@value" : "JSON-LD"
    }, {
      "@value" : "RDF/JSON"
    }, {
      "@value" : "RDFa"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to RDF"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/GraphList", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-filesToRdfChunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-filesToRdfChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "RDF/XML"
    }, {
      "@value" : "N-Triples"
    }, {
      "@value" : "Turtle"
    }, {
      "@value" : "N3"
    }, {
      "@value" : "TriX"
    }, {
      "@value" : "TriG"
    }, {
      "@value" : "N-Quads"
    }, {
      "@value" : "JSON-LD"
    }, {
      "@value" : "RDF/JSON"
    }, {
      "@value" : "RDFa"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to RDF Chunked"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-filestordfsinglegraph"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-filesToRdfGraph/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "RDF/XML"
    }, {
      "@value" : "N-Triples"
    }, {
      "@value" : "Turtle"
    }, {
      "@value" : "N3"
    }, {
      "@value" : "TriX"
    }, {
      "@value" : "TriG"
    }, {
      "@value" : "N-Quads"
    }, {
      "@value" : "JSON-LD"
    }, {
      "@value" : "RDF/JSON"
    }, {
      "@value" : "RDFa"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to RDF single graph"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdfGraph/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-filesToStatements/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-filestostatements"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-filesToStatements/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "rdf"
    }, {
      "@value" : "wrap"
    }, {
      "@value" : "escape"
    }, {
      "@value" : "statement"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to Statements"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/GraphList", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToStatements/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-geoTools/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-geotools"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-geoTools/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "geo"
    }, {
      "@value" : "tools"
    }, {
      "@value" : "chunked"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "GeoTools"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-geoTools/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-graphMerger/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-graphMerger/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-graphmerger"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-graphMerger/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "merge"
    }, {
      "@value" : "rdf"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-graphMerger/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-graphMerger/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Graph merger"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-graphMerger/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/GraphList", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-graphMerger/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-graphMerger/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-hdttordf"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-hdtToRdf/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "HDT"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HDT to RDF"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-hdtToRdf/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-htmlcssuv"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-htmlCssUv/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "csv"
    }, {
      "@value" : "tabular"
    }, {
      "@value" : "uv"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTML CSS ODCS"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/GraphList", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-jsonldformat"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-jsonLdFormat/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "jsonld"
    }, {
      "@value" : "flatten"
    }, {
      "@value" : "compact"
    }, {
      "@value" : "expand"
    }, {
      "@value" : "operation"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "JSON-LD operations"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdFormat/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-jsonLdToRdf"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-jsonLdToRdf/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "JSON-LD"
    }, {
      "@value" : "Semargl"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "JSON-LD to RDF"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdf/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-jsonldtordfchunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-jsonLdToRdfChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "JSON-LD"
    }, {
      "@value" : "Semargl"
    }, {
      "@value" : "Chunked"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "JSON-LD to RDF Chunked"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonLdToRdfChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-jsontojsonld"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-jsonToJsonLd/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "json"
    }, {
      "@value" : "jsonld"
    }, {
      "@value" : "context"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "JSON to JSON-LD"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-jsonToJsonLd/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-modifyDate/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-modifydate"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-modifyDate/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "date"
    }, {
      "@value" : "modify"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Modify date"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-modifyDate/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-mustache/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-mustache"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-mustache/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "mustache"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Mustache"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-mustache/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-mustachechunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-mustacheChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "mustache"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Chunked Mustache"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-mustacheChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-packZip/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-packzip"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-packZip/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "zip"
    }, {
      "@value" : "compress"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Create zip archive"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-packZip/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-propertylinkerchunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-propertyLinkerChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "property"
    }, {
      "@value" : "linker"
    }, {
      "@value" : "chunk"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/data"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/reference"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Property based linker chunked"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/data",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "DataRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Chunks"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0/reference",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "ReferenceRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Reference"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-propertyLinkerChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfDifference/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-rdfDifference/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-rdfdifference"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-rdfDifference/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "construct"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfDifference/0.0.0/data"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfDifference/0.0.0/toRemove"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfDifference/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "RDF difference"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfDifference/0.0.0/data",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "DataRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Data"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfDifference/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfDifference/0.0.0/toRemove",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "ToRemoveRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "To remove"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfDifference/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-rdfToFile/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-rdftofile"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-rdfToFile/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "RDF/XML"
    }, {
      "@value" : "N-Triples"
    }, {
      "@value" : "Turtle"
    }, {
      "@value" : "N3"
    }, {
      "@value" : "TriX"
    }, {
      "@value" : "TriG"
    }, {
      "@value" : "N-Quads"
    }, {
      "@value" : "JSON-LD"
    }, {
      "@value" : "RDF/JSON"
    }, {
      "@value" : "RDFa"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "RDF to file"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFile"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-rdftofilechunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-rdfToFileChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "RDF/XML"
    }, {
      "@value" : "N-Triples"
    }, {
      "@value" : "Turtle"
    }, {
      "@value" : "N3"
    }, {
      "@value" : "TriX"
    }, {
      "@value" : "TriG"
    }, {
      "@value" : "N-Quads"
    }, {
      "@value" : "JSON-LD"
    }, {
      "@value" : "RDF/JSON"
    }, {
      "@value" : "RDFa"
    }, {
      "@value" : "chunked"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Chunked RDF to file"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFile"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFileChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-rdftohdt"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-rdfToHdt/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "HDT"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "RDF to HDT"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToHdt/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-rdfToJsonTemplate"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-rdfToJsonTemplate/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "transformation"
    }, {
      "@value" : "hierarchical"
    }, {
      "@value" : "rdf"
    }, {
      "@value" : "json"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "RDF to JSON"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToJsonTemplate/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-rdftowrappedjsonldchunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-rdfToWrappedJsonLdChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "jsonld"
    }, {
      "@value" : "document"
    }, {
      "@value" : "wrap"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Chunked RDF to wrapped JSON-LD"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToWrappedJsonLdChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-shacl/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-shacl"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-shacl/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SHACL"
    }, {
      "@value" : "validation"
    }, {
      "@value" : "shape"
    }, {
      "@value" : "constraint"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/data"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/results"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/shapes"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SHACL"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/data",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Data"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Data"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/results",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Results"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Results"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0/shapes",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Shapes"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Shapes"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-shacl/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-shaclJena/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-shacl"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-shaclJena/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SHACL"
    }, {
      "@value" : "validation"
    }, {
      "@value" : "shape"
    }, {
      "@value" : "constraint"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/data"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/results"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/shapes"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SHACL Jena"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/data",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Data"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Data"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/results",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Results"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Results"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0/shapes",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Shapes"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Shapes"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-shaclJena/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-singleGraphUnion/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-singleGraphUnion/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-singlegraphunion"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-singleGraphUnion/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "merge"
    }, {
      "@value" : "rdf"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-singleGraphUnion/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-singleGraphUnion/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Union"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-singleGraphUnion/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-singleGraphUnion/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-singleGraphUnion/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-sparqlconstruct"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-sparqlConstruct/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "construct"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL construct"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-sparqlconstructchunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-sparqlConstructChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "construct"
    }, {
      "@value" : "chunk"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL construct chunked"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-sparqlconstructtofilelist"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-sparqlConstructToFileList/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "construct"
    }, {
      "@value" : "rdf"
    }, {
      "@value" : "split"
    }, {
      "@value" : "file"
    }, {
      "@value" : "sparql"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/task"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL construct to file list"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0/task",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/TaskList" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Tasks"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Tasks"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructToFileList/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-sparqllinkerchunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-sparqlLinkerChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "construct"
    }, {
      "@value" : "chunk"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/data"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/reference"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL linker chunked"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/data",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "DataRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Data"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0/reference",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "ReferenceRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Reference"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlLinkerChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-sparqlupdate"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-sparqlPerGraphUpdate/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "update"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL per graph update"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/GraphList", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/GraphList", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlPerGraphUpdate/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-sparqlselect"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-sparqlSelect/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "select"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL select"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelect/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelectMulti/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-sparqlSelectMultiple/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-sparqlselectmultiple"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-sparqlSelectMulti/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "select"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelectMulti/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelectMulti/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelectMulti/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL select multiple"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelectMulti/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelectMulti/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelectMulti/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlSelectMulti/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-sparqlupdate"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-sparqlUpdate/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "update"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL update"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-sparqlupdatechunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-sparqlUpdateChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "SPARQL"
    }, {
      "@value" : "update"
    }, {
      "@value" : "chunked"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL update chunked"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdateChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-streamCompression/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-streamcompression"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-streamCompression/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "gzip"
    }, {
      "@value" : "gz"
    }, {
      "@value" : "bz2"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Stream compression"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-streamCompression/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabular/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-tabular/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabular/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-tabular"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-tabular/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "csv"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabular/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabular/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabular/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Tabular"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabular/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabular/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabular/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabular/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-tabular/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularChunked/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-tabularChunked/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularChunked/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-tabularchunked"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-tabularChunked/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "csv"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularChunked/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularChunked/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularChunked/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Tabular chunked"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularChunked/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularChunked/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularChunked/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularChunked/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/Chunked", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularChunked/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-tabularUv/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-tabularodcs"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-tabularUv/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "csv"
    }, {
      "@value" : "tabular"
    }, {
      "@value" : "uv"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Tabular ODCS"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/GraphList", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-templatedxlstocsv"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-templatedXlsToCsv/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "xls"
    }, {
      "@value" : "csv"
    }, {
      "@value" : "template"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/data"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/templates"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Templated XLS to CSV"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/data",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Xls"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Data"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0/templates",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Templates"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Templates"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-unpack/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-unpack"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-unpack/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "unpack"
    }, {
      "@value" : "zip"
    }, {
      "@value" : "unzip"
    }, {
      "@value" : "decompress"
    }, {
      "@value" : "bzip2"
    }, {
      "@value" : "bz2"
    }, {
      "@value" : "gz"
    }, {
      "@value" : "gunzip"
    }, {
      "@value" : "7zip"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Decompress archive"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-unpack/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-unpackZip/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-unpackzip"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-unpackZip/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "unpack"
    }, {
      "@value" : "zip"
    }, {
      "@value" : "unzip"
    }, {
      "@value" : "decompress"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Decompress zip archive"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-unpackZip/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-valueParser/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-valueparser"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-valueParser/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "parser"
    }, {
      "@value" : "value"
    }, {
      "@value" : "object"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Value parser"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "http://etl.linkedpipes.com/components/t-xmlToChunks"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-xmlToChunks/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "xml"
    }, {
      "@value" : "chunk"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "XML to chunks transformer"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-xmlToChunks/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/t-xslt/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/t-xslt"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/t-xslt/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "xslt"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/parameters"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "XSLT transformer"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0/parameters",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Parameters"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Parameters"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-deleteDirectory/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#FFAAF3"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Executor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/x-deleteDirectory/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-deleteDirectory/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-deleteDirectory/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-deleteDirectory/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/x-deletedirectory"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/x-deleteDirectory/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "directory"
    }, {
      "@value" : "clear"
    }, {
      "@value" : "delete"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-valueParser/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Delete directory"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-deleteDirectory/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-deleteDirectory/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-deleteDirectory/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/x-deleteDirectory/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#FFAAF3"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Executor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/x-graphstorepurger"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/x-graphStorePurger/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "graph"
    }, {
      "@value" : "clear"
    }, {
      "@value" : "delete"
    }, {
      "@value" : "virtuoso"
    }, {
      "@value" : "purge"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/tasks"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Graph store purger"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0/tasks",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/TaskList" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Tasks"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Tasks"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/x-graphStorePurger/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#FFAAF3"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/x-httpRequest/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/x-httprequest"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/x-httpRequest/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "HTTP"
    }, {
      "@value" : "post"
    }, {
      "@value" : "delete"
    }, {
      "@value" : "update"
    }, {
      "@value" : "request"
    }, {
      "@value" : "head"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/configuration"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/input"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/task"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/output"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/reportOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "false"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP Request"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesInput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Input"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "FilesOutput"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/reportOutput",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "ReportRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Report"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0/task",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/TaskList" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Task"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Task"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/x-httpRequest/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#FFAAF3"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Executor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/x-virtuoso/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/x-virtuoso"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/x-virtuoso/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "virtuoso"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Virtuoso"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#FFAAF3"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Executor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0/configuration/desc"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0/dialog/template"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0/dialog/instance"
    }, {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/infoLink" : [ {
      "@id" : "https://etl.linkedpipes.com/components/x-virtuosoextractor"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/jars/x-virtuosoExtractor/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "virtuoso"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0/configuration"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://linkedpipes.com/ontology/supportControl" : [ {
      "@type" : "http://www.w3.org/2001/XMLSchema#boolean",
      "@value" : "true"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Virtuoso extractor"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0/configuration",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/RuntimeConfiguration" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Configuration"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Configuration"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0/dialog/instance",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "instance"
    } ]
  }, {
    "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0/dialog/template",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "template"
    } ]
  } ],
  "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuosoExtractor/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToCkanBatch/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToCkanBatch/0.0.0/configurationDescription"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToCkanBatch/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/jars/l-dcatAp11ToCkanBatch/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToCkanBatch/0.0.0/input"
    }, {
      "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToCkanBatch/0.0.0/codelists"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP to CKAN Batch"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToCkanBatch/0.0.0/codelists",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Codelists"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "EU MDR NALs"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToCkanBatch/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToCkanBatch/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Metadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP v1.1"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToCkanBatch/1.0.0/configurationDescription",
    "@type" : [ "http://linkedpipes.com/ontology/ConfigurationDescription" ],
    "http://linkedpipes.com/ontology/privateProperties" : [ {
      "@id" : "http://plugins.linkedpipes.com/ontology/l-dcatAp11ToCkanBatch#apiKey"
    } ]
  } ],
  "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToCkanBatch/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToDkanBatch/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CEF6D8"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Loader"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToDkanBatch/0.0.0/configurationDescription"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToDkanBatch/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/jars/l-dcatAp11ToDkanBatch/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToDkanBatch/0.0.0/input"
    }, {
      "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToDkanBatch/0.0.0/codelists"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP to DKAN Batch"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToDkanBatch/0.0.0/codelists",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Codelists"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "EU MDR NALs"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToDkanBatch/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToDkanBatch/0.0.0/input",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "Metadata"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DCAT-AP v1.1"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToDkanBatch/1.0.0/configurationDescription",
    "@type" : [ "http://linkedpipes.com/ontology/ConfigurationDescription" ],
    "http://linkedpipes.com/ontology/privateProperties" : [ {
      "@id" : "http://plugins.linkedpipes.com/ontology/l-dcatAp11ToDkanBatch#username"
    } ]
  } ],
  "@id" : "http://opendata.cz/resource/lp/etl/components/l-dcatAp11ToDkanBatch/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://opendata.cz/resource/lp/etl/components/x-ckanPurger/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#FFAAF3"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Executor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/x-ckanPurger/0.0.0/configurationDescription"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/x-ckanPurger/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/jars/x-ckanPurger/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "CKAN Purger"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/x-ckanPurger/0.0.0/configurationDescription",
    "@type" : [ "http://linkedpipes.com/ontology/ConfigurationDescription" ],
    "http://linkedpipes.com/ontology/privateProperties" : [ {
      "@id" : "http://plugins.linkedpipes.com/ontology/x-ckanPurger#apiKey"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/x-ckanPurger/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  } ],
  "@id" : "http://opendata.cz/resource/lp/etl/components/x-ckanPurger/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://opendata.cz/resource/lp/etl/components/x-dkanPurger/0.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#FFAAF3"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Executor"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/x-dkanPurger/0.0.0/configurationDescription"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/x-dkanPurger/0.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/jars/x-dkanPurger/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "DKAN Purger"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/x-dkanPurger/0.0.0/configurationDescription",
    "@type" : [ "http://linkedpipes.com/ontology/ConfigurationDescription" ],
    "http://linkedpipes.com/ontology/privateProperties" : [ {
      "@id" : "http://plugins.linkedpipes.com/ontology/x-dkanPurger#username"
    }, {
      "@id" : "http://plugins.linkedpipes.com/ontology/x-dkanPurger#password"
    } ]
  }, {
    "@id" : "http://opendata.cz/resource/lp/etl/components/x-dkanPurger/0.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  } ],
  "@id" : "http://opendata.cz/resource/lp/etl/components/x-dkanPurger/0.0.0"
}, {
  "@graph" : [ {
    "@id" : "http://opendata.cz/resources/components/t-fdpToRdf/1.0.0",
    "@type" : [ "http://linkedpipes.com/ontology/JarTemplate" ],
    "http://linkedpipes.com/ontology/color" : [ {
      "@value" : "#CED8F6"
    } ],
    "http://linkedpipes.com/ontology/componentType" : [ {
      "@id" : "http://etl.linkedpipes.com/ontology/component/type/Transformer"
    } ],
    "http://linkedpipes.com/ontology/configurationDescription" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/components/t-fdpToRdf/0.0.0/configurationDescription"
    } ],
    "http://linkedpipes.com/ontology/dialog" : [ {
      "@id" : "http://opendata.cz/resources/components/t-fdpToRdf/1.0.0/dialog/config"
    } ],
    "http://linkedpipes.com/ontology/jar" : [ {
      "@id" : "http://opendata.cz/resource/lp/etl/jars/t-fdpToRdf/0.0.0"
    } ],
    "http://linkedpipes.com/ontology/keyword" : [ {
      "@value" : "FDP"
    } ],
    "http://linkedpipes.com/ontology/port" : [ {
      "@id" : "http://opendata.cz/resources/components/t-fdpToRdf/1.0.0/inputRdf"
    }, {
      "@id" : "http://opendata.cz/resources/components/t-fdpToRdf/1.0.0/inputFiles"
    }, {
      "@id" : "http://opendata.cz/resources/components/t-fdpToRdf/1.0.0/output"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "FDP to RDF"
    } ]
  }, {
    "@id" : "http://opendata.cz/resources/components/t-fdpToRdf/1.0.0/dialog/config",
    "@type" : [ "http://linkedpipes.com/ontology/Dialog" ],
    "http://linkedpipes.com/ontology/name" : [ {
      "@value" : "config"
    } ]
  }, {
    "@id" : "http://opendata.cz/resources/components/t-fdpToRdf/1.0.0/inputFiles",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputFiles"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "CSV Files"
    } ]
  }, {
    "@id" : "http://opendata.cz/resources/components/t-fdpToRdf/1.0.0/inputRdf",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/sesame/1.0/rdf/SingleGraph", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Input" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "InputRdf"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "FDP Metadata"
    } ]
  }, {
    "@id" : "http://opendata.cz/resources/components/t-fdpToRdf/1.0.0/output",
    "@type" : [ "http://linkedpipes.com/ontology/dataUnit/system/1.0/files/DirectoryMirror", "http://linkedpipes.com/ontology/Port", "http://linkedpipes.com/ontology/Output" ],
    "http://linkedpipes.com/ontology/binding" : [ {
      "@value" : "OutputFile"
    } ],
    "http://linkedpipes.com/ontology/requirement" : [ {
      "@id" : "http://linkedpipes.com/resources/requirement/workingDirectory"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Output"
    } ]
  } ],
  "@id" : "http://opendata.cz/resources/components/t-fdpToRdf/1.0.0"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1477933151253",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1477933151253/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0"
    } ],
    "http://purl.org/dc/terms/description" : [ {
      "@value" : "qqqqq"
    } ],
    "http://www.w3.org/2004/02/skos/core#note" : [ {
      "@value" : "qqqqq"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL construct template"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1477933151253"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1477934791533",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1477934791533/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1477933151253"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Second level SPARQL construct template"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1477934791533"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479732536330",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479732536330/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "L-FilesToScp (COMSODE zipped)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479732536330"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479732536334",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479732536334/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "L-FilesToScp (COMSODE unzipped)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479732536334"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922804",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922804/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[MFČR] Internal Dumps"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922804"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922843",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922843/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Q-AfterLinkageNotEmpty"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922843"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922845",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922845/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Tabular [MFČR] Rozvaha"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922845"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922853",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922853/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[MFČR] Číselníky (new)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922853"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922855",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922855/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Q-TabularOutputNotEmpty"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922855"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922857",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922857/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[MFČR] Internal to Load"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922857"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922860",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922860/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/q-sparqlAsk/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Q-FromSimpleRDFNotEmpty"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1479744922860"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305301",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305301/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Věková kategorie, Skupina podle věku (vekova-kategorie) 1-4, 5-9, ....90-94"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305301"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305317",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305317/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Věková kategorie, Skupina podle věku (vekova-kategorie) 0.0"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305317"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305318",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305318/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Soubor s koncepty na disk"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305318"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305320",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305320/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-templatedXlsToCsv/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "cssz-xls2csv-v2"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305320"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305321",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305321/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - bez ohledu na rok a verzi důchodové hierarchie, speciální případy (druh-duchodu) (Starobní důchody bez SR)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305321"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305322",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305322/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Mesíční výše důchodu (mesicni-vyse-duchodu) (mesicni vyse duchodu Total)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305322"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305324",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305324/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Skupina Osob (skupina-osob) G_Insured"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305324"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305325",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305325/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Statistický důvod zániku důchodu (duvod-zaniku-duchodu) neuvedeno"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305325"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305326",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305326/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní důchody (druh-duchodu, PK_old_age) (Starobní důchody včetně SR)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305326"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305328",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305328/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční oblast - kraj (refArea) Stredocesky"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305328"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305329",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305329/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Získat Concept schemes"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305329"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305331",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305331/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ]  Smaž nastavenou verzi hierarchie druhů důchodu z výstupních dat"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305331"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305333",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305333/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - ostatní (druh-duchodu)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305333"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305335",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305335/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Věková kategorie, Skupina podle věku (vekova-kategorie) NEUDÁNO"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305335"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305337",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305337/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Výše osobního vyměřovacího základu (vyse-osobniho-vymerovaciho-zakladu) I_GE"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305337"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305339",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305339/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Skupina Osob (skupina-osob) G_PensionersNonOrphans"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305339"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305341",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305341/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní a invalidní důchody - vybrané typy (druh-duchodu) (Starobní důchod sólo (S, SI, ST, SD))"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305341"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305343",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305343/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "RUIAN: VÚSC"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305343"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305346",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305346/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní a invalidní důchody - vybrané typy (druh-duchodu) (Celkem vcetne netypických výplat)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305346"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305348",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305348/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní důchody (druh-duchodu, PK_old_age) (Starobní důchody sólo (S, SI, ST, SD))"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305348"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305350",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305350/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Věková kategorie, Skupina podle věku (vekova-kategorie) 0-95+"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305350"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305352",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305352/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-singleGraphUnion/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "t-graphMerger"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305352"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305354",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305354/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Skupina Osob (skupina-osob) G_Y_LE19"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305354"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305356",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305356/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Doplň dimenzi \"measureType\" pro relevantní datasety s více metrikami (def-dc-penze:duchodci-prehled-cr (8.1))"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305356"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305357",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305357/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční oblast - kraj (refArea) Jihomoravsky"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305357"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305359",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305359/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní a invalidní důchody - vybrané typy (druh-duchodu) (Invalidní důchod sólo (IP, ID, IT))"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305359"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305362",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305362/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Vlož popisek roku (rok-zaniku-duchodu)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305362"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305364",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305364/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní a invalidní důchody - vybrané typy (druh-duchodu) (Netypicke vyplaty)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305364"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305366",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305366/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční oblast - okres (refArea) Generic"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305366"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305368",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305368/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Statistický důvod změny invalidního důchodu (duvod-zmeny-invalidniho-duchodu)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305368"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305370",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305370/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční oblast - okres (refArea) Ostrava"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305370"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305372",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305372/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Mesíční výše důchodu (mesicni-vyse-duchodu) (mesicni vyse duchodu Neudano)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305372"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305374",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305374/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní důchody (druh-duchodu, PK_old_age) (Starobní důchody S, SI, SRN, ST, SD, SR celkem)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305374"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305376",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305376/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční oblast - okres (refArea) Benesov"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305376"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305378",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305378/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Odstraň diakritiku z metrik ve vstupních datech"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305378"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305380",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305380/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Pohlaví (pohlavi) F"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305380"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305382",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305382/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Skupiny diagnóz dle WHO (skupina-diagnoz-dle-who) WHO Total"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305382"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305384",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305384/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Pohlaví (pohlavi) M"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305384"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305386",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305386/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Vytvoř pozorování datových kostek ze zdrojových CSV dat"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305386"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305388",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305388/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční období - stav k (refPeriod)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305388"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305390",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305390/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Pohlaví (pohlavi) T"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305390"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305392",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305392/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Skupina Osob (skupina-osob) G_O"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305392"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305393",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305393/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Statistický důvod zániku důchodu (duvod-zaniku-duchodu) Total"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305393"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305395",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305395/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Výše osobního vyměřovacího základu (vyse-osobniho-vymerovaciho-zakladu) NEUDANO"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305395"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305398",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305398/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní důchody (druh-duchodu, PK_old_age) (Starobní důchod sólo (S, ST, SD))"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305398"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305400",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305400/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Doplň dimenzi \"measureType\" pro relevantní datasety s více metrikami (def-dc-penze:casove-rady-grafy-1-6)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305400"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305402",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305402/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Výše osobního vyměřovacího základu (vyse-osobniho-vymerovaciho-zakladu) I"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305402"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305403",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305403/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Skupina Osob (skupina-osob) G_T"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305403"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305405",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305405/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní důchody (druh-duchodu, PK_old_age) (Starobní důchody S, SRN, ST, SD celkem)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305405"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305407",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305407/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Pokud existuje napojení pozorování na vyšší územní samosprávný celek \"Praha\", přidej napojení na okres \"Praha\""
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305407"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305409",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305409/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Věková kategorie, Skupina podle věku (vekova-kategorie) 95+, 90+"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305409"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305411",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305411/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesToRdf/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "uv-t-filesToRdf"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305411"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305413",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305413/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Vlož popisek roku (stav-k)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305413"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305415",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305415/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní a invalidní důchody - vybrané typy (druh-duchodu) (VM-CELKEM 2010+)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305415"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305417",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305417/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní a invalidní důchody - vybrané typy (druh-duchodu) ( V-CELKEM 2010+)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305417"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305419",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305419/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - bez ohledu na rok a verzi důchodové hierarchie, speciální případy (druh-duchodu) (Starobní důchody včetně SR)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305419"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305421",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305421/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] xls2csv XLS template filter"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305421"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305423",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305423/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Skupiny diagnóz dle WHO (skupina-diagnoz-dle-who) WHO"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305423"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305425",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305425/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Doplň dimenzi \"measureType\" pro relevantní datasety s více metrikami (def-dc-penze:casove-rady-grafy-7-8)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305425"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305434",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305434/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní důchody (druh-duchodu, PK_old_age) (Starobní důchody S, SI, SRN, ST, SD celkem)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305434"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305436",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305436/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní důchody (druh-duchodu, PK_old_age) (Starobní důchody S, SRN, ST, SD, SR celkem)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305436"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305438",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305438/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-tabularUv/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Tabular to RDF"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305438"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305441",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305441/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční období - rok (refPeriod)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305441"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305443",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305443/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční oblast - kraj (refArea) generic"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305443"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305444",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305444/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní a invalidní důchody - vybrané typy (druh-duchodu) (Celkem bez sirotčích důchodů a netypických výplat)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305444"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305445",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305445/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční oblast - stát (refArea)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305445"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305446",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305446/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Kvantil (kvantily-relativni-vyse-duchodu)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305446"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305448",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305448/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Výše osobního vyměřovacího základu (vyse-osobniho-vymerovaciho-zakladu) Total"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305448"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305449",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305449/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Rok zániku důchodu (rok-zaniku-duchodu)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305449"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305450",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305450/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-filesFilter/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] xls2csv XLS file filter"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305450"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305452",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305452/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Vlož popisek roku (refPeriod)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305452"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305454",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305454/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní a invalidní důchody - vybrané typy (druh-duchodu) (Celkem bez netypických výplat)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305454"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305456",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305456/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Skupiny diagnóz dle WHO (skupina-diagnoz-dle-who) WHO NEZARAZENO"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305456"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305457",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305457/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční oblast - kraj (refArea) Vysocina"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305457"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305459",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305459/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Získat DSDs"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305459"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305460",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305460/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Statistický důvod zániku důchodu (duvod-zaniku-duchodu) duvod zaniku"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305460"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305461",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305461/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Mesíční výše důchodu (mesicni-vyse-duchodu) (mesicni vyse duchodu 2500 +)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305461"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305462",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305462/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "RUIAN: Okresy a správní obvody"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305462"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305465",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305465/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Referenční oblast - kraj (refArea) Praha"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305465"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305467",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305467/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Mesíční výše důchodu (mesicni-vyse-duchodu) (mesicni vyse duchodu 2 500-3 000)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305467"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305468",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305468/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Fix Observations IRIs"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305468"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305469",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305469/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlUpdate/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "[CSSZ] Dimenze Druh důchodu - starobní a invalidní důchody - vybrané typy (druh-duchodu) (Starobni duchody vcetne SR)"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1480504305469"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687058881",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687058881/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0"
    } ],
    "http://purl.org/dc/terms/description" : [ {
      "@value" : ""
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Virtuoso Gov.cz"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687058881"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687166290",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687166290/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687058881"
    } ],
    "http://purl.org/dc/terms/description" : [ {
      "@value" : ""
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Virtuoso Gov.cz EU číselníky"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687166290"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687297569",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687297569/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0"
    } ],
    "http://purl.org/dc/terms/description" : [ {
      "@value" : ""
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to SCP Gov.cz"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687297569"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687355000",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687355000/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687297569"
    } ],
    "http://purl.org/dc/terms/description" : [ {
      "@value" : ""
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to SCP Gov.cz EU číselníky"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1487687355000"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1492610177507",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1492610177507/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-rdfToFile/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "RDF to file"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1492610177507"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1495632608407",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1495632608407/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-voidDataset/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "fake VoID Dataset"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1495632608407"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1499760975884",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1499760975884/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files from local template"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1499760975884"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1499768137591",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1499768137591/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-filesFromLocal/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Termplate for New Files from local"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1499768137591"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1501847202243",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1501847202243/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-htmlCssUv/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTML CSS ODCS"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1501847202243"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1503059115877",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1503059115877/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get test template"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1503059115877"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1503059792312",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1503059792312/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Text holder"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1503059792312"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1505478127941",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1505478127941/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1505478127941"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1509691107598",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1509691107598/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1509691107598"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1517971783360",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1517971783360/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to local"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1517971783360"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1519816576399",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1519816576399/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Přístupnost budov SPARQL Construct"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1519816576399"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1523705477904",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1523705477904/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstructChunked/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL construct chunked template"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1523705477904"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1525595252699",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1525595252699/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get name"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1525595252699"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1540809692629-2b88acbc-660b-4368-ba8a-f1cbdafedd1d",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1540809692629-2b88acbc-660b-4368-ba8a-f1cbdafedd1d/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToScp/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to SCP - localhost"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1540809692629-2b88acbc-660b-4368-ba8a-f1cbdafedd1d"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1540809692640-4fa1ce41-5e48-4c50-8bc9-fe22929159cd",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1540809692640-4fa1ce41-5e48-4c50-8bc9-fe22929159cd/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/x-virtuoso/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Virtuoso - Background data"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1540809692640-4fa1ce41-5e48-4c50-8bc9-fe22929159cd"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1547209258502-7fd40354-bea4-44de-9d75-150686f14ade",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1547209258502-7fd40354-bea4-44de-9d75-150686f14ade/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get - testte"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1547209258502-7fd40354-bea4-44de-9d75-150686f14ade"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1556993751398-dfae66e9-2ee7-4734-9073-6791e833a2f2",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1556993751398-dfae66e9-2ee7-4734-9073-6791e833a2f2/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-filesToLocal/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Files to local"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1556993751398-dfae66e9-2ee7-4734-9073-6791e833a2f2"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1563797175008-66dd9f9a-b577-4af2-bba3-63228288a883",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1563797175008-66dd9f9a-b577-4af2-bba3-63228288a883/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get template"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1563797175008-66dd9f9a-b577-4af2-bba3-63228288a883"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1565947056423-e2e07309-dfd4-4ff4-b648-e4793cfe9fe1",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1565947056423-e2e07309-dfd4-4ff4-b648-e4793cfe9fe1/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/l-wikibase/0.0.0"
    } ],
    "http://purl.org/dc/terms/description" : [ {
      "@value" : "Workshop credentials"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Wikibase loader"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1565947056423-e2e07309-dfd4-4ff4-b648-e4793cfe9fe1"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1575542745923-b0492029-8abc-4eaf-835f-c4118d645e92",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1575542745923-b0492029-8abc-4eaf-835f-c4118d645e92/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-sparqlConstruct/0.0.0"
    } ],
    "http://purl.org/dc/terms/description" : [ {
      "@value" : "If we know about superclasses of classes in type assertions, add those superclasses as explicit statements"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Infer superclasses"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1575542745923-b0492029-8abc-4eaf-835f-c4118d645e92"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1582879869540-084bc25c-108e-4044-9103-f6c2b070a845",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1582879869540-084bc25c-108e-4044-9103-f6c2b070a845/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/t-xslt/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "XSLT transformer"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1582879869540-084bc25c-108e-4044-9103-f6c2b070a845"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1595943704224-15498276-709d-4895-98fd-46e68902229b",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1595943704224-15498276-709d-4895-98fd-46e68902229b/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Test"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1595943704224-15498276-709d-4895-98fd-46e68902229b"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1601415449096-8aa60c5d-ba3f-4cc2-8577-eabc203370bf",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1601415449096-8aa60c5d-ba3f-4cc2-8577-eabc203370bf/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0"
    } ],
    "http://purl.org/dc/terms/description" : [ {
      "@value" : "DCAT-AP dump"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1601415449096-8aa60c5d-ba3f-4cc2-8577-eabc203370bf"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1605910509542-065ff051-e5b5-40d1-a908-60da11fa8047",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1605910509542-065ff051-e5b5-40d1-a908-60da11fa8047/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-httpGetFile/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1605910509542-065ff051-e5b5-40d1-a908-60da11fa8047"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1605910564993-56c2f89d-7083-417a-9f96-5688d20f743f",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1605910564993-56c2f89d-7083-417a-9f96-5688d20f743f/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1605910509542-065ff051-e5b5-40d1-a908-60da11fa8047"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "HTTP get"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1605910564993-56c2f89d-7083-417a-9f96-5688d20f743f"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1605910739364-b7ba6718-c315-4349-a4b4-acd91ecba03b",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1605910739364-b7ba6718-c315-4349-a4b4-acd91ecba03b/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-textHolder/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "Text holder"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1605910739364-b7ba6718-c315-4349-a4b4-acd91ecba03b"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1611736251248-d72f278e-7ac0-4864-b5c2-10bc5972a803",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1611736251248-d72f278e-7ac0-4864-b5c2-10bc5972a803/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint #1"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1611736251248-d72f278e-7ac0-4864-b5c2-10bc5972a803"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1612362379996-df7525b8-75b1-4dc3-b270-7a75d092aee0",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1612362379996-df7525b8-75b1-4dc3-b270-7a75d092aee0/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpointSelect/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint select"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1612362379996-df7525b8-75b1-4dc3-b270-7a75d092aee0"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1612418709745-70d6071f-165a-490e-8b9d-8c8ebbc58f87",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1612418709745-70d6071f-165a-490e-8b9d-8c8ebbc58f87/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint #2"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1612418709745-70d6071f-165a-490e-8b9d-8c8ebbc58f87"
}, {
  "@graph" : [ {
    "@id" : "https://demo.etl.linkedpipes.com/resources/components/1612430202262-c884dfbb-3464-4f4f-8887-ac7ec00062fa",
    "@type" : [ "http://linkedpipes.com/ontology/Template" ],
    "http://linkedpipes.com/ontology/configurationGraph" : [ {
      "@id" : "https://demo.etl.linkedpipes.com/resources/components/1612430202262-c884dfbb-3464-4f4f-8887-ac7ec00062fa/configuration"
    } ],
    "http://linkedpipes.com/ontology/template" : [ {
      "@id" : "http://etl.linkedpipes.com/resources/components/e-sparqlEndpoint/0.0.0"
    } ],
    "http://www.w3.org/2004/02/skos/core#prefLabel" : [ {
      "@value" : "SPARQL endpoint"
    } ]
  } ],
  "@id" : "https://demo.etl.linkedpipes.com/resources/components/1612430202262-c884dfbb-3464-4f4f-8887-ac7ec00062fa"
} ]
  ''';
}
