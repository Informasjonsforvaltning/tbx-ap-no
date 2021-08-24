<?xml version="1.0" encoding="UTF-8"?>
<!-- VERSION HISTORY
sist oppdatert: 2019-01-09
status: til utprøving 
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:sqf="http://www.schematron-quickfix.com/validator/process" queryBinding="xslt2">
  <ns uri="urn:iso:std:iso:30042:ed:3.0" prefix="tbx"/>
  <pattern id="coreEnforecement">
    <rule context="tbx:termNote">
      <assert test="parent::tbx:termSec or parent::tbx:termNoteGrp/parent::tbx:termSec">Any termNote is only allowed at the termSec level.</assert>
    </rule>
    <rule context="tbx:*[@type]">
      <assert test="@type != ''">Data category must be declared.  If no permitted data categories are listed in the grammar schema, blank values are also not allowed.</assert>
    </rule>
  </pattern>
  <pattern id="dialectEnforcement">
    <rule context="tbx:tbx">
      <assert test="attribute::type='TBX-AP-No'">The name of this dialect should be TBX-AP-No</assert>
      <assert test="attribute::style='dca'">The style of this dialect should be declared as 'dca'</assert>
    </rule>
    <rule context="*[not(namespace-uri() = 'urn:iso:std:iso:30042:ed:3.0')]">
      <assert test="false()">DCT style elements are not permitted in DCA style TBX.</assert>
    </rule>
  </pattern>
  <!-- - - - - - - -.Difi.Module Rules, in alphabetic order  - - - - - - - -->
  <pattern id="module.Difi.amin">
    <rule context="tbx:admin[@type='forholdTilKilde']">
      <!-- Betydningsbeskrivelse.kildebeskrivelse.forholdTilKilde -->
      <assert test="parent::tbx:adminGrp/parent::tbx:descripGrp/parent::tbx:langSec">'forholdTilKilde' may only appear in an adminGrp in a descripGrp at the langSec level</assert>
      <assert test=".='sitatFraKilde' or .='basertPåKilde' or .='egendefinert'">Permitted values are: 'sitatFraKilde', 'basertPåKilde', 'egendefinert'</assert>
    </rule>
    <rule context="tbx.admin[@type='identifikator']">
      <!-- Begrep.identifikator -->
      <assert test="parent::tbx:conceptEntry">'identifikator' may only appear at the conceptEntry level</assert>
    </rule>
  </pattern>
  <pattern id="module.Difi.adminNote">
    <rule context="tbx:adminNote[@type='kilde']">
      <!-- Betydeningsbeskrivelse.kildebeskrivelse.kilde.tekst -->
      <assert test="parent::tbx:adminGrp/parent::tbx:descripGrp/parent::tbx:langSec">'kilde' may only appear in an adminGrp in a descripGrp at the langSec level</assert>
    </rule>
  </pattern>
  <pattern id="module.Difi.descrip">
    <rule context="tbx:descrip[@type='alternativFormulering']">
      <!-- Begrep.alternativFormulering -->
      <assert test="parent::tbx:langSec or parent::tbx:descripGrp/parent::tbx:langSec">'alternativFormulering' may only appear at the langSec level, or in a descripGrp at the langSec level</assert>
    </rule>
    <rule context="tbx:descrip[@type='bruksområde']">
      <!-- Begrep.bruksområde -->
      <assert test="parent::tbx:langSec">'bruksområde' may only appear at the langSec level</assert>
    </rule>
    <rule context="tbx:descrip[@type='definisjon']">
      <!-- Begrep.definisjon -->
      <assert test="parent::tbx:langSec or parent::tbx:descripGrp/parent::tbx:langSec">'definisjon' may only appear at the langSec level, or in a descripGrp at the langSec level</assert>
    </rule>
    <rule context="tbx:descrip[@type='fagområde']">
      <!-- Begrep.fagområde -->
      <assert test="parent::tbx:langSec">'fagområde' may only appear at the langSec level</assert>
    </rule>
    <rule context="tbx:descrip[@type='typeRelasjon']">
      <!-- for å skille mellom Begrep.assosiativRelasjon; Begrep.generiskRelasjon; Begrep.partitivRelasjon -->
      <assert test="parent::tbx:descripGrp/parent::tbx:langSec">'typeRelasjon' may only appear in a descripGrp at the langSec level</assert>
      <assert test=".='assosiativRelasjon'  or .='generiskRelasjon' or .='partitivRelasjon'">Permitted values are: 'assosiativRelasjon', 'generiskRelasjon', 'partitivRelasjon'</assert>
      <!-- her har vi valgt å være strengere enn nødvendig, ved å plassere generiske og partitive relasjoner også under langSec (tekstlig 'inndelingskriterium' er valgfritt) -->
    </rule>
  </pattern>
  <pattern id="module.Difi.descripNote">
    <rule context="tbx:descripNote[@type='beskrivelse']">
      <!-- AssosiativRelasjon.beskrivelse  -->
      <assert test="parent::tbx.descripGrp/parant::tbx:langSec">'beskrivelse' may only appear in a descripGrp at the langSec level</assert>
    </rule>
    <rule context="tbx:descrip[@type='eksempel']">
      <!-- Begrep.eksempel -->
      <assert test="parent::tbx.descripGrp/parant::tbx:langSec">'eksempel' may only appear in a descripGrp at the langSec level</assert>
    </rule>
    <rule context="tbx:descripNote[@type='inndelingskriterium']">
      <!-- GeneriskRelasjon.inndelingskriterium;  PartitivRelasjon.inndelingskriterium -->
      <assert test="parent::tbx.descripGrp/parant::tbx:langSec">'inndelingskreterium' may only appear in a descripGrp at the langSec level</assert>
    </rule>
    <rule context="tbx:descripNote[@type='merknad']">
      <!-- Betydningsbeskrivelse.merknad -->
      <assert test="parent::tbx.descripGrp/parant::tbx:langSec">'merknad' may only appear in a descripGrp at the langSec level</assert>
    </rule>
    <rule context="tbx:descripNote[@type='målgruppe']">
      <!-- Betydningsbeskrivelse.målgruppe -->
      <assert test="parent::tbx.descripGrp/parant::tbx:langSec">'målgruppe' may only appear in a descripGrp at the langSec level</assert>
      <assert test=".='allmennheten' or .='fagspesialist'">Permitted values: 'allmennheten', 'fagspesialist'</assert>
    </rule>
    <rule context="tbx:descrip[@type='omfang']">
      <!-- Betydningsbeskrivelse.omfang.tekst -->
      <assert test="parent::tbx.descripGrp/parant::tbx:langSec">'omfang' may only appear in a descripGrp at the langSec level</assert>
    </rule>
  </pattern>
  <pattern id="module.Difi.p">
    <rule context="tbx:p[@type='ansvarligVirksomhet']">
      <!-- Begrepssamling.ansvarligVirksomhet -->
      <assert test="parrent::tbx.sourceDesc">'ansvarligVirksomhet' may only appear at the sourceDesc level</assert>
    </rule>
    <rule context="tbx:p[@type='identifikator']">
      <!-- Begrepssamling.identifikator -->
      <assert test="parrent::tbx.sourceDesc">'identifikator' may only appear at the sourceDesc level</assert>
    </rule>
    <rule context="tbx:p[@type='kontaktpunkt']">
      <!-- Begrepssamling.kontaktpunkt -->
      <assert test="parrent::tbx.sourceDesc">'kontaktpunkt' may only appear at the sourceDesc level</assert>
    </rule>
  </pattern>
  <pattern id="module.Difi.termNote">
    <rule context="tbx:termNote[@type='målgruppe']">
      <!-- TillattTerm.målgruppe -->
      <assert test=".='allmennheten' or .='fagspesialist'">Permitted values: 'allmennheten', 'fagspesialist'</assert>
    </rule>
    <rule context="tbx:termNote[@type='typeTerm']">
      <!-- for å skille mellom Begrep.anbefaltTerm, Begrep.tillattTerm og Begrep.frarådetTerm -->
      <assert test=".='anbefaltTerm' or .='tillattTerm' or .='frarådetTerm' or .='datastrukturterm'">Permitted values: 'anbefaltTerm', 'tillattTerm', 'frarådetTerm', 'datastrukturterm'</assert>
    </rule>
  </pattern>
  <pattern id="module.Difi.transac">
    <rule context="tbx:transac[@type='ansvarligVirksomhet']">
      <!-- Begrep.ansvarligVirksomhet -->
      <assert test="parent::tbx:langSec or parent::tbx:transacGrp/parent::tbx:conceptEntry">'ansvarligVirksomhet' may only appear at the conceptEntry level in a transacGrp at the conceptEntry level</assert>
    </rule>
    <rule context="tbx:transac[@type='typeDato']">
      <!-- for å skille mellom de ulike typer datoer: gyldigFraOgMed, gyldigTilOgMed og sistOppdatert -->
      <assert test="parent::tbx.transacGrp">'typeDato' may only appear in a transacGrp</assert>
      <assert test=".='gyldigFraOgMed' or .='gyldigTilOgMed' or .='sistOppdatert'">Permitted values: 'gyldigFraOgMed', 'gyldigTilOgMed', 'sistOppdatert'</assert>
      <!-- her kunne vi ha vært mer detaljert, f.eks. gyldigTilOgMed og gyldigFraOgMed bare kan brukes på Begrep og dermed bare conceptEntry -->
    </rule>
  </pattern>
  <pattern id="module.Difi.transacNote">
    <rule context="tbx:transacNote[@type='kontaktpunkt']">
      <!-- Begrep.kontaktpunkt -->
      <assert test="parent::tbx:transacGrp/parent::tbx:conceptEntry">'kontaktpunkt' may only appear in a transacGrp at the conceptEntry level</assert>
    </rule>
  </pattern>
  <pattern id="module.Difi.xref">
    <rule context="tbx:xref[@type='assosiertBegrep']">
      <!-- Begrepsrelasjon.assosiertBegrep  -->
      <assert test="parent::tbx:descripGrp/parent::tbx:langSec">'assosiertBegrep' may only appear in a descripGrp at the langSec level</assert>
    </rule>
    <rule context="tbx:xref[@type='erstatter']">
      <!-- Begrep.erstatter -->
      <assert test="parent::tbx:conceptEntry">'erstatter' may only appear  at the conceptEntry level</assert>
    </rule>
    <rule context="tbx:xref[@type='erstattesAv']">
      <!-- Begrep.erstattesAv -->
      <assert test="parent::tbx:conceptEntry">'erstattesAv' may only appear  at the conceptEntry level</assert>
    </rule>
    <rule context="tbx:xref[@type='kilde'">
      <!-- Betydningsbeskrivelse.kildebeskrivelse.kilde.URI -->
      <assert test="parent::tbx:adminGrp/parent::tbx:descripGrp/parent::tbx:langSec">'kilde' may only appear in an adminGrp in a descripGrp at the langSec level</assert>
    </rule>
    <rule context="tbx:xref[@type='omfang']">
      <!-- Betydningsbeskrivelse.omfang.URI -->
      <assert test="parent::tbx:descripGrp/parent::tbx:langSec">'omfang' may only appear at in a descripGrp at the langSec level</assert>
    </rule>
    <rule context="tbx:xref[@type='overordnetBegrep']">
      <!-- Begrepsralasjon.overordnetBegrep -->
      <assert test="parent::tbx:descripGrp/parent::tbx:langSec">'overordnetBegrep' may only appear in a descripGrp at the langSec level</assert>
    </rule>
    <rule context="tbx:xref[@type='seOgså']">
      <!-- Begrep.erstattesAv -->
      <assert test="parent::tbx:conceptEntry">'seOgså' may only appear  at the conceptEntry level</assert>
    </rule>
    <rule context="tbx:xref[@type='underordnetBegrep']">
      <!-- Begrepsrelasjon.underordnetBegrep -->
      <assert test="parent::tbx:descripGrp/parent::tbx:langSec">'underordnetBegrep' may only appear in a descripGrp at the langSec level</assert>
    </rule>
  </pattern>
</schema>
